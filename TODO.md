## To-do:

+ Fix up READMEs
    + tests
    + guide
        + Add comparison with Kuper implementation (benefits, costs)
        + Warn about changing threshold/activation after initialization phase
+ Work on speeding up thread waiting/locking process
+ Consider adding other getter methods
+ Add positive tests for non-error cases
+ Implement more prefab lattices/data types
    + See if int_set.h lattice can be generalized to other base types to create a more flexible set lattice
+ Add nice syntax for counter lvar (maybe without specifying type, etc.)
+ Include quiescing in lvars.xh header file itself?
+ Test timing
+ Check that error handling is done only once (with helper productions, etc.)
+ Have one free construct (e.g., lvar_free) for all frees?
+ err vs. errorExpr?
+ Move graph example and fold examples to parallel_examples

