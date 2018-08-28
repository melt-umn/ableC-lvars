# ableC-lvars

The constructs provided by this extension aim to make it harder for programmers to write non-deterministic parallel ableC programs by controlling communication via "lattice variables."

The extension is based on the work of Assistant Professor Lindsey Kuper. The following resources are good places to start looking at her ideas:

+ https://users.soe.ucsc.edu/~lkuper/papers/lindsey-kuper-dissertation.pdf
+ https://users.soe.ucsc.edu/~lkuper/papers/lvish-popl14.pdf
+ http://composition.al/blog/2013/05/25/how-to-read-from-an-lvar-an-illustrated-guide/
+ http://composition.al/blog/2013/09/22/some-example-mvar-ivar-and-lvar-programs-in-haskell/
+ http://composition.al/blog/2014/01/31/how-to-freeze-after-writing/
+ http://composition.al/blog/2014/05/28/the-lvar-that-was-after-all/

## Lattice Components:

Each lattice variable is associated with a "lattice," which prescribes how individual values can be ordered and combined. To create a lattice, a programmer must define several components.

### A datatype, either built-in to C or created by the programmer.

Each lattice can only contain elements of a single type. A lattice with base type `a` has type `Lattice<a>` (e.g., `Lattice<int>` or `Lattice<Pair*>`).

### A `leq` function to determine the order of any two elements of the lattice.

The `leq` function must take two elements of the lattice's base type as arguments and return an integer. The function should return 1 if the first argument element "precedes" the second argument element in the lattice, and 0 otherwise. 


