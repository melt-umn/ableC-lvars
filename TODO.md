# To-do:

+ More descriptive comments in header files and examples

## Ideas for Future Development:

+ Figure out a good way to speed up the thread waiting/locking process
+ Implement more prefabricated lattices and datatypes (e.g., a templated set lattice)

## Changes to Consider:

+ Currently the extension uses separate free constructs (freeSet and freeLvar)-- should these be combined under a single terminal?
+ Would other getter methods be helpful (e.g., expanding getLattice to work on activation and threshold sets as well as LVars)?
+ Would a freeLvarAndLattice construct be helpful for when makeLvar is used and the LVar's lattice is not directly accessible?
+ Should quiescing and counters be included in the core LVars grammar/header file, or are they better off in separate header files?
+ Should extension users be provided with a way to free Value<a>* pointers?

