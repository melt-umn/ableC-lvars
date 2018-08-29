grammar edu:umn:cs:melt:exts:ableC:lvars:abstractsyntax;

// *************************** make *******************************************

// creates a new activation set of a given size for a given lattice;
// activation set is empty or has initial values
// latticeBaseType is the base type of the lattice
abstract production actInitHelper
top::Expr ::= latticeBaseType::Type lattice::Expr elems::[Expr] size::Expr
{
  propagate substituted;
  top.pp = pp"activationSet(${lattice.pp})";

  local fwrd::Expr =
    // if there are no more elements to add, make a new activation set
    if null(elems)
    then ableC_Expr{
           inst _newActivationSet<$directTypeExpr{latticeBaseType}>
           ($Expr{lattice}, $Expr{size})
         }  
    // otherwise, add the next element on to the activation set created from
    // the tail of the elements list
    else addAct(latticeBaseType,
         actInitHelper(latticeBaseType, lattice, tail(elems), size, 
         location = top.location), head(elems), location=top.location);

  forwards to mkErrorCheck([], fwrd);
}

// creates a new activation set from a size and a list of elements
abstract production newActWithInitAndSize
top::Expr ::= lattice::Expr elems::[Expr] size::Expr
{
  propagate substituted;
  top.pp = pp"activationSet(${lattice.pp}, ${size.pp})";

  local headerError::[Message] = checkLvarHeaderDef(top.location, top.env);
  local localErrors::[Message] =
    if null(headerError)
    then lattice.errors ++ size.errors
    else headerError;

  local fwrd::Expr = 
    case lattice.typerep of
      pointerType(_, latticeType(_, l_t)) ->
        if size.typerep.isIntegerType
        then
          actInitHelper(l_t, lattice, elems,
          size, location=top.location)
        else
          errorExpr([err(top.location,
          "activationSet() expected size argument of type integer, not " ++
          showType(size.typerep))], location=top.location) 
    | _ -> errorExpr([err(top.location,
          "activationSet() expected first argument of type Lattice<a>*, not " 
          ++ showType(lattice.typerep))], location=top.location)
    end;

  forwards to mkErrorCheck(localErrors, fwrd);
}

// ********************* add **************************************************

// adds an element to an activation set
// basetype indicates the base type of the activation set's lattice
abstract production addAct
top::Expr ::= basetype::Type actSet::Expr item::Expr
{
  propagate substituted;
  top.pp = pp"add(${actSet.pp}, ${item.pp})";

  local localErrors::[Message] =
    item.errors ++
    if compatibleTypes(basetype, item.typerep, false, true)
    then []
    else
      [err(top.location, "can't add elements of type " ++
       showType(item.typerep) ++ " to ActivationSet<" ++
       showType(basetype) ++ ">*")];

  forwards to
    case basetype of
      pointerType(_, _) -> 
        mkErrorCheck(localErrors,
          stmtExpr(
          ableC_Stmt{
            if ($Expr{item} == ((void *)0)) {
              fprintf(stderr, "Error: NULL argument supplied to freeSet\n");
              exit(1);
            }
          },
          ableC_Expr {
            inst _addAct<$directTypeExpr{basetype}>
            ($Expr{actSet}, $Expr{item})
          },
          location=top.location)
        )
    | _ -> 
        mkErrorCheck(localErrors,
          ableC_Expr{
            inst _addAct<$directTypeExpr{basetype}>
            ($Expr{actSet}, $Expr{item})
          }
        )
    end;
}

