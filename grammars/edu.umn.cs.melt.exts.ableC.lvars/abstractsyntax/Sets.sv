grammar edu:umn:cs:melt:exts:ableC:lvars:abstractsyntax;

// adds to either threshold set or activation set depending on the type

abstract production add
top::Expr ::= set::Expr item::Expr
{
  propagate substituted;
  top.pp = pp"add(${set.pp}, ${item.pp})";

  local localErrors::[Message] =
    checkLvarHeaderDef(top.location, top.env) ++ set.errors ++ item.errors;

  local fwrd::Expr =
    case set.typerep of
      pointerType(_, actType(_, t)) -> 
        addAct(t, set, item, location=top.location)
    | pointerType(_, threshType(_, t)) ->
        addThresh(t, set, item, location=top.location)
    | _ ->
        errorExpr([err(top.location, 
        "Can only add to ActivationSet<a>* or ThresholdSet<a>*, not " ++
         showType(set.typerep))], location=top.location)
    end;

   forwards to mkErrorCheck(localErrors, fwrd);
}

//********************** Freeing production **********************************

// frees either threshold set or activation set depending on the type

abstract production freeSet
top::Expr ::= set::Expr
{
  propagate substituted;
  top.pp = pp"freeSet ${set.pp}";

  local localErrors::[Message] =
    checkLvarHeaderDef(top.location, top.env) ++ set.errors;

  local fwrd::Expr =
    case set.typerep of
      pointerType(_, actType(_, t)) -> 
        freeAct(t, set, location=top.location)
    | pointerType(_, threshType(_, t)) ->
        freeThresh(t, set, location=top.location)
    | _ ->
        errorExpr([err(top.location, 
        "freeSet expected argument of type ActivationSet<a>* or ThresholdSet<a>*, got " 
        ++ showType(set.typerep))], location=top.location)
    end;

  forwards to mkErrorCheck(localErrors, fwrd);
}

