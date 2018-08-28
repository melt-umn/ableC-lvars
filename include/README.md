# Associated Header Files

## LVars Functionality

+ `lvars.xh`: Handles behind-the-scenes LVars functionality. These functions should NOT be directly used by the programmer.
+ `quiesce.xh`: can be used to "sync" spawned pthreads (see pthreads_fold.xc and run_fold.xc in the examples directory)

## Data Types

+ `double.xh`: built-in double type
+ `int.xh`: built-in integer type
+ `maybe_int.xh`: wrapper for built-in integer type that allows value to be Some or None

## Integer Lattices

+ `counter.xh`: lattice for integer counter
+ `int_pair.xh`: lattice of pairs of single-write integers
+ `max_int.xh`: lub operation returns max of two integers
+ `product_int.xh`: lub operation is not traditional lub, but takes the product of two integers
+ `sum_int.xh`: lub operation is not traditional lub, but takes the sum of two integers
+ `single_write_int.xh`: lattice of single-write integers

## Set Lattices

+ `int_set.h`: destructive integer set, courtesy of Travis Carlson
+ `int_set.xh`: lattice wrapping the integer set implementation of `int_set.h`

## Double Lattices

+ `single_write_double.xh`: lattice of single-write doubles
