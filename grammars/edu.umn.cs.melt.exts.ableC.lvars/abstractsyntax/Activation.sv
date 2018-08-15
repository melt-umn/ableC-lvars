grammar edu:umn:cs:melt:exts:ableC:lvars:abstractsyntax;

// to create a new activation set of a given size for a given lattice
// latticeBaseType helps determine the base type of the lattice

abstract production newActHelper
top::Expr ::= latticeBaseType::Type lattice::Expr size::Expr
{
  propagate substituted;
  top.pp = pp"activationSet(${lattice.pp}, ${size.pp})";

  local localErrors::[Message] =
    checkLvarHeaderDef(top.location, top.env) ++
    latticeBaseType.errors ++ lattice.errors ++ size.errors;

  forwards to 
    mkErrorCheck(localErrors, 
    ableC_Expr{
      inst _newActivationSet<$directTypeExpr{latticeBaseType}>
      ($Expr{lattice}, $Expr{size})
    });
}

// to create a new activation set of a given size for a given lattice,
// with a set of initial values

// latticeBaseType helps determine the base type of the lattice

abstract production actInitHelper
top::Expr ::= latticeBaseType::Type lattice::Expr elems::[Expr] size::Expr
{
  propagate substituted;
  top.pp = pp"activationSet(${lattice.pp})";

  local localErrors::[Message] = 
    checkLvarHeaderDef(top.location, top.env) ++
    latticeBaseType.errors ++ lattice.errors ++ size.errors;

  local fwrd::Expr =
    // if there are no more elements to add, make a new activation set
    if null(elems)
    then newActHelper(latticeBaseType, lattice, size, location = top.location)
    // otherwise, add the next element on to the activation set created from
    // the tail of the elements list
    else addAct(latticeBaseType,
         actInitHelper(latticeBaseType, lattice, tail(elems),
         size, location = top.location),
         head(elems), location=top.location);

  forwards to mkErrorCheck(localErrors, fwrd);
}

// create a new activation set when a size and a list of elements are provided

abstract production newActWithInitAndSize
top::Expr ::= lattice::Expr elems::[Expr] size::Expr
{
  propagate substituted;
  top.pp = pp"activationSet(${lattice.pp}, ${size.pp})";

  local localErrors::[Message] =
    checkLvarHeaderDef(top.location, top.env) ++ lattice.errors ++ size.errors;

  local fwrd::Expr = 
    case lattice.typerep of
      pointerType(_, latticeType(_, l_t)) ->
        if size.typerep.isIntegerType
        then
          actInitHelper(l_t, lattice, elems,
          size, location=top.location)
        else
          errorExpr([err(top.location,
          "Activation set size must be an integer, not a " ++
          showType(size.typerep))], location=top.location) 
    | _ -> errorExpr([err(top.location,
          "activationSet() expected argument of type Lattice*, got type " 
          ++ showType(lattice.typerep))], location=top.location)
    end;

  forwards to mkErrorCheck(localErrors, fwrd);
}

// to add an element to an activation set
// note that type is assumed to be activation set at this point
// basetype indicates the base value of the activation set's lattice


abstract production addAct
top::Expr ::= basetype::Type actSet::Expr item::Expr
{
  propagate substituted;
  top.pp = pp"add(${actSet.pp}, ${item.pp})";

  local childErrors::[Message] =
    basetype.errors ++ actSet.errors ++ item.errors;

  local localErrors::[Message] =
    checkLvarHeaderDef(top.location, top.env) ++
    if compatibleTypes(basetype, item.typerep, false, true)
    then []
    else
      [err(top.location, "Trying to add elements of type <" ++
       showType(item.typerep) ++ "> to an activation set with <" ++
       showType(basetype) ++ "> elements")];

  forwards to
    mkErrorCheck(localErrors ++ childErrors,
      ableC_Expr{
        inst _addAct<$directTypeExpr{basetype}>
        ($Expr{actSet}, $Expr{item})
      }
    );
}

// to free an activation set
// by this point, a is assumed to be an activation set
// baseType helps determine the underlying type of the activation set

abstract production freeAct
top::Expr ::= baseType::Type a::Expr
{
  propagate substituted;
  top.pp = pp"freeSet(${a.pp})";

  local localErrors::[Message] =
    checkLvarHeaderDef(top.location, top.env) ++ baseType.errors ++ a.errors;

  forwards to
    mkErrorCheck(localErrors, 
    ableC_Expr{
      inst _freeActivation<$directTypeExpr{baseType}>($Expr{a})
    });
}

// to show an activation set
// by this point, a is assumed to be an activation set

abstract production showAct 
top::Expr ::= baseType::Type a::Expr
{
  propagate substituted;
  top.pp = pp"display(${a.pp})";

  local localErrors::[Message] =
    checkLvarHeaderDef(top.location, top.env) ++ baseType.errors ++ a.errors;

  forwards to
    mkErrorCheck(localErrors,
    ableC_Expr{
      inst _displayActivation<$directTypeExpr{baseType}>($Expr{a})
    });
}

