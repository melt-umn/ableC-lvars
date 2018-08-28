# Concrete Syntax

+ `ConcreteSyntax.sv`: Handles constructs `put val in x`, `get x`, `get x with t`, and `display`
+ `Lattice.sv`: Handles constructs `lattice`, `destr_lattice`, `makeLvar`, and `destr_makeLvar`
+ `Lvar.sv`: Handles constructs `newLvar`, `freeze`, `freeLvar`, and `getLattice`
+ `Set.sv`: Handles constructs `activationSet`, `thresholdSet`, `add`, `freeSet`, and `freeActSets`
+ `Type.sv`: Handles constructs `Lattice<a>`, `Lvar<a>`, `ThresholdSet<a>`, `ActivationSet<a>`, and `Value<a>`
+ `Value.sv`: Handles constructs `Top<a>`, `isTop`, and `value`
