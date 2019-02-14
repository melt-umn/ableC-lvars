grammar edu:umn:cs:melt:exts:ableC:lvars:abstractsyntax;

// ********************* initialization ***************************************

// creates a new threshold set of a given size for a given lattice;
// threshold set is empty or has initial values
// latticeBaseType is the base type of the lattice
abstract production threshInitHelper
top::Expr ::= latticeBaseType::Type lattice::Expr elems::[Expr] size::Expr
{
  propagate substituted;
  top.pp = pp"thresholdSet(${lattice.pp})";

  local fwrd::Expr =
    // if there are no more elements to add, make a new threshold set
    if null(elems)
    then ableC_Expr{
           inst _newThresholdSet<$directTypeExpr{latticeBaseType}>
           ($Expr{lattice}, $Expr{size})
         }
    // otherwise, add the next element on to the threshold set created from
    // the tail of the elements list
    else addThresh(latticeBaseType,
         threshInitHelper(latticeBaseType, lattice, tail(elems),
         size, location = top.location),
         head(elems), location=top.location);

  forwards to mkErrorCheck([], fwrd);
}

// creates a new threshold set from a size and a list of elements
abstract production newThreshWithInitAndSize
top::Expr ::= lattice::Expr elems::[Expr] size::Expr
{
  propagate substituted;
  top.pp = pp"thresholdSet(${lattice.pp}, ${size.pp})";

  local headerError::[Message] = checkLvarHeaderDef(top.location, top.env);
  local localErrors::[Message] =
    if null(headerError)
    then lattice.errors
    else headerError;

  local fwrd::Expr = 
    case lattice.typerep of
      pointerType(_, extType(_, latticeType(l_t))) ->
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

// ************************ adding ********************************************

// adds an element to a threshold set
// baseType indicates the base type of the threshold set's lattice
abstract production addThresh
top::Expr ::= basetype::Type threshSet::Expr item::Expr
{
  propagate substituted;
  top.pp = pp"add(${threshSet.pp}, ${item.pp})";

  local localErrors::[Message] = item.errors;

  local fwrd::Expr = 
    case item.typerep of
      pointerType(_, extType(_, actType(a_t))) ->
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
           showType(item.typerep) ++ " to ThresholdSet<" ++
           showType(basetype) ++ ">* (can only add " ++
           "ActivationSet<" ++ showType(basetype) ++ ">*)")],
           location = top.location)
    end;

  forwards to
    mkErrorCheck(localErrors, fwrd);
}

// ****************************** freeing *************************************

// checks for errors, forwards to _freeActSets<a> if correct
abstract production freeActSets
top::Expr ::= thresh::Expr
{
  propagate substituted;
  top.pp = pp"freeActSets ${thresh.pp}";

  local headerError::[Message] = checkLvarHeaderDef(top.location, top.env);
  local localErrors::[Message] =
    if null(headerError)
    then thresh.errors
    else headerError;

  local fwrd::Expr =
    case thresh.typerep of
      pointerType(_, extType(_, threshType(t))) -> 
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

