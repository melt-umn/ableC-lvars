## Part 5: Creating a Threshold Set.

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

## Part 6: Reading from Lvars.

Once a programmer has set up a threshold set for a given lattice, they can use it to attempt to read from a lattice variable as in the following example:

`ActivationSet<State*> * result = get (lvar1) with thresh;`

Again, the parentheses are unnecessary in the case where `lvar1` is an identifier.

A call to `get` checks each activation set in the provided threshold set. If the value of the lvar is at or above (in terms of the lattice) some member of some activation set in the threshold set, `get` will return the entire matched activation set. If the value of the lvar is not at or above any member of any of the activation sets, `get` will block until a `put` operation makes the `get` valid. Note that this means that the `get` may block indefinitely.

## Part 7: Cleaning Up.

After a programmer is done using lvars, lattices, activation sets, and threshold sets, they should clean up the utilized memory. Activation sets can be freed separately from their associated threshold sets with `freeSet` or all at once via their threshold set with `freeAllActs`. Threshold sets can also be freed using `freeSet`. Lattices can be freed with `freeLattice`, and LVars can be freed with `freeLvar`. Note that Lvars, Activation Sets, and Threshold Sets should be freed before their lattices. For example,

```c
freeLvar(lvar1);
freeSet(falseSet);
freeSet(trueSet);
freeSet(thresh);
freeLattice(lat);
```

## Additional Features:

### Displaying LVars Constructs

### Pre-made Lattices

### CHECK and DEBUG modes

To aid in debugging programs that make use of lvars, two debugging modes are provided to programmers. If the line `#define CHECK` is included before including the header `lvars.xh`, calls to methods in `lvars.xh` will be more rigourously checked to prevent errors, with the program continuing silently where possible (e.g., replacing a negative size with a size of 0), and returning `0` or `NULL` when recovery isn't possible. If the line `#define DEBUG` is included before including the header `lvars.xh`, the same checks as in `CHECK` mode will be performed, but the program will print an error message and exit upon any detected problem. If both `CHECK` and `DEBUG` are defined, the stronger mode, `DEBUG` will be used.

### Freezing

Though `get` returns an activation set rather than a value of the base type, it can often be useful to be able to access the actual value inside an lvar. To preserve the determinism of an lvars program, this can only be done once no further updates are performed to an lvar, i.e., once the lvar is "frozen." To freeze an lvar, a programmer can write the following:

```c
freeze lvar1;
```

The function `freeze` returns the current value of the lvar (which can then be saved to an ordinary, non-lattice variable and used throughout the rest of the program) and locks the lvar against further writes. After an lvar is frozen, any `put` operation on that lvar will fail, but the lvar can be displayed using `display` just like activation and threshold sets. Calls to `get` without a provided threshold set will return the actual value of an LVar after it is frozen. Note that before freezing an LVar, any concurrent threads must be synced in order to preserve determinism.

