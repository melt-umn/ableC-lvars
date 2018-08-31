# Runtime Error

The following tests are intended to check the extension's runtime error-checking abilities. All of the tests have DEBUG mode turned on.

+ `actSet_neg_size.xc`: Creating an activation set of negative size.
+ `actSet_null.xc`: Creating an activation set from a NULL lattice.
+ `add_null.xc`: Adding a NULL value to an activation set.
+ `add_to_null.xc`: Adding a value to a NULL activation set.
+ `display_before_freeze.xc`: Displaying an LVar before it is frozen.
+ `display_null_thresh.xc`: Displaying a NULL threshold set.
+ `freeActsSets_null_thresh.xc`: Using `freeActSets` with a NULL threshold set.
+ `freeLvar_null.xc`: Using `freeLvar` with a NULL LVar.
+ `freeSet_null.xc`: Using `freeSet` with a NULL activation set.
+ `freeSet_null_thresh.xc`: Using `freeSet` with a NULL threshold set.
+ `freeze_null.xc`: Freezing a NULL LVar.
+ `frozen_get_before_put.xc`: Getting an empty, frozen LVar.
+ `frozen_get_null.xc`: Performing a frozen-style get from a NULL LVar.
+ `frozen_get_unfrozen.xc`: Performing a frozen-style get with a non-frozen LVar.
+ `getLattice_null.xc`: Using `getLattice` with a NULL LVar.
+ `get_from_null.xc`: Using `get x with t` where `x` is a NULL LVar.
+ `get_mismatch_lattice.xc`: Using `get x with t`, where the base type of the LVar `x` and the threshold set `t` are the same, but their lattices don't match.
+ `get_with_null.xc`: Using `get x with t` where `t` is a NULL threshold set.
+ `incompat_act_sets.xc`: Adding compatible activation sets to the same threshold set.
+ `invalid_put.xc`: Putting an invalid value into an LVar.
+ `lattice_neq.xc`: Adding an activation set to a threshold set with a lattice that has the same base type, but is different.
+ `newLvar_null.xc`: Using `newLvar` with a NULL lattice.
+ `put_in_null.xc`: Using `put val in x`, where `x` is a NULL LVar.
+ `put_null.xc`: Using `put val in x`, where `val` is NULL.
+ `thresh_set_add_null.xc`: Adding a NULL activation set to a threshold set.
+ `thresh_set_add_to_null.xc`: Adding an activation set to a NULL threshold set.
+ `thresh_set_neg_size.xc`: Creating a threshold set of negative size.
+ `thresh_set_null.xc`: Creating a threshold set from a NULL lattice.
+ `write_to_frozen.xc`: Putting a value into a frozen LVar.
