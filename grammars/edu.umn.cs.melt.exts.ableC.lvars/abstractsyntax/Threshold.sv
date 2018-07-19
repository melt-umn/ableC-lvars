grammar edu:umn:cs:melt:exts:ableC:lvars:abstractsyntax;

// to create a new threshold set of a given size for a given lattice
// latticeBaseType helps determine the base type of the lattice

abstract production newThreshHelper
top::Expr ::= latticeBaseType::Type lattice::Expr size::Expr
{
  propagate substituted;
  top.pp = pp"thresholdSet(${lattice.pp}, ${size.pp})";

  local localErrors::[Message] =
    checkLvarHeaderDef(top.location, top.env) ++
    latticeBaseType.errors ++ lattice.errors ++ size.errors;

  forwards to 
    mkErrorCheck(localErrors, 
    ableC_Expr{
      inst _newThresholdSet<$directTypeExpr{latticeBaseType}>
      ($Expr{lattice}, $Expr{size})
    });
}

// to create a new threshold set of a given size for a given lattice,
// with a set of initial values

// latticeBaseType helps determine the base type of the lattice

abstract production threshInitHelper
top::Expr ::= latticeBaseType::Type lattice::Expr elems::[Expr] size::Expr
{
  propagate substituted;
  top.pp = pp"thresholdSet(${lattice.pp})";

  local localErrors::[Message] =
    checkLvarHeaderDef(top.location, top.env) ++
    latticeBaseType.errors ++ lattice.errors ++ size.errors;

  local fwrd::Expr =
    // if there are no more elements to add, make a new activation set
    if null(elems)
    then newThreshHelper(latticeBaseType, lattice, size, location = top.location)
    // otherwise, add the next element on to the activation set created from
    // the tail of the elements list
    else addThresh(latticeBaseType,
         threshInitHelper(latticeBaseType, lattice, tail(elems),
         size, location = top.location),
         head(elems), location=top.location);

  forwards to mkErrorCheck(localErrors, fwrd);
}

// create a new threshold set when a size and a list of elements are provided

abstract production newThreshWithInitAndSize
top::Expr ::= lattice::Expr elems::[Expr] size::Expr
{
  propagate substituted;
  top.pp = pp"thresholdSet(${lattice.pp}, ${size.pp})";

  local localErrors::[Message] =
    checkLvarHeaderDef(top.location, top.env) ++ lattice.errors;

  local fwrd::Expr = 
    case lattice.typerep of
      pointerType(_, latticeType(_, l_t)) ->
        if size.typerep.isIntegerType
        then
          threshInitHelper(l_t, lattice, elems,
          size, location=top.location)
        else
          errorExpr([err(top.location,
          "Threshold set size must be an integer, not a " ++
          showType(size.typerep))], location=top.location) 
    | _ -> errorExpr([err(top.location,
          "thresholdSet() expected argument of type Lattice*, got type " 
          ++ showType(lattice.typerep))], location=top.location)
    end;

  forwards to mkErrorCheck(localErrors, fwrd);
}

// to add an element to a threshold set
// note that type is assumed to be threshold set at this point
// baseType indicates the base value of the threshold set's lattice

abstract production addThresh
top::Expr ::= basetype::Type threshSet::Expr item::Expr
{
  propagate substituted;
  top.pp = pp"add(${threshSet.pp}, ${item.pp})";

  local localErrors::[Message] =
    checkLvarHeaderDef(top.location, top.env) ++
    threshSet.errors ++ item.errors;

  local fwrd::Expr = 
    case item.typerep of
      pointerType(_, actType(_, a_t)) ->
        if compatibleTypes(basetype, a_t, false, true)
        then ableC_Expr{
               inst _addThreshold<$directTypeExpr{basetype}>
               ($Expr{threshSet}, $Expr{item})
             }
        else
          errorExpr([err(top.location,
          "Trying to add activation set with base type " ++
          showType(a_t) ++ " to a threshold set with " ++
          showType(basetype) ++ " elements")], location = top.location)
    | _ -> errorExpr([err(top.location,
           "Trying to add element of type " ++
           showType(item.typerep) ++ "instead of an activation set to a threshold set")],
           location = top.location)
    end;

  forwards to
    mkErrorCheck(localErrors, fwrd);
}

// to free a threshold set
// by this point, t is assumed to be a threshold set
// baseType helps determine the underlying type of the threshold set

abstract production freeThresh
top::Expr ::= baseType::Type t::Expr
{
  propagate substituted;
  top.pp = pp"freeSet(${t.pp})";

  local localErrors::[Message] =
    checkLvarHeaderDef(top.location, top.env) ++
    baseType.errors ++ t.errors;

  forwards to
    mkErrorCheck(localErrors,
    ableC_Expr{
      inst _freeThreshold<$directTypeExpr{baseType}>($Expr{t})
    });
}

// to show a threshold set

abstract production showThresh
top::Expr ::= baseType::Type t::Expr
{
  propagate substituted;
  top.pp = pp"show(${t.pp})";

  local localErrors::[Message] =
    checkLvarHeaderDef(top.location, top.env) ++
    baseType.errors ++ t.errors;

  forwards to 
    mkErrorCheck(localErrors, 
    ableC_Expr{
      inst _showThreshold<$directTypeExpr{baseType}>($Expr{t})
    });
}
