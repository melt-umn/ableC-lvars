## To-do:

+ Recheck valgrind for examples
+ Update README for test directories
+ Work on speeding up thread waiting/locking process
+ Consider adding other getter methods
+ Fix memory leak in destructive test
+ Add positive tests for non-error cases
    + using isTop
    + valgrind with all headers (counter, int_set, max_int, product_int, quiesce, sum_int) 
    + all headers (counter, int_set, product_int, quiesce, sum_int)  
+ Implement more prefab lattices/data types
    + See if int_set.h lattice can be generalized to other base types to create a more flexible set lattice
+ Add nice syntax for counter lvar (maybe without specifying type, etc.)
+ Include quiescing in lvars.xh header file itself?
+ Test timing
+ Check that error handling is done only once (with helper productions, etc.)
+ Have one free construct (e.g., lvar_free) for all frees?
+ Better comments in headers/example files
+ Add checks for empty act/thresh sets in non-frozen get, since will never unblock regardless of puts 

