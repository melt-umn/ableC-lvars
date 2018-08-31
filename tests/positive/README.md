# Positive

The following tests are intended to check LVar operations that should succeed.

+ `destructive.xc`: Checking that `destr_lattice` and `destr_makeLvar` work as intended.
+ `empty_sets.xc`: Creating, displaying, and getting with {}, {{}}, and {item, {}, ...}.
+ `freeEmpty.xc`: Using `freeLvar` on empty LVar.
+ `freezing_empty.xc`: Getting after freezing for empty LVar.
+ `freezing_get.xc`: Getting after freezing for non-empty LVar.
+ `isTop.xc`: Testing `isTop`.
+ `lattice_eq.xc`: Checking that identical lattices are treated as identical.
+ `makeLvar.xc`: `test1.xc`, just with `makeLVar`.
+ `negSetCheck.xc`: Creating activation and threshold sets of negative size with CHECK mode.
+ `resizing_sets.xc`: Adding more elements to activation and threshold sets than initial size allows.
+ `test1.xc`: Using standard LVars constructs.
