grammar edu:umn:cs:melt:exts:ableC:lvars:abstractsyntax;

imports silver:langutil; 
imports silver:langutil:pp with implode as ppImplode ;

imports edu:umn:cs:melt:ableC:abstractsyntax:host;
imports edu:umn:cs:melt:exts:ableC:lvars:concretesyntax;
imports edu:umn:cs:melt:ableC:abstractsyntax:construction;
imports edu:umn:cs:melt:ableC:abstractsyntax:env;
imports edu:umn:cs:melt:ableC:abstractsyntax:construction:parsing;
imports edu:umn:cs:melt:exts:ableC:templating;
imports edu:umn:cs:melt:ableC:abstractsyntax:substitution;
imports edu:umn:cs:melt:ableC:abstractsyntax:overloadable as ovrld;

// ************************* display ******************************************

// directs to appropriate display production, based on type
abstract production displayHelper
top::Expr ::= e::Expr
{
  propagate substituted;
  top.pp = pp"display ${e.pp}";
  
  local headerError::[Message] = checkLvarHeaderDef(top.location, top.env);
  local localErrors::[Message] =
    if null(headerError)
    then e.errors
    else headerError;

  local fwrd::Expr =
    case e.typerep of
      pointerType(_, actType(_, t)) -> 
        ableC_Expr{
          inst _displayActivation<$directTypeExpr{t}>($Expr{e})
        }
    | pointerType(_, threshType(_, t)) ->
        ableC_Expr{
          inst _displayThreshold<$directTypeExpr{t}>($Expr{e})
        }
    | pointerType(_, lvarType(_, t)) ->
        ableC_Expr{
          inst _displayLvar<$directTypeExpr{t}>($Expr{e})
        }
    | _ ->
        errorExpr([err(top.location, 
      "display expected argument of type ActivationSet<a>*, " ++
      "ThresholdSet<a>*, or Lvar<a>*, not " ++ showType(e.typerep))],
      location=top.location)
    end;
      
  forwards to mkErrorCheck(localErrors, fwrd);
}

// ************************* non-frozen get ***********************************

// checks for errors in a call to get (with specified threshold, i.e., 
// unfrozen), and forwards to helper if correct
abstract production getCall
top::Expr ::= lvar::Expr threshold::Expr
{
  propagate substituted;
  top.pp = pp"get ${lvar.pp} with ${threshold.pp}";

  local headerError::[Message] = checkLvarHeaderDef(top.location, top.env);
  local localErrors::[Message] =
    if null(headerError)
    then lvar.errors ++ threshold.errors
    else headerError;

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
           "form 'get Lvar<a>* with ThresholdSet<a>*')")], 
           location=top.location)
        end
    | _ ->
       errorExpr([err(top.location, 
           "get expected first argument of type Lvar<a>*, not "
           ++ showType(lvar.typerep) ++ " (expression must be of the " ++
           "form 'get Lvar<a>* with ThresholdSet<a>*')")], 
           location=top.location)
    end;

  forwards to 
    mkErrorCheck(localErrors, fwrd);
}

// checks for errors and forwards to call to _get<a>
// lvarBaseType is the base type of the lvar
// thresholdBaseType is the base type of the threshold set
abstract production getCallHelper
top::Expr ::=  lvarBaseType::Type lvar::Expr threshBaseType::Type 
               threshold::Expr 
{
  propagate substituted;
  top.pp = pp"get ${lvar.pp} with ${threshold.pp}";

  local localErrors::[Message] =
    if compatibleTypes(lvarBaseType, threshBaseType, false, true)
    then []
    else [err(top.location, 
          "get expected ThresholdSet<" ++ showType(lvarBaseType) ++
          ">*, but got ThresholdSet<"
          ++ showType(threshBaseType) ++ ">*" )];

  forwards to 
    mkErrorCheck(localErrors,
    ableC_Expr{
      inst _get<$directTypeExpr{lvarBaseType}>($Expr{lvar}, $Expr{threshold})
    });
}

// ************************ frozen get ****************************************

// checks for errors in a call to get (without specified threshold, i.e.,
// frozen), and forwards to helper if correct
abstract production getCallNoThresh
top::Expr ::= lvar::Expr
{
  propagate substituted;
  top.pp = pp"get ${lvar.pp}";

  local headerError::[Message] = checkLvarHeaderDef(top.location, top.env);
  local localErrors::[Message] =
    if null(headerError)
    then lvar.errors
    else headerError;

  local fwrd::Expr =
    case lvar.typerep of
      pointerType(_, lvarType(_, l_t)) ->
        ableC_Expr{
          inst _frozenGet<$directTypeExpr{l_t}>($Expr{lvar})
        }
    | _ ->
       errorExpr([err(top.location, 
           "get expected first argument of type Lvar<a>*, not "
           ++ showType(lvar.typerep) ++ " (expression must be of the " ++
           "form 'get Lvar<a>*')")], location=top.location)
    end;

  forwards to 
    mkErrorCheck(localErrors, fwrd);
}

// ********************************** put *************************************

// checks for errors in a call to put, and forwards to helper if correct
abstract production putCall
top::Expr ::= lvar::Expr value::Expr
{
  propagate substituted;
  top.pp = pp"put (${value.pp}) in ${lvar.pp}";

  local headerError::[Message] = checkLvarHeaderDef(top.location, top.env);
  local localErrors::[Message] =
    if null(headerError)
    then lvar.errors ++ value.errors
    else headerError;

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

// checks for errors in call to put, and forwards to call to _put<a> if correct
// lvarBaseType is the base type of the lvar
abstract production putCallHelper
top::Expr ::= lvarBaseType::Type lvar::Expr value::Expr
{
  propagate substituted;
  top.pp = pp"put (${value.pp}) in ${lvar.pp}";

  local localErrors::[Message] =
    if compatibleTypes(lvarBaseType, value.typerep, false, true)
    then []
    else [err(top.location, 
          "can't put value of type " ++
          showType(value.typerep) ++ " in Lvar<"
          ++ showType(lvarBaseType) ++ ">*")];

  forwards to 
    case lvarBaseType of
      pointerType(_, _) -> 
        mkErrorCheck(localErrors,
        ableC_Expr{
          inst _put<$directTypeExpr{lvarBaseType}>($Expr{lvar}, 
            $Expr{value}, 1) // last arg indicates whether pointer base or not
        })
    | _ -> 
        mkErrorCheck(localErrors,
        ableC_Expr{
          inst _put<$directTypeExpr{lvarBaseType}>($Expr{lvar}, 
            $Expr{value}, 0)
        }) 
    end;
}

// *************************** other ******************************************

// determines if the necessary header file is included
function checkLvarHeaderDef
[Message] ::= loc::Location env::Decorated Env
{
  return
    if !null(lookupValue("_lvarCheckValue", env))
    then []
    else [err(loc, "Missing include of lvars.xh")];
}

global builtin::Location = builtinLoc("lvars");

