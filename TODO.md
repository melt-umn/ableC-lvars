# To-do:

+ Add runtime test for getting with empty thresh and empty empty thresh
+ Check valgrind for all examples
+ Fix memory leak in destructive test
+ Run timing tests
+ Check that error handling is done only once (with helper productions, etc.)
+ Better comments in headers/example files
+ Add lVar and get to lattice_eq.xc in positive tests

## Ideas for Future Development:

+ Figure out a good way to speed up the thread waiting/locking process
+ Implement more prefabricated lattices and datatypes (e.g., a templated set lattice)

## Changes to Consider:

+ Currently the extension uses separate free constructs (freeSet and freeLvar)-- should these be combined under a single terminal?
+ Would other getter methods be helpful (e.g., expanding getLattice to work on activation and threshold sets as well as LVars)?
+ Would a freeLvarAndLattice construct be helpful for when makeLvar is used and the LVar's lattice is not directly accessible?
+ Should quiescing and counters be included in the core LVars grammar/header file, or are they better off in separate header files?

