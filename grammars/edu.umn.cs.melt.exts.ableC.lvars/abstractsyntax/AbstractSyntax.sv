grammar edu:umn:cs:melt:exts:ableC:lvars:abstractsyntax;

imports silver:langutil; 
imports silver:langutil:pp with implode as ppImplode ;

imports edu:umn:cs:melt:ableC:abstractsyntax:host;
imports edu:umn:cs:melt:exts:ableC:lvars:concretesyntax;
imports edu:umn:cs:melt:ableC:abstractsyntax:construction;
imports edu:umn:cs:melt:ableC:abstractsyntax:env;
imports edu:umn:cs:melt:ableC:abstractsyntax:construction:parsing;
imports edu:umn:cs:melt:exts:ableC:algebraicDataTypes;
imports edu:umn:cs:melt:exts:ableC:templating;
imports edu:umn:cs:melt:exts:ableC:cilk;
imports edu:umn:cs:melt:exts:ableC:string;
imports edu:umn:cs:melt:ableC:abstractsyntax:substitution;
imports edu:umn:cs:melt:ableC:abstractsyntax:overloadable as ovrld;

// ************************* show productions *********************************

abstract production showLvars
top::Expr ::= e::Expr
{
  propagate substituted;
  top.pp = pp"display ${e.pp}";
  
  local localErrors::[Message] =
    checkLvarHeaderDef(top.location, top.env) ++ e.errors;

  local fwrd::Expr =
    case e.typerep of
      pointerType(_, actType(_, t)) -> 
        showAct(t, e, location=top.location)
    | pointerType(_, threshType(_, t)) ->
        showThresh(t, e, location=top.location)
    | pointerType(_, lvarType(_, t)) ->
        showLvar(t, e, location=top.location)
    | _ ->
        errorExpr([err(top.location, 
      "display expected argument of type ActivationSet<a>*, ThresholdSet<a>*, or " ++
       "Lvar<a>*, not " ++ showType(e.typerep))], location=top.location)
    end;
      
  forwards to mkErrorCheck(localErrors, fwrd);
}

//************************* get productions ***********************************

// to check for errors in a call to get(), and forward onward as appropriate

abstract production getCall
top::Expr ::= lvar::Expr threshold::Expr
{
  propagate substituted;
  top.pp = pp"get ${lvar.pp} with ${threshold.pp}";

  local localErrors::[Message] =
    checkLvarHeaderDef(top.location, top.env) ++ lvar.errors ++ threshold.errors;

  local fwrd::Expr =
    case lvar.typerep of
      pointerType(_, lvarType(_, l_t)) ->
        case threshold.typerep of
          pointerType(_, threshType(_, t_t)) ->
            getCallHelper(l_t, lvar, t_t, threshold, location=top.location)
        | _ -> 
           errorExpr([err(top.location, 
           "get expected second argument of type ThresholdSet<a>*, not "
           ++ showType(threshold.typerep) ++ " (expression must be of the " ++
           "form 'get Lvar<a>* with ThresholdSet<a>*')")], location=top.location)
        end
    | _ ->
       errorExpr([err(top.location, 
           "get expected first argument of type Lvar<a>*, not "
           ++ showType(lvar.typerep) ++ " (expression must be of the " ++
           "form 'get Lvar<a>* with ThresholdSet<a>*')")], location=top.location)
    end;

  forwards to 
    mkErrorCheck(localErrors, fwrd);
}

// if no threshold set specified

abstract production getCallNoThresh
top::Expr ::= lvar::Expr
{
  propagate substituted;
  top.pp = pp"get ${lvar.pp}";

  local localErrors::[Message] =
    checkLvarHeaderDef(top.location, top.env) ++ lvar.errors;

  local fwrd::Expr =
    case lvar.typerep of
      pointerType(_, lvarType(_, l_t)) ->
        getCallHelperNoThresh(l_t, lvar, location=top.location)
    | _ ->
       errorExpr([err(top.location, 
           "get expected first argument of type Lvar<a>*, not "
           ++ showType(lvar.typerep) ++ " (expression must be of the " ++
           "form 'get Lvar<a>*')")], location=top.location)
    end;

  forwards to 
    mkErrorCheck(localErrors, fwrd);
}


// to get a value from an lvar
// lvarBaseType helps determine the base type of the lvar
// thresholdBaseType helps determine the base type of the threshold set

abstract production getCallHelper
top::Expr ::=  lvarBaseType::Type lvar::Expr threshBaseType::Type threshold::Expr 
{
  propagate substituted;
  top.pp = pp"get ${lvar.pp} with ${threshold.pp}";

  local childErrors::[Message] = lvarBaseType.errors ++ lvar.errors ++
                                 threshBaseType.errors ++ threshold.errors;

  local localErrors::[Message] =
    checkLvarHeaderDef(top.location, top.env) ++
    if compatibleTypes(lvarBaseType, threshBaseType, false, true)
    then []
    else [err(top.location, 
          "get expected ThresholdSet<" ++ showType(lvarBaseType) ++
          ">*, but got ThresholdSet<"
          ++ showType(threshBaseType) ++ ">*" )];

  forwards to 
    mkErrorCheck(localErrors ++ childErrors,
    ableC_Expr{
      inst _get<$directTypeExpr{lvarBaseType}>($Expr{lvar}, $Expr{threshold})
    });
}

// to get a value from an lvar
// lvarBaseType helps determine the base type of the lvar

abstract production getCallHelperNoThresh
top::Expr ::=  lvarBaseType::Type lvar::Expr
{
  propagate substituted;
  top.pp = pp"get ${lvar.pp}";

  local childErrors::[Message] = lvarBaseType.errors ++ lvar.errors;

  local localErrors::[Message] =
    checkLvarHeaderDef(top.location, top.env);

  forwards to 
    mkErrorCheck(localErrors ++ childErrors,
    ableC_Expr{
      inst _frozenGet<$directTypeExpr{lvarBaseType}>($Expr{lvar})
    });
}

//*************************************** put productions *********************

// to check for errors in a call to put(), and forward onward as appropriate

abstract production putCall
top::Expr ::= lvar::Expr value::Expr
{
  propagate substituted;
  top.pp = pp"put (${value.pp}) in ${lvar.pp}";

  local localErrors::[Message] = 
    checkLvarHeaderDef(top.location, top.env) ++ lvar.errors ++ value.errors;

  local fwrd::Expr =
    case lvar.typerep of
      pointerType(_, lvarType(_, l_t)) ->
        putCallHelper(l_t, lvar, value, location=top.location)
    | _ -> errorExpr([err(top.location, 
          "put expected second argument of type Lvar<a>*, got type "
          ++ showType(lvar.typerep) ++ "(expression must be of the form " ++
          "'put (a) in Lvar<a>*')")], location=top.location)
    end;

  forwards to 
    mkErrorCheck(localErrors, fwrd);
}

// to put a value into an lvar
// lvarBaseType helps determine the base type of the lvar

abstract production putCallHelper
top::Expr ::= lvarBaseType::Type lvar::Expr value::Expr
{
  propagate substituted;
  top.pp = pp"put (${value.pp}) in ${lvar.pp}";

  local childErrors::[Message] = lvarBaseType.errors ++ lvar.errors ++
                                value.errors;

  local localErrors::[Message] =
    checkLvarHeaderDef(top.location, top.env) ++
    if compatibleTypes(lvarBaseType, value.typerep, false, true)
    then []
    else [err(top.location, 
          "can't put value of type " ++
          showType(value.typerep) ++ " in Lvar<"
          ++ showType(lvarBaseType) ++ ">*")];

  forwards to 
    case lvarBaseType of
      pointerType(_, _) -> 
        mkErrorCheck(localErrors ++ childErrors,
        ableC_Expr{
          inst _put<$directTypeExpr{lvarBaseType}>($Expr{lvar}, $Expr{value}, 1)
        })
    | _ -> 
        mkErrorCheck(localErrors ++ childErrors,
        ableC_Expr{
          inst _put<$directTypeExpr{lvarBaseType}>($Expr{lvar}, $Expr{value}, 0)
        }) 
    end;
}

// to check for errors in a call to putD(), and forward onward as appropriate

abstract production destrPutCall
top::Expr ::= lvar::Expr value::Expr
{
  propagate substituted;
  top.pp = pp"putD (${value.pp}) in ${lvar.pp}";

  local localErrors::[Message] = 
    checkLvarHeaderDef(top.location, top.env) ++ lvar.errors ++ value.errors;

  local fwrd::Expr =
    case lvar.typerep of
      pointerType(_, lvarType(_, l_t)) ->
        putDCallHelper(l_t, lvar, value, location=top.location)
    | _ -> errorExpr([err(top.location, 
          "putD expected second argument of type Lvar<a>*, got type "
          ++ showType(lvar.typerep) ++ "(expression must be of the form " ++
          "'putD (a) in Lvar<a>*')")], location=top.location)
    end;

  forwards to 
    mkErrorCheck(localErrors, fwrd);
}

// to put a value into an lvar
// lvarBaseType helps determine the base type of the lvar

abstract production putDCallHelper
top::Expr ::= lvarBaseType::Type lvar::Expr value::Expr
{
  propagate substituted;
  top.pp = pp"putD (${value.pp}) in ${lvar.pp}";

  local childErrors::[Message] = lvarBaseType.errors ++ lvar.errors ++
                                value.errors;

  local localErrors::[Message] =
    checkLvarHeaderDef(top.location, top.env) ++
    if compatibleTypes(lvarBaseType, value.typerep, false, true)
    then []
    else [err(top.location, 
          "can't putD value of type " ++
          showType(value.typerep) ++ " in Lvar<"
          ++ showType(lvarBaseType) ++ ">*")];

  forwards to 
    case lvarBaseType of
      pointerType(_, _) -> 
        mkErrorCheck(localErrors ++ childErrors,
        ableC_Expr{
          inst _put_destructive<$directTypeExpr{lvarBaseType}>($Expr{lvar}, 
          $Expr{value}, 1)
        })
    | _ -> 
        mkErrorCheck(localErrors ++ childErrors,
        ableC_Expr{
          inst _put_destructive<$directTypeExpr{lvarBaseType}>($Expr{lvar}, 
          $Expr{value}, 0)
        }) 
    end;
}

// to determine if the necessary header file is included

function checkLvarHeaderDef
[Message] ::= loc::Location env::Decorated Env
{
  return
    if !null(lookupValue("_lvarCheckValue", env))
    then []
    else [err(loc, "Missing include of lvars.xh")];
}


global builtin::Location = builtinLoc("lvars");

