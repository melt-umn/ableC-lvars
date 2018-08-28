# Abstract Syntax

+ `AbstractSyntax.sv` includes productions for display various LVars constructs, along with productions related to `put` and `get`
+ `Activation.sv` includes productions to create and add to activation sets
+ `Lattice.sv` includes productions to create lattices (along with the productions associated with makeLvar)
+ `Lvar.sv` includes productions to free, freeze, create, and get lattices from lattice variables
+ `Sets.sv` includes productions to add to and free activation and threshold sets (forwarding to productions in `Activation.sv` or `Threshold.sv` as appropriate)
+ `Threshold.sv` includes productions to create, add to, and free threshold sets
+ `Type.sv` includes productions to set-up the types ActivationSet, ThresholdSet, Lvar, Lattice, and Value
+ `Value.sv` includes productions to create and test for Values
