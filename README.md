# ableC-lvars

This extension provides constructs that aim to make it harder for programmers to write non-deterministic ableC programs by controlling inter-thread communication via "lattice variables."

The extension is based on the work of Assistant Professor Lindsey Kuper. The following resources are good places to start looking at her ideas:

+ https://users.soe.ucsc.edu/~lkuper/papers/lindsey-kuper-dissertation.pdf
+ https://users.soe.ucsc.edu/~lkuper/papers/lvish-popl14.pdf
+ http://composition.al/blog/2013/05/25/how-to-read-from-an-lvar-an-illustrated-guide/
+ http://composition.al/blog/2013/09/22/some-example-mvar-ivar-and-lvar-programs-in-haskell/
+ http://composition.al/blog/2014/01/31/how-to-freeze-after-writing/
+ http://composition.al/blog/2014/05/28/the-lvar-that-was-after-all/

## Part 1: Lattice Components

Each lattice variable is associated with a "lattice," which prescribes how individual values can be ordered and combined. To create a lattice, a programmer must define several components.

### A datatype, either built-in to C or created by the programmer

Type/Signature: `a`

Each lattice can only contain elements of a single type. A lattice with base type `a` has type `Lattice<a>` (e.g., `Lattice<int>` or `Lattice<Pair*>`).

### A `leq` function to determine the order of any two elements of the lattice

Type/Signature: `int leq_a(a elem1, a elem2)`

The `leq` function must take two elements of the lattice's base type as arguments and return an integer. The function should return 1 (truthy) if the first argument element is "at or below" the second argument element with respect to the lattice's ordering (i.e., the second element can be reached, in a series of monotonically increasing operations, from the first element), and 0 (falsy) otherwise. 

For example, the `leq` operation might represent `<=`, `>=`, or `==` between integers or doubles, or a set inclusion operation between sets.

### A `lub` function to determine how to combine any two elements of the lattice

Type/Signature: `Value<a>* lub_a(a elem1, a elem2)`

The `lub` function must take two elements of the lattice's base type as arguments and return another element of the lattice's base type, wrapped in a `Value` wrapper type. The function should compute the element of type `a` that represents the "least upper bound" between the two provided elements-- i.e., the lowest element of the lattice that is at or above both arguments with respect to the ordering given in `leq`. This value `lub_result` should then be returned as `value lub_result` to wrap it in the `Value<a>` type. The error, or "top" element of the lattice is above all other elements in the lattice, and the `lub` function should return `Top<a>` in the case that the two elements cannot be combined to form a valid element of the lattice's base type. 

For example, the `lub` operation might take the maximum or minimum of two integers or doubles, return an argument only if the two supplied arguments are equivalent, or take the union of two sets.

Traditionally, the `lub` operation is idempotent: the `lub` of any element with itself should be the original element (wrapped with `value`). However, the `lub` can also represent a more general associative and commutative operation (e.g., multiplication or addition) in the case that reads are performed only by freezing (see discussion later in this guide).

Note that when the lattice's base type is a pointer type, programmers must be careful to return *copies* of all pointer values, including pointers within algebraic datatypes. This ensures that values that need to be used again are not prematurely freed. There is one exception to this rule: destructive lattices, which are discussed later in the guide.

### A `display` function to determine how to print an element of the lattice to the screen

Type/Signature: `void display_a(a elem)`

The `display` function must take one element of the lattice's base type as its argument, print that element to the screen, and return nothing.

For example, the `display` function for integers might simply be `printf("%d", elem)`, but the function may be more complicated for programmer-defined types.

### (Optional) A `free` function to determine how to free an element of the lattice

Type/Signature: `void free_a(a elem)`

The `free` function must take one element of the lattice's base type as its argument, free that element, and return nothing. 

For example, the `free` function for the algebraic datatype `Pair(Int(int)*, Int(int)*)*` might pattern match on the `Pair` constructor and free both `Int` pointers before freeing the pointer to the entire element.

The `free` function is not necessary to provide in the case of non-pointer types like integers, chars, and doubles. If no `free` function is provided, the lattice will default to a `free` that does nothing. However, in the case of pointer types, especially programmer-defined structs and algebraic datatypes, `free` should free all components of any given element of the lattice's base type in order to prevent memory leaks. There is one exception to this: destructive lattices

## Part 2: Creating a Lattice

To make a lattice, a programmer can write the following, using `leq_a`, `lub_a`, `display_a`, and `free_a` as described above:

`Lattice<a>* lat = lattice(leq_a, lub_a, display_a)`

or

`Lattice<a>* lat = lattice(leq_a, lub_a, display_a, free_a)`

### Destructive Lattices

Programmers may also choose to use a destructive lub operation-- for example, a set union that mutates the pre-existing set instead of creating a new copy. This destructive version can make writing non-deterministic programs easier than with traditional lattices and leaves the responsibility of freeing in the hands of the programmer, but may be preferred for space-efficiency reasons. It is possible to construct such a lattice with the following syntax:

`Lattice<a>* lat = destr_lattice(leq_a, lub_a, display_a)`

Note that no `free` function can be specified when constructing a destructive lattice, since programmers are responsible for handling freeing within their `lub` operation. Also note that the `lub` function is assumed to mutate the first argument to form the new value.

## Part 3: Creating an LVar

Once a programmer has a lattice `lat`, they can create an associated lattice variable as follows:

`Lvar<a>* lvar = newLvar lat;`

This initialized the LVar `lvar` to have a value at the "bottom" of the lattice. Arbitrarily many lattice variables can be created for a given lattice.

## Part 4: Writing to LVars

To write a value `val` of type `a` to a lattice variable `lvar` of base type `a`, a programmer can write the following:

`put (val) in lvar;`

Note that if `val` is an identifier, the parentheses are unnecessary.

With LVars, a `put` does not write a raw value to the location represented by the lattice variable. Instead, `put` attempts to write the least upper bound of the current value of the LVar and the new value that is indicated by the programmer (i.e., the result of the `lub` for the given lattice) to the LVar. If this lub is the top element of the lattice, the `put` fails and the program errors out. If the result is a valid element of the lattice, the value of the LVar is updated to the lub result. The first time an LVar is written to after being created, the result of the `put` will be whatever value is being `put` in.

## Part 5: Reading from LVars

There are two ways to read from an LVar: with `get`, which returns the unique "activation set" matched by the value of the LVar, and with freezing, which prevents future writes to the LVar.

### Reading from LVars with `get`

In order to deterministically read from lattice variables with `get`, a programmer must set up a "threshold" set that indicates when an LVar is ready to be read from. Each threshold set is composed of one or more activation sets, and each activation set is composed of one or more elements of the base data type. Once the value of an LVar is at or above one of the values in one of the activation sets with respect to the lattice, the unique matched activation set is accessible to the programmer.

#### Creating Activation Sets

For example, in `and.xc`, an LVar is not ready to read from until either both boolean results in a `Pair` are determined to be `T()` or at least one of the boolean results is determined to be `F()`, at which point the value of the "and" operation is known to be either true or false. To determine when this occurs (and to process the final result) we can create a "true result" activation set and a "false result" activation set for our lattice `lat` as follows:

```c
ActivationSet<State*>* falseSet = activationSet(lat);
ActivationSet<State*>* trueSet = activationSet(lat);
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
ActivationSet<State*> * falseSet = activationSet(lat){Pair(F(), Bot()), Pair(F(), T()),
                                                     Pair(T(), F()), Pair(F(), F()),
                                                     Pair(Bot(), F())};
ActivationSet<State*> * trueSet = activationSet(lat){Pair(T(), T())};
```

Additionally, with either initialization format, we can specify an initial size for our activation sets:

```c
ActivationSet<State*> * falseSet = activationSet(lat, 5);
ActivationSet<State*> * trueSet = activationSet(lat, 1);

ActivationSet<State*> * falseSet = activationSet(lat, 5){Pair(F(), Bot()), Pair(F(), T()),
                                                     Pair(T(), F()), Pair(F(), F()),
                                                     Pair(Bot(), F())};
ActivationSet<State*> * trueSet = activationSet(lat, 1){Pair(T(), T())};
```

#### Creating Threshold Sets

Once we have created one or more activation sets, we can use them to form a threshold set. Note that any two activation sets added to a threshold set must be incompatible-- i.e., the lub of any two elements from two different activation sets must be the top element of the lattice to ensure that only one activation set is matched by a given element (though an element may match multiple items in the same activation set). The syntax for adding to and initializing a threshold set is very similar to that for an activation set:


```c
ThresholdSet<State*> * thresh = thresholdSet(lat);
add(thresh, falseSet);
add(thresh, trueSet);
```

Or:

`ThresholdSet<State*> * thresh = thresholdSet(lat){falseSet, trueSet};`

Or:

```c
ThresholdSet<State*> * thresh = thresholdSet(lat, 2);
add(thresh, falseSet);
add(thresh, trueSet);
```

#### Using `get`

Once a programmer has set up a threshold set for a given lattice, they can use it to attempt to read from a lattice variable as in the following example:

`ActivationSet<State*> * result = get (lvar) with thresh;`


Note that, again, the parentheses are unnecessary in the case where `lvar` is an identifier.

A call to `get` checks the current value of the LVar against each activation set in the provided threshold set. If the value of the LVar is at or above (in terms of the lattice's `leq` ordering) some member of some activation set in the threshold set, the `get` will return the entire matched activation set. If the value of the LVar is not yet at or above any member of any of the activation sets, `get` will block until a `put` operation makes the `get` valid. Note that this means that the `get` may block indefinitely.

### Reading from LVars with `freeze`

Though `get` returns an activation set rather than a value of the base type, it can often be useful to be able to access the actual value inside an LVar. To preserve the determinism of an LVars program, this can only be done once no further updates are performed to an LVar, i.e., once the LVar is "frozen." To freeze an lvar, a programmer can write the following:

```c
freeze lvar;
```
The `freeze` operation locks the lvar against further writes-- after an LVar is frozen, any `put` operation on that LVar will fail. After an LVar is frozen, calls to `get` without a provided threshold set will return the actual value of the LVar rather than an activation set. Note that before freezing an LVar, any concurrent threads must be "synced" or "quiesced" in order to preserve determinism-- if `freeze` operations are interleaved with `put`s and `get`s, a program may error out in some schedules and not in others.

## Part 6: Displaying Results

## Part 7: Cleaning Up

After a programmer is done using LVars, lattices, activation sets, and threshold sets, they should clean up the utilized memory. Activation sets can be freed separately from their associated threshold sets with `freeSet` or all at once via their threshold set with `freeAllActs`. Threshold sets can also be freed using `freeSet`. Lattices can be freed with an ordinary `free`, and LVars can be freed with `freeLvar`. Note that Lvars, Activation Sets, and Threshold Sets should be freed before their lattices. For example,

```c
freeLvar lvar;
freeAllSets thresh;
freeSet thresh;
free(lat);
```

## Part 8: CHECK and DEBUG Modes

To aid in debugging programs that make use of LVars, two debugging modes are provided to programmers. If the line `#define CHECK` is included before including the header `lvars.xh`, calls to methods in `lvars.xh` will be more rigourously checked to prevent errors, with the program continuing silently where possible (e.g., replacing a negative size with a size of 0), and erroring out or returning `0` or `NULL` when recovery isn't possible. If the line `#define DEBUG` is included before including the header `lvars.xh`, the same checks as in `CHECK` mode will be performed, but the program will print an error message and exit upon any detected problem. If both `CHECK` and `DEBUG` are defined, the stronger mode, `DEBUG`, will be used.


