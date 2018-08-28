# ableC-lvars

## To-do:

### Fixes:

+ Fix up READMEs
    + tests
    + ableC-lvars
        + Make list of rules to follow for programmers (return copies in put vs must handle freeing in lubD rather than providing a free function, lubD must mutate first arg, etc.)
        + Update with new features
+ Consider making providing display function optional (like with free)
+ Work on speeding up thread waiting/locking process
+ Consider adding other getter methods
+ Add positive tests for non-error cases
+ Implement more prefab lattices/data types
    + See if int_set.h lattice can be generalized to other base types to create a more flexible set lattice
+ Add nice syntax for counter lvar (maybe without specifying type, etc.)
+ Include quiescing in lvars.xh header file itself?
+ Test timing
+ Check that error handling is done only once (with helper productions, etc.)
+ Should put be a statement instead of an expression?
+ Have one free construct (e.g., lvar_free) for all frees?
+ err vs. errorExpr?
+ freeze doesn't return anything, just does the freezing? That way can freeze lvar at bottom

### Things to think about:

+ Do I need to lock threshold sets and activation sets, in case different threads try to change them?
+ Does it make sense to free old value in put? Only works if create new values each time.
+ Infer value(..) automatically for return value when function returns a Value<a>*?
+ Make get binary prefix operator, and have get lvar {{a1}, {a2}} automatically create threshold set?

## Guide:

### Part 1: Lattice Components.

Each lvar, activation set, and threshold set is tied to a "lattice," which prescribes how individual elements are ordered with respect to one another. To create a lattice, a programmer must define several components:

#### A data type with a top element.

The "top" element represents an "error" state, and must be "above" every other element in the lattice with respect to the lattice's order. 

Ex. The file `int.xc` features C's built-in signed `int` type with top `100`, as well as C's built-in `double` type with top `100.0`.

Ex. The file `and.xc` features a `State*` type, with top `Top()`.

#### A leq function to determine the order of elements in the lattice.

This function must take as arguments two elements of the lattice's base type. The leq function should return `1` (true) if the first element is at or below the second element in the lattice, and should return `0` (false) otherwise. An element is defined to be "at or below" another element if the second element can be reached, in a series of monotonically increasing operations (however that is defined for the base type) from the first element. Every element is at or below the top element.

Ex. The `leq` function in `int.xc` takes two `int`s and returns `1` if the two integers are equal or the second integer is 100. For example, `leq(5, 5) => 1` but `leq(5, 6) => 0`. 

Ex. The `leq` function in `and.xc` takes two `State*`s and returns `1` if the second state could be reached from the first by changing `Bot()` positions to either `T()` or `F()`, or if the second state is `Top()`. For example, `leq(Pair(T(), Bot()), Pair(F(), Bot())) => 0` and `leq(Pair(T(), Bot()), Pair(T(), F())) => 1`.

#### A lub function to determine how to "combine" elements in the lattice.

This function must take as arguments two elements of the lattice's base type and return an element of the same type that represents the "least upper bound" of the two elements-- i.e., the lowest element of the lattice that such that both the first argument element and second argument element are "leq" the element in question. Note that the lub of any element with the top element is the top element. The lub of any element with itself must traditionally be the original element, though the lub can also represent a more general associative and commutative operation if no get reads will be performed.

Ex. the `lub` function in `int.xc` takes two `int`s and returns 100 if one or both of them are 100 or if the elements are not equal, and returns the value of both elements if the elements are equal. For example, `lub(5, 5) => 5` and `lub(6, 5) => 100`.

Ex. the `lub` function in `and.xc` takes two `State*`s and returns the lowest pair that could be reached by legally combining the two pairs of booleans. For example, `lub(Pair(T(), Bot()), Pair(F(), Bot())) => Top()`, `lub(Pair(F(), T()), Pair(F(), Bot())) => Pair(F(), T())`, and `lub(Pair(Bot(), T()), Pair(T(), Bot())) => Pair(T(), T())`.

#### A show function to provide a string representation of an element of the lattice.

The show function must take an element of the lattice's base type and print a representation of that element to the screen.

Ex. The `showInteger` function in `int.xc` returns the default `show()` value for a given integer.

Ex. The `showState` function in `and.xc` returns a string like `"Pair(T(), F())"` or `"Top()"` for given state.

#### (Optional) A free function to indicate how to free an element of the lattice.

The free function must take an element of the lattice's base type and free the element and all of its components. If no free function is provided, the freeing method used will default to doing nothing (e.g., in the case of a lattice of integers or another non-pointer type). 

Ex. In `and.xc`, a programmer might provide a function that, given a `State` pointer, frees both boolean pointers and the `State` pointer itself.

### Part 2: Creating a Lattice.

If a programmer has defined the necessary lattice components with data elements `topEx` of type `baseType` and functions `leqEx`, `lubEx`, `showEx`, and `freeEx` as described above, they can create a new lattice `lat` as follows:

`Lattice<baseType> * lat = lattice(topEx, leqEx, lubEx, showEx, freeEx);`

or, if the programmer does not want or need to specify a free function,

`Lattice<baseType> * lat = lattice(topEx, leqEx, lubEx, showEx);`

### Part 3: Creating an Lvar.

Once a programmer has a lattice `lat`, they can create an associated lattice variable as follows:

`Lvar<baseType> * lvar1 = newLvar(D);`

Arbitrarily many lattice variables can be created for a given lattice.

### Part 4: Writing to Lvars.

To write a value `val` of type `baseType` to a lattice variable `lvar1` of base type `baseType`, a programmer can write the following:

`put (val) in lvar1;`

Note that if `val` is an identifier, the parentheses are unnecessary.

With lvars, a `put` does not write a raw value to the location represented by the lattice variable. Instead, `put` attempts to write the least upper bound of the current value of the lvar and the new value that is indicated by the programmer (i.e., the result of the `lub` for the given lattice) to the lvar. If this lub is the top element of the lattice, the `put` fails and the program errors out. If the result is a valid element of the lattice, the value of the lvar is updated to the lub result.

### Part 5: Creating a Threshold Set.

In order to deterministically read from lattice variables, a programmer must set up a "threshold" set that indicates when an lvar is ready to be read from. Each threshold set is composed of one or more activation sets, and each activation set is composed of one or more elements of the base data type. Once the value of an lvar is at or above one of the values in one of the activation sets with respect to the lattice, the unique matched activation set is accessible to the programmer.

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

Note that any two activation sets added to a threshold set must be incompatible-- i.e., the lub of any two elements from two different activation sets must be the top element of the lattice to ensure that only one activation set is matched by a given element (though an element may match multiple items in the same activation set).

### Part 6: Reading from Lvars.

Once a programmer has set up a threshold set for a given lattice, they can use it to attempt to read from a lattice variable as in the following example:

`ActivationSet<State*> * result = get (lvar1) with thresh;`

Again, the parentheses are unnecessary in the case where `lvar1` is an identifier.

A call to `get` checks each activation set in the provided threshold set. If the value of the lvar is at or above (in terms of the lattice) some member of some activation set in the threshold set, `get` will return the entire matched activation set. If the value of the lvar is not at or above any member of any of the activation sets, `get` will block until a `put` operation makes the `get` valid. Note that this means that the `get` may block indefinitely.

### Part 7: Cleaning Up.

After a programmer is done using lvars, lattices, activation sets, and threshold sets, they should clean up the utilized memory. Activation sets can be freed separately from their associated threshold sets with `freeSet` or all at once via their threshold set with `freeAllActs`. Threshold sets can also be freed using `freeSet`. Lattices can be freed with `freeLattice`, and LVars can be freed with `freeLvar`. Note that Lvars, Activation Sets, and Threshold Sets should be freed before their lattices. For example,

```c
freeLvar(lvar1);
freeSet(falseSet);
freeSet(trueSet);
freeSet(thresh);
freeLattice(lat);
```

### Additional Features:

#### Displaying LVars Constructs

#### Pre-made Lattices

#### CHECK and DEBUG modes

To aid in debugging programs that make use of lvars, two debugging modes are provided to programmers. If the line `#define CHECK` is included before including the header `lvars.xh`, calls to methods in `lvars.xh` will be more rigourously checked to prevent errors, with the program continuing silently where possible (e.g., replacing a negative size with a size of 0), and returning `0` or `NULL` when recovery isn't possible. If the line `#define DEBUG` is included before including the header `lvars.xh`, the same checks as in `CHECK` mode will be performed, but the program will print an error message and exit upon any detected problem. If both `CHECK` and `DEBUG` are defined, the stronger mode, `DEBUG` will be used.

#### Freezing

Though `get` returns an activation set rather than a value of the base type, it can often be useful to be able to access the actual value inside an lvar. To preserve the determinism of an lvars program, this can only be done once no further updates are performed to an lvar, i.e., once the lvar is "frozen." To freeze an lvar, a programmer can write the following:

```c
freeze lvar1;
```

The function `freeze` returns the current value of the lvar (which can then be saved to an ordinary, non-lattice variable and used throughout the rest of the program) and locks the lvar against further writes. After an lvar is frozen, any `put` operation on that lvar will fail, but the lvar can be displayed using `display` just like activation and threshold sets. Calls to `get` without a provided threshold set will return the actual value of an LVar after it is frozen. Note that before freezing an LVar, any concurrent threads must be synced in order to preserve determinism.

