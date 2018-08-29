# ableC-lvars

This extension provides constructs that aim to make it harder for programmers to write non-deterministic ableC programs by controlling inter-thread communication via "lattice variables."

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

Type/Signature: `a`

Each lattice can only contain elements of a single type. A lattice with base type `a` has type `Lattice<a>` (e.g., `Lattice<int>` or `Lattice<Pair*>`).

### A `leq` function to determine the order of any two elements of the lattice.

Type/Signature: `int leq_a(a elem1, a elem2)`

The `leq` function must take two elements of the lattice's base type as arguments and return an integer. The function should return 1 (truthy) if the first argument element is "at or below" the second argument element with respect to the lattice's ordering (i.e., the second element can be reached, in a series of monotonically increasing operations, from the first element), and 0 (falsy) otherwise. 

For example, the `leq` operation might represent `<=`, `>=`, or `==` between integers or doubles, or a set inclusion operation between sets.

### A `lub` function to determine how to combine any two elements of the lattice.

Type/Signature: `Value<a>* lub_a(a elem1, a elem2)`

The `lub` function must take two elements of the lattice's base type as arguments and return another element of the lattice's base type, wrapped in a `Value` wrapper type. The function should compute the element of type `a` that represents the "least upper bound" between the two provided elements-- i.e., the lowest element of the lattice that is at or above both arguments with respect to the ordering given in `leq`. This value `lub_result` should then be returned as `value lub_result` to wrap it in the `Value<a>` type. The error, or "top" element of the lattice is above all other elements in the lattice, and the `lub` function should return `Top<a>` in the case that the two elements cannot be combined to form a valid element of the lattice's base type. 

For example, the `lub` operation might take the maximum or minimum of two integers or doubles, return an argument only if the two supplied arguments are equivalent, or take the union of two sets.

Traditionally, the `lub` operation is idempotent: the `lub` of any element with itself should be the original element. However, the `lub` can also represent a more general associative and commutative operation (e.g., multiplication or addition) in the case that reads are performed only by freezing (see discussion later in this guide).

Note that when the lattice's base type is a pointer type, programmers must be careful to return *copies* of all pointer values, including pointers within algebraic datatypes. This ensures that values that need to be used again are not prematurely freed. There is one exception to this rule: destructive lattices, which are discussed later in the guide.

### A `display` function to determine how to print an element of the lattice to the screen.

Type/Signature: `void display_a(a elem)`

The `display` function must take one element of the lattice's base type as its argument, print that element to the screen, and return nothing.

For example, the `display` function for integers might simply be `printf("%d", elem)`, but the function may be more complicated for programmer-defined types.

### (Optional) A `free` function to determine how to free an element of the lattice.

Type/Signature: `void free_a(a elem)`

The `free` function must take one element of the lattice's base type as its argument, free that element, and return nothing. 

For example, the `free` function for the algebraic datatype `Pair(Int(int)*, Int(int)*)*` might pattern match on the `Pair` constructor and free both `Int` pointers before freeing the pointer to the entire element.

The `free` function is not necessary to provide in the case of non-pointer types like integers, chars, and doubles. If no `free` function is provided, the lattice will default to a `free` that does nothing. However, in the case of pointer types, especially programmer-defined structs and algebraic datatypes, `free` should free all components of any given element of the lattice's base type in order to prevent memory leaks. There is one exception to this: destructive lattices

## Creating a Lattice:

### 



