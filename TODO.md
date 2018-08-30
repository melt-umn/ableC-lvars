## To-do:

+ Fix double-evaluation problem when checking for null argument to put and freeSet
+ Recheck valgrind for examples
+ Update README for test directories
+ Work on speeding up thread waiting/locking process
+ Consider adding other getter methods
+ Add positive tests for non-error cases
    + get after freezing
    + using isTop
    + default display
    + freezing before any puts -- displaying, getting, subsequent puts
    + freeing before any puts
    + getLattice
    + empty activation set (getting, displaying, freezing)
    + empty activation set within threshold set (getting, displaying, freezing)
    + empty threshold set (getting, displaying, freezing)
    + valgrind with all headers (counter, int_set, max_int, product_int, quiesce, single_write_double, single_write_int, sum_int) 
    + negative size act and thresh
    + destructive put
    + get with t after freeze-- both with match and without
    + get with empty activation set when value is at bottom
    + freezing a frozen lvar
    + destr_lattice
    + destr_makeLvar
    + makeLvar
    + all headers (counter, int_set, product_int, quiesce, single_write_double, single_write_int, sum_int) 
+ Implement more prefab lattices/data types
    + See if int_set.h lattice can be generalized to other base types to create a more flexible set lattice
+ Add nice syntax for counter lvar (maybe without specifying type, etc.)
+ Include quiescing in lvars.xh header file itself?
+ Test timing
+ Check that error handling is done only once (with helper productions, etc.)
+ Have one free construct (e.g., lvar_free) for all frees?
+ Better comments in headers/example files

