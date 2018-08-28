# Abstract Syntax

+ `AbstractSyntax.sv`: Handles constructs `display`, `get x with t`, `get x`, and `put value in x`
+ `Activation.sv`: Handles constructs `activationSet` and `add` (for activation sets)
+ `Lattice.sv`: Handles constructs `lattice`, `destr_lattice`, `makeLvar`, and `destr_makeLvar`
+ `Lvar.sv`: Handles constructs `freeLvar`, `newLvar`, `freeze`, and `getLattice`
+ `Sets.sv`: Handles constructs `freeSet` and `add` (forwarding to productions in `Activation.sv` or `Threshold.sv` as appropriate)
+ `Threshold.sv`: Handles constructs `thresholdSet`, `freeActSets`, and `add` (for threshold sets)
+ `Type.sv`: Handles constructs `ActivationSet<a>`, `ThresholdSet<a>`, `Lvar<a>`, `Lattice<a>`, and `Value<a>`
+ `Value.sv`: Handles constructs `value`, `Top<a>`, and `isTop`
