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
          "thresholdSet() expected size argument of type integer, not " ++
          showType(size.typerep))], location=top.location) 
    | _ -> errorExpr([err(top.location,
          "thresholdSet() expected first argument of type Lattice<a>*, not " 
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
          "can't add ActivationSet<" ++
          showType(a_t) ++ ">* to ThresholdSet<" ++
          showType(basetype) ++ ">* (activation set has wrong base type)")],
          location = top.location)
    | _ -> errorExpr([err(top.location,
           "can't add element of type " ++
           showType(item.typerep) ++ "to ThresholdSet<" ++
           showType(basetype) ++ ">* (can only add " ++
           "ActivationSet<" ++ showType(basetype) ++ ">*)")],
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
  top.pp = pp"freeSet ${t.pp}";

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
  top.pp = pp"display ${t.pp}";

  local localErrors::[Message] =
    checkLvarHeaderDef(top.location, top.env) ++
    baseType.errors ++ t.errors;

  forwards to 
    mkErrorCheck(localErrors, 
    ableC_Expr{
      inst _displayThreshold<$directTypeExpr{baseType}>($Expr{t})
    });
}


abstract production freeActSets
top::Expr ::= thresh::Expr
{
  propagate substituted;
  top.pp = pp"freeActSets ${thresh.pp}";

  local localErrors::[Message] =
    checkLvarHeaderDef(top.location, top.env) ++ thresh.errors;

  local fwrd::Expr =
    case thresh.typerep of
      pointerType(_, threshType(_, t)) -> 
        ableC_Expr {
          inst _freeActSets<$directTypeExpr{t}>($Expr{thresh})
        }
    | _ ->
        errorExpr([err(top.location, 
        "freeActSets expected argument of type ThresholdSet<a>*, got "
        ++ showType(thresh.typerep))],
        location=top.location)
    end;

  forwards to mkErrorCheck(localErrors, fwrd);
}

