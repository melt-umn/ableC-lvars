grammar edu:umn:cs:melt:exts:ableC:lvars:abstractsyntax;

imports silver:langutil; 
imports silver:langutil:pp with implode as ppImplode ;

imports edu:umn:cs:melt:ableC:abstractsyntax:host;
imports edu:umn:cs:melt:exts:ableC:lvars:concretesyntax;
imports edu:umn:cs:melt:ableC:abstractsyntax:construction;
imports edu:umn:cs:melt:ableC:abstractsyntax:env;
imports edu:umn:cs:melt:ableC:abstractsyntax:construction:parsing;
imports edu:umn:cs:melt:exts:ableC:templating;
imports edu:umn:cs:melt:exts:ableC:algebraicDataTypes;
imports edu:umn:cs:melt:exts:ableC:cilk;
imports edu:umn:cs:melt:exts:ableC:string;
imports edu:umn:cs:melt:ableC:abstractsyntax:substitution;
imports edu:umn:cs:melt:ableC:abstractsyntax:overloadable as ovrld;

//************************ Lattice constructor production ********************

abstract production newLattice
top::Expr ::= bot::Expr topV::Expr leq::Expr lub::Expr eq::Expr disp::Expr
{
  propagate substituted;
  top.pp =
    pp"lattice(${bot.pp}, ${topV.pp}, ${leq.pp}, ${lub.pp}, ${eq.pp}, ${disp.pp})";

  local childErrors::[Message] =
    bot.errors ++ topV.errors ++ leq.errors ++
    lub.errors ++ eq.errors ++ disp.errors;  

  local localErrors::[Message] =
    checkLvarHeaderDef(top.location, top.env) ++ 
    if compatibleTypes(bot.typerep, topV.typerep, false, true)
    then []
    else
      [err(top.location, "Got " ++ showType(topV.typerep) ++
      " for Top, but Bottom has type " ++ showType(bot.typerep))];

  forwards to
    mkErrorCheck(childErrors ++ localErrors,
      ableC_Expr{
       inst _newLattice<$directTypeExpr{bot.typerep}>($Expr{bot}, $Expr{topV},    
       $Expr{leq}, $Expr{lub}, $Expr{eq}, $Expr{disp})
      }
    );
}

//********************** Production to add to various structures *************

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
        "Can only add to threshold set or activation set, not <" ++
         showType(set.typerep) ++">")], location=top.location)
    end;

   forwards to mkErrorCheck(localErrors, fwrd);
}

//********************** Freeing production **********************************

// frees either threshold set or activation set depending on the type

abstract production freeSet
top::Expr ::= set::Expr
{
  propagate substituted;
  top.pp = pp"freeSet(${set.pp})";

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
        "Can't use freeSet() with <" ++ showType(set.typerep) ++ ">")],
        location=top.location)
    end;

  forwards to mkErrorCheck(localErrors, fwrd);
}

// ************************* show productions *********************************

aspect function getShowOverloadProd
Maybe<(Expr ::= Expr Location)> ::= t::Type env::Decorated Env
{
  overloads <-
    [pair(
       "edu:umn:cs:melt:exts:ableC:lvars:lvars",
       \ e::Expr loc::Location -> showLvars(e, location=loc))];
} 

abstract production showLvars
top::Expr ::= e::Expr
{
  propagate substituted;
  top.pp = pp"show(${e.pp})";
  
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
      "Can't use show() with <" ++
       showType(e.typerep) ++">")], location=top.location)
    end;
      
  forwards to mkErrorCheck(localErrors, fwrd);
}

// to show an lvar (if possible)

abstract production showLvar 
top::Expr ::= baseType::Type l::Expr
{
  propagate substituted;
  top.pp = pp"show(${l.pp})";

  local localErrors::[Message] =
    checkLvarHeaderDef(top.location, top.env) ++ baseType.errors ++ l.errors;

  forwards to
    mkErrorCheck(localErrors,
    ableC_Expr{
      inst _showLvar<$directTypeExpr{baseType}>($Expr{l})
    });
}

//************************* get productions ***********************************

// to check for errors in a call to get(), and forward onward as appropriate

abstract production getCall
top::Expr ::= lvar::Expr threshold::Expr
{
  propagate substituted;
  top.pp = pp"get(${lvar.pp}, ${threshold.pp})";

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
           "get() expected second argument of type ThresholdSet*, got type "
           ++ showType(threshold.typerep))], location=top.location)
        end
    | _ ->
       errorExpr([err(top.location, 
       "get() expected first argument of type Lvar*, got type "
        ++ showType(lvar.typerep))], location=top.location)
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
  top.pp = pp"get(${lvar.pp}, ${threshold.pp})";

  local childErrors::[Message] = lvarBaseType.errors ++ lvar.errors ++
                                 threshBaseType.errors ++ threshold.errors;

  local localErrors::[Message] =
    checkLvarHeaderDef(top.location, top.env) ++
    if compatibleTypes(lvarBaseType, threshBaseType, false, true)
    then []
    else [err(top.location, 
          "Threshold set of type " ++ showType(lvarBaseType) ++
          " expected, but got threshold set of type "
          ++ showType(threshBaseType))];

  forwards to 
    mkErrorCheck(localErrors ++ childErrors,
    ableC_Expr{
      inst _get<$directTypeExpr{lvarBaseType}>($Expr{lvar}, $Expr{threshold})
    });
}

//*************************************** put productions *********************

// to check for errors in a call to put(), and forward onward as appropriate

abstract production putCall
top::Expr ::= lvar::Expr value::Expr
{
  propagate substituted;
  top.pp = pp"put(${lvar.pp}, ${value.pp})";

  local localErrors::[Message] = 
    checkLvarHeaderDef(top.location, top.env) ++ lvar.errors ++ value.errors;

  local fwrd::Expr =
    case lvar.typerep of
      pointerType(_, lvarType(_, l_t)) ->
        putCallHelper(l_t, lvar, value, location=top.location)
    | _ -> errorExpr([err(top.location, 
          "put() expected first argument of type Lvar*, got type <"
          ++ showType(lvar.typerep) ++ ">")], location=top.location)
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
  top.pp = pp"put(${lvar.pp}, ${value.pp})";

  local childErrors::[Message] = lvarBaseType.errors ++ lvar.errors ++
                                value.errors;

  local localErrors::[Message] =
    checkLvarHeaderDef(top.location, top.env) ++
    if compatibleTypes(lvarBaseType, value.typerep, false, true)
    then []
    else [err(top.location, 
          "Can't put value of type <" ++
          showType(value.typerep) ++ "> in an Lvar of type <"
          ++ showType(lvarBaseType) ++ ">")];

  forwards to 
    mkErrorCheck(localErrors ++ childErrors,
    ableC_Expr{
      inst _put<$directTypeExpr{lvarBaseType}>($Expr{lvar}, $Expr{value})
    });
}

//******************************** new productions ****************************

// to create a new lvar from a lattice

abstract production newCall
top::Expr ::= l::Expr
{
  propagate substituted;
  top.pp = pp"newLvar(${l.pp})";

  local localErrors::[Message] = l.errors ++
    checkLvarHeaderDef(top.location, top.env);

  local fwrd::Expr =
    case l.typerep of
      pointerType(_, latticeType(_, l_t)) ->
        ableC_Expr{
          inst _new<$directTypeExpr{l_t}>($Expr{l})
        }
    | _ -> errorExpr([err(top.location,
          "newLvar() expected argument of type Lattice*, got type <"
          ++ showType(l.typerep) ++ ">")], location=top.location)
    end;

  forwards to 
    mkErrorCheck(localErrors, fwrd);
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

//***************************** freeze productions ****************************

abstract production freeze
top::Expr ::= lvar::Expr
{
  propagate substituted;
  top.pp = pp"freeze(${lvar.pp})";

  local localErrors::[Message] = 
    checkLvarHeaderDef(top.location, top.env) ++ lvar.errors;

  local fwrd::Expr =
    case lvar.typerep of
      pointerType(_, lvarType(_, l_t)) ->
        ableC_Expr{
          inst _freeze<$directTypeExpr{l_t}>($Expr{lvar})
        }
    | _ -> errorExpr([err(top.location, 
          "freeze() expected first argument of type Lvar*, got type <"
          ++ showType(lvar.typerep) ++ ">")], location=top.location)
    end;

  forwards to 
    mkErrorCheck(localErrors, fwrd);
}

global builtin::Location = builtinLoc("lvars");

