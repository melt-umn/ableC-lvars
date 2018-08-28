grammar edu:umn:cs:melt:exts:ableC:lvars:abstractsyntax;

// ********************* activation/threshold set productions *****************

// adds to either threshold set or activation set depending on the type
abstract production add
top::Expr ::= set::Expr item::Expr
{
  propagate substituted;
  top.pp = pp"add(${set.pp}, ${item.pp})";

  local headerError::[Message] = checkLvarHeaderDef(top.location, top.env);
  local localErrors::[Message] =
    if null(headerError)
    then set.errors ++ item.errors
    else headerError;

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

// frees either threshold set or activation set depending on the type
abstract production freeSet
top::Expr ::= set::Expr
{
  propagate substituted;
  top.pp = pp"freeSet ${set.pp}";

  local headerError::[Message] = checkLvarHeaderDef(top.location, top.env);
  local localErrors::[Message] =
    if null(headerError)
    then set.errors
    else headerError;

  local fwrd::Expr =
    case set.typerep of
      pointerType(_, actType(_, t)) -> 
        ableC_Expr{
          inst _freeActivation<$directTypeExpr{t}>($Expr{set})
        }
    | pointerType(_, threshType(_, t)) ->
        ableC_Expr{
          inst _freeThreshold<$directTypeExpr{t}>($Expr{set})
        }
    | _ ->
        errorExpr([err(top.location, 
        "freeSet expected argument of type ActivationSet<a>* or " ++
        "ThresholdSet<a>*, got " ++ showType(set.typerep))], 
        location=top.location)
    end;

  forwards to mkErrorCheck(localErrors, fwrd);
}

