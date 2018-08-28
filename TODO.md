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
