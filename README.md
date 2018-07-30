# ableC-lvars

## To-do:

### Urgent:

#### Big Example:

+ Create big array of customers (?) and read through the array
+ Get rid of dependence on number of customers and number of stores/store data entries
+ Add frees as needed

#### POPL Paper:

+ Future work-- way to nicely implement sets for unknown data type for users to access without set-up, other "pre-fab" data structures
+ Add in stuff with running example

"But suppose that we want to concurrently insert two strings that happen to share a prefix — suppose, for instance, that one thread is trying to insert '1100' while another is trying to insert '1111'. Now we have a dilemma. If one thread writes into the topmost IVar for 1, but the other thread has gotten there first and done its insertion, we’ll raise a multiple-put error. So we need to check for emptiness before doing a write — but there’s no way to do so, since the only deterministic way to read from an IVar is to make a get call that will block until the IVar is full. So, each thread will have to block waiting for the other — even though the result of the two writes would be the same regardless of the order in which they occurred. If we were using LVars instead of IVars, then the two inserting threads could happily race to write their shared prefix, with no risk of nondeterminism, since they’d both be writing the same thing!"

+ Need examples with no side effects (yikes) until after syncing

Guarantees of determinism don't hold with side-effects: "We define a program to be deterministic if, given the same inputs, it will always produce the same observable result. Here, inputs are votes, and we define the observable result of a program to be the value to which it evaluates. We’ve therefore cheated a bit with our call to call_for_pizza, since it triggers a side effect, and our determinism guarantee doesn’t say anything about side effects."

+ It's hard for me, at least, to see why determinism with sets of integers is important. If you think an example with ADTs is better, go ahead and put it in; we can figure out how to make it look nice later. You can elide code that isn't critical like "... // check that n1/n2 are within acceptable bounds" or something. Even if you have to break it into two figures, that's fine for now.
+ Think about big example-- maybe reading data from large files into a database-type structure, with Cilk?

#### Other:
+ Implement better cilk examples (Read from different files? Sum random numbers until they reach a certain point? A better set example?) Bitwise or? Check out Cilk paper
+ Look over and tidy up examples and header file (to work better with new set up)
+ Fix top <= top in examples and tests
+ Add locks where needed in header file

### Less urgent:

+ Work on speeding up thread waiting/locking process
+ Add freezing examples
+ Lvars as global variables?
+ Implement more prefab lattices
+ Update readme to include new examples and the addition of freezing
+ Could overload get so that if no threshold is specified, defaults to bottom element?
+ Would it be better to create a set "template" based on C arrays instead of algebraic datatypes (more space-efficient)?
+ If an update would take the state of an lvar to top(), should the update just not be performed, or should the program error out? Or should this depend on the debug mode? Does this affect determinism?
+ Is there a way to error out only on the first missing include of a header?
+ Better positive tests
+ Check on leq with freezing-- do I need to check further?
+ Implement getFst and getSnd to help users avoid creating threshold sets/activation sets
+ Implement other Lvish features

## Guide:

### Part 1: Lattice Components.

Each lvar, activation set, and threshold set is tied to a "lattice," which prescribes how individual elements are ordered with respect to one another. To create a lattice, a programmer must define several components:

#### A data type with a bottom and top element.

The "bottom" element must be "below" every other element in the lattice with respect to the lattice's ordering, and generally represents an "empty" state where no information is yet known. The "top" element represents an "error" state, and must be "above" every other element in the lattice with respect to the lattice's order. 

Ex. The file `int.xc` features C's built-in signed `int` type, with bottom `0` and top `100`, as well as C's built-in `double` type, with bottom `0.0` and top `100.0`.

Ex. The file `and.xc` features a `State*` type, with bottom `Pair(Bot(), Bot())` and top `Top()`.

Ex. The file `pizza.xc` features a `VoteSet*` type, with bottom `Empty()` and top `Top()`.

#### A leq function to determine the order of elements in the lattice.

This function must take as arguments two elements of the lattice's base type. The leq function should return `1` (true) if the first element is at or below the second element in the lattice, and should return `0` (false) otherwise. An element is defined to be "at or below" another element if the second element can be reached, in a series of additive operations (however that is defined for the base type) from the first element. The bottom element is at or below every other element, and every element is at or below the top element. In particular, this function must return `0` if the first element is the top element, regardless of the second element, `1` if the first element is the bottom element, regardless of the second element, and `1` if the second element is the top element (and the first element is not also the top element).

Ex. The `leq` function in `int.xc` takes two `int`s and returns `1` if the first `int` is `0`, the second `int` is `100` and the first `int` is not, or the two `int`s are non-`100` and equal. For example, `leq(5, 5) => 1` but `leq(5, 6) => 0`. 

Ex. The `leq` function in `and.xc` takes two `State*`s and returns `1` if the second state could be reached from the first by changing `Bot()` positions to either `T()` or `F()`, or if the second state is `Top()` and the first is not. For example, `leq(Pair(T(), Bot()), Pair(F(), Bot())) => 0` and `leq(Pair(T(), Bot()), Pair(T(), F())) => 1`.

Ex. The `leq` function in `pizza.xc` takes two `VoteSet*`s and returns `1` if the first set is a subset of the second or if the first set features Undecided() votes that could be changed to definitive votes to reach a subset of the second vote set, and returns `0` otherwise. For example, `leq(Set(Kat(No()), Empty()), Set(Kat(Yes()), Empty())) => 0` and `leq(Set(Horace(No()), Empty()), Set(Kat(Yes()), Set(Horace(No()), Empty())))) => 1`.

#### A lub function to determine how to "combine" elements in the lattice.

This function must take as arguments two elements of the lattice's base type and return an element of the same type that represents the "least upper bound" of the two elements-- i.e., the lowest element of the lattice that such that both the first argument element and second argument element are "leq" the element in question. Note that the lub of any element with the bottom element is just that element, and that the lub of any element with the top element is the top element. The lub of any element with itself must be the original element.

Ex. the `lub` function in `int.xc` takes two `int`s and returns 100 if one or both of them are 100, returns the other element if one or both of them are 0, returns 100 if both elements are neither 0 nor 100 but the elements are not equal, and returns the value of both elements if the elements are equal. For example, `lub(5, 5) => 5`, `lub(7, 0) => 7`, and `lub(6, 5) => 100`.

Ex. the `lub` function in `and.xc` takes two `State*`s and returns the lowest pair that could be reached by legally combining the two pairs of booleans. For example, `lub(Pair(T(), Bot()), Pair(F(), Bot())) => Top()`, `lub(Pair(F(), T()), Pair(F(), Bot())) => Pair(F(), T())`, and `lub(Pair(Bot(), T()), Pair(T(), Bot())) => Pair(T(), T())`.

Ex. the `lub` function in `pizza.xc` takes two `VoteSet*`s and returns their set union, if possible, disregarding `Undecided()` votes. For example, `lub(Set(Horace(Yes()), Empty()), Set(Franz(No()), Empty())) => Set(Horace(Yes()), Set(Franz(No()), Empty()))`.

#### An eq function to determine whether two elements of the lattice are the same element.

Since lvars provide the most functionality when used with programmer-defined algebraic data types, the eq function is used to determine if two elements are identical in terms of the data type in question. The eq function must take as arguments two elements of the lattice's base type and return `1` if the elements are considered equal, `0` otherwise.

Ex. The `eq` function in `int.xc` is the same as the built-in `==` for `int`s.

Ex. The `eq` function in `and.xc` pattern-matches on the subcomponents of each `State*` and `Bl*` to determine if two `State*`s are identical in terms of the algebraic data types used, even if they may not have the same pointers.

Ex. The `eq` function in `pizza.xc` judges equality in terms of set equality (checking set components without paying attention to order).

#### A show function to provide a string representation of an element of the lattice.

The show function must take an element of the lattice's base type and return a `string` (from the ableC-string extension) representing that element.

Ex. The `showInteger` function in `int.xc` returns the default `show()` value for a given integer.

Ex. The `showState` function in `and.xc` returns a string like `"Pair(T(), F())"` or `"Top()"` for given state.

Ex. The `showVoteSet` function in `pizza.xc` returns a string like `"{Horace(Undecided()), Franz(Yes())}"` for the set `Set(Horace(Undecided()), Set(Franz(Yes()), Empty()))`.

### Part 2: Creating a Lattice.

If a programmer has defined the necessary lattice components with data elements `topEx` and `bottomEx` of type `baseType` and functions `leqEx`, `lubEx`, `eqEx`, `showEx` as described above, they can create a new lattice `lat` as follows:

`Lattice<baseType> * lat = lattice(bottomEx, topEx, leqEx, lubEx, eqEx, showEx);`

### Part 3: Creating an Lvar.

Once a programmer has a lattice `lat`, they can create an associated lattice variable as follows:

`Lvar<baseType> * lvar1 = newLvar(D);`

Arbitrarily many lattice variables can be created for a given lattice.

### Part 4: Writing to Lvars.

To write a value `val` of type `baseType` to a lattice variable `lvar1` of base type `baseType`, a programmer can write the following:

`int success = put(lvar1, val);`

Note that `put` returns `1` (true) if the write is a success, and `0` (false) if the write fails. With lvars, a `put` does not write a raw value to the location represented by the lattice variable. Instead, `put` attempts to write the least upper bound of the current value of the lvar and the new value that is indicated by the programmer (i.e., the result of the `lub` for the given lattice) to the lvar. If this lub is the top element of the lattice, the `put` fails. If the result is a valid element of the lattice, the value of the lvar is updated to the lub result.

### Part 5: Creating a Threshold Set.

In order to read from lattice variables, a programmer must set up a "threshold" set that indicates when an lvar is ready to be read from. Each threshold set is composed of one or more activation sets, and each activation set is composed of one or more elements of the base data type. Once the value of an lvar is at or above one of the values in one of the activation sets with respect to the lattice, its value is accessible to the programmer.

For example, in `and.xc`, an lvar is not ready to read from until either both boolean results in a `Pair` are determined to be `T()` or at least one of the boolean results is determined to be `F()`, at which point the value of the "and" operation is known to be either true or false. To determine when this occurs (and to process the final result) we can create a "true result" activation set and a "false result" activation set for our lattice `D` as follows:

```c
ActivationSet<State*> * falseSet = activationSet(D);
ActivationSet<State*> * trueSet = activationSet(D);
```

To add elements to these sets, we can write:

```c
add(falseSet, Pair(F(), Bot()));
add(falseSet, Pair(F(), T()));
add(falseSet, Pair(T(), F()));
add(falseSet, Pair(F(), F()));
add(falseSet, Pair(Bot(), F()));

add(trueSet, Pair(T(), T()));
```

We can also add elements to activation sets at the same time as initialization:

```c
ActivationSet<State*> * falseSet = activationSet(D){Pair(F(), Bot()), Pair(F(), T()),
                                                     Pair(T(), F()), Pair(F(), F()),
                                                     Pair(Bot(), F())};
ActivationSet<State*> * trueSet = activationSet(D){Pair(T(), T())};
```

Additionally, with either initialization format, we can specify an initial size for our activation sets:

```c
ActivationSet<State*> * falseSet = activationSet(D, 5);
ActivationSet<State*> * trueSet = activationSet(D, 1);

ActivationSet<State*> * falseSet = activationSet(D, 5){Pair(F(), Bot()), Pair(F(), T()),
                                                     Pair(T(), F()), Pair(F(), F()),
                                                     Pair(Bot(), F())};
ActivationSet<State*> * trueSet = activationSet(D, 1){Pair(T(), T())};
```

Once we have created one or more activation sets, we can use them to form a threshold set. The syntax for adding to and initializing a threshold set is very similar to that for an activation set:

```c
ThresholdSet<State*> * thresh = thresholdSet(D);
add(thresh, falseSet);
add(thresh, trueSet);
```

Or:

`ThresholdSet<State*> * thresh = thresholdSet(D){falseSet, trueSet};`

Or:

```c
ThresholdSet<State*> * thresh = thresholdSet(D, 2);
add(thresh, falseSet);
add(thresh, trueSet);
```

Or:

`ThresholdSet<State*> * thresh = thresholdSet(D, 2){falseSet, trueSet};`

Note that any two activation sets added to a threshold set must be incompatible-- i.e., the lub of any two elements from two different activation sets must be the top element of the lattice.

### Part 6: Reading from Lvars.

Once a programmer has set up a threshold set for a given lattice, they can use it to attempt to read from a lattice variable as in the following example:

`ActivationSet<State*> * result = get(lvar1, thresh);`

A call to `get` checks each activation set in the provided threshold set. If the value of the lvar is at or above (in terms of the lattice) some member of some activation set in the threshold set, `get` will return the entire matched activation set. If the value of the lvar is not at or above any member of any of the activation sets, `get` will return `NULL`. 

### Part 7: Cleaning Up.

After a programmer is done using lvars, lattices, activation sets, and threshold sets, they should clean up the utilized memory. Activation sets should be freed separately from their associated threshold sets, and both activation sets and threshold sets can be freed using `freeSet`. All other elements can be freed with an ordinary `free`. For example,

```c
free(lvar1);
freeSet(falseSet);
freeSet(trueSet);
freeSet(thresh);
free(lat);
```

### Additional Features:

#### Representing Sets As Strings

Threshold and activation sets have `show` methods which provide a `string` representation of the sets. To display the values in an activation set or threshold set, a programmer can write, for example,

```c
printf("Activation Set: %s\n", show(falseSet).text);
printf("Threshold Set: %s\n", show(thresh).text);
```

#### Pre-made Lattices

Currently, one pre-built lattice of natural numbers with `TopNat()`, `BotNat`, and `Int(int)` elements and a `leq` operation based on equality is provided in header file `natural.xh`. More prefabricated lattices are anticipated soon!

#### CHECK and DEBUG modes

To aid in debugging programs that make use of lvars, two debugging modes are provided to programmers. If the line `#define CHECK` is included before including the header `lvars.xh`, calls to methods in `lvars.xh` will be more rigourously checked to prevent errors, with the program continuing silently where possible (e.g., replacing a negative size with a size of 0), and returning `0` or `NULL` when recovery isn't possible. If the line `#define DEBUG` is included before including the header `lvars.xh`, the same checks as in `CHECK` mode will be performed, but the program will print an error message and exit upon any detected problem. If both `CHECK` and `DEBUG` are defined, the stronger mode, `DEBUG` will be used.

#### Freezing

Even though `get()` returns an activation set rather than a value of the base type, it can often be useful to be able to access the actual value inside an lvar. To preserve the determinism of an lvars program, this can only be done once no further updates are performed to an lvar, i.e., once the lvar is "frozen." To freeze an lvar, a programmer can write the following:

```c
freeze(lvar1);
```

The function `freeze` returns the current value of the lvar (which can then be saved to an ordinary, non-lattice variable and used throughout the rest of the program) and locks the lvar against further writes. After an lvar is frozen, any `put` operation on that lvar will fail (return 0 or error out), but the lvar can be represented by a string using `show` just like activation and threshold sets. Calls to `get` still work as usual after an lvar is frozen.

Note: before freezing an lvar, any cilk threads should be synced in order to preserve determinism.

