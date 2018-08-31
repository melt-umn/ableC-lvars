# Translate Error

The following tests are intended to check the extension's static error-checking abilities.

+ `act_bad_elems1.xc`: Adding an element of incorrect type to an activation set at initialization.
+ `act_bad_elems2.xc`: Adding an element of incorrect type to an activation set after initialization.
+ `act_bad_lattice.xc`: Creating an activation set from something other than a lattice.
+ `act_bad_size.xc`: Providing a non-integer size to an activation set.
+ `add_to_non_set.xc`: Using `add` with first argument not being an activation or threshold set.
+ `display_invalid.xc`: Displaying item that is not an activation set, threshold set, or LVar.
+ `freeactsets_non_thresh.xc`: Using `freeActSets` on non-threshold set.
+ `freelvar_non_lvar.xc`: Using `freeLvar` on non-LVar.
+ `freeset_non_set.xc`: Using `freeSet` on non-set.
+ `freeze_non_lvar.xc`: Using `freeze` on non-LVar.
+ `getLattice_non_lvar.xc`: Using `getLattice` on non-LVar.
+ `get_bad_lvar.xc`: Using `get x with t`, where `x` is not an LVar.
+ `get_bad_thresh.xc`: Using `get x with t`, where `t` is not a threshold set.
+ `get_frozen_bad_lvar.xc`: Using `get x`, where `x` is not an LVar.
+ `get_thresh_wrong_base_type.xc`: Using `get x with t`, where `x` and `t` are associated with lattices that have different base types.
+ `istop_invalid.xc`: Using `isTop` with non-Value.
+ `lattice_disp_wrong_args.xc`: Display function provided to lattice constructor takes argument of incorrect type.
+ `lattice_disp_wrong_num_args.xc`: Display function provided to lattice constructor takes incorrect number of arguments.
+ `lattice_disp_wrong_return.xc`: Display function provided to lattice constructor has incorrect return type.
+ `lattice_free_wrong_args.xc`: Free function provided to lattice constructor takes argument of incorrect type.
+ `lattice_free_wrong_num_args.xc`: Free function provided to lattice constructor takes incorrect number of arguments.
+ `lattice_free_wrong_return.xc`: Free function provided to lattice constructor has incorrect return type.
+ `lattice_leq_wrong_args.xc`: `leq` function provided to lattice constructor takes argument of incorrect type.
+ `lattice_leq_wrong_num_args.xc`: `leq` function provided to lattice constructor takes incorrect number of arguments.
+ `lattice_leq_wrong_return.xc`: `leq` function provided to lattice constructor has incorrect return type.
+ `lattice_lub_wrong_args.xc`: `lub` function provided to lattice constructor takes argument of incorrect type.
+ `lattice_lub_wrong_num_args.xc`: `lub` function provided to lattice constructor takes incorrect number of arguments.
+ `lattice_lub_wrong_return.xc`: `lub` function provided to lattice constructor has incorrect return type.
+ `lattice_lub_wrong_return2.xc`: `lub` function provided to lattice constructor has correct return type, but not wrapped in Value.
+ `lattice_non_function_disp.xc`: Value provided to lattice constructor in place of display function is not a function.
+ `lattice_non_function_free.xc`: Value provided to lattice constructor in place of free function is not a function.
+ `lattice_non_function_leq.xc`: Value provided to lattice constructor in place of leq function is not a function.
+ `lattice_non_function_lub.xc`: Value provided to lattice constructor in place of lub function is not a function.
+ `makeLvar_bad_lub.xc`: Invalid `lub` provided to `makeLvar`.
+ `missing_header.xc`: No include of `lvars.xh`.
+ `new_non_lattice.xc`: Using `newLvar` with non-lattice.
+ `put_bad_lvar.xc`: Using `put val in x` where `x` is non-LVar.
+ `put_bad_value.xc`: Using `put val in x` where `val` is of incorrect type.
+ `thresh_bad_act1.xc`: Adding a non-activation set element to a threshold set at initialization.
+ `thresh_bad_act2.xc`: Adding a non-activation set element to a threshold set after initialization.
+ `thresh_bad_act_base_1.xc`: Adding an activation set of incorrect base type to a threshold set at initialization.
+ `thresh_bad_act_base_2.xc`: Adding an activation set of incorrect base type to a threshold set after initialization.
+ `thresh_bad_lattice.xc`: Creating a threshold set from something other than a lattice.
+ `thresh_bad_size.xc`: Providing a non-integer size to a threshold set.



