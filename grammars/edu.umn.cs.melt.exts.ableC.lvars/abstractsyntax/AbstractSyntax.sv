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

//************************ Lattice constructor production ********************

function latticeCheckHelper
[Message] ::= loc::Location outType::Type leq::Expr disp::Expr free::Expr
{
  return 
      case leq.typerep of
        functionType(t0, protoFunctionType([t1, t2], false),_) -> 
          if compatibleTypes(t1, outType, false, true)
             && compatibleTypes(t2, outType, false, true)
             && t0.isIntegerType
          then []
          else [err(loc, 
               "leq must be function of type int(" ++ 
               showType(outType) ++ ", " ++ showType(outType)
               ++ "), not " ++ showType(leq.typerep))]
      | pointerType(_, 
          functionType(t0, protoFunctionType([t1, t2], false),_)) -> 
            if compatibleTypes(t1, outType, false, true)
              && compatibleTypes(t2, outType, false, true)
              && t0.isIntegerType
            then []
            else [err(loc, 
                  "leq must be function of type int(" ++ 
                  showType(outType) ++ ", " ++ showType(outType)
                  ++ "), not " ++ showType(leq.typerep))]
    
      | _ -> [err(loc, 
             "leq must be function of type int(" ++ 
              showType(outType) ++ ", " ++ 
              showType(outType) ++ "), not " ++ 
              showType(leq.typerep))]
      end

      ++ 
    
      case disp.typerep of 
        functionType(builtinType(nilQualifier(), voidType()),
        protoFunctionType([t], false),_) -> 
          if compatibleTypes(t, outType, false, true)
          then []
          else [err(loc, 
               "disp must be function of type void(" ++
               showType(outType) ++ "), not " ++ 
               showType(disp.typerep))]
      | pointerType(_, functionType(builtinType(nilQualifier(), voidType()),
        protoFunctionType([t], false),_)) -> 
          if compatibleTypes(t, outType, false, true)
          then []
          else [err(loc, 
               "disp must be function of type void(" ++
               showType(outType) ++ "), not " ++ 
               showType(disp.typerep))]
      | _ -> [err(loc, 
             "disp must be function of type void(" ++
             showType(outType) ++ "), not " ++ 
             showType(disp.typerep))]
      end
      
      ++

      case free.typerep of
        functionType(builtinType(nilQualifier(), voidType()),
        protoFunctionType([t], false),_) -> 
          if compatibleTypes(t, outType, false, true)
          then []
          else [err(loc, 
               "free must be function of type void(" ++
               showType(outType) ++ 
               "), not " ++ showType(free.typerep))]
      | pointerType(_, functionType(builtinType(nilQualifier(), voidType()),
        protoFunctionType([t], false),_)) -> 
          if compatibleTypes(t, outType, false, true)
          then []
          else [err(loc, 
               "free must be function of type void(" ++
               showType(outType) ++ 
               "), not " ++ showType(free.typerep))]
      | _ -> [err(loc, 
             "free must be function of type void(" ++
             showType(outType) ++ "), not " ++ 
             showType(free.typerep))]
      end;
}

function getTypeFromLub
Type ::= lub::Expr
{
  return
    case lub.typerep of
      functionType(outValueType, protoFunctionType([t1, t2], false),_) ->
        case outValueType of
          pointerType(_, valueType(_, outTypeActual)) -> outTypeActual
        | _ -> errorType()
        end
    | pointerType(_, functionType(outValueType, 
      protoFunctionType([t1, t2], false),_)) ->
        case outValueType of
          pointerType(_, valueType(_, outTypeActual)) -> outTypeActual
        | _ -> errorType()
        end
    | _ -> errorType()
    end;
}

abstract production newLattice
top::Expr ::= leq::Expr lub::Expr disp::Expr free::Expr
{
  propagate substituted;
  top.pp =
    pp"lattice(${leq.pp}, ${lub.pp}, ${disp.pp}, ${free.pp})";

  local childErrors::[Message] =
    leq.errors ++
    lub.errors ++ disp.errors ++ free.errors;

  local localErrors::[Message] = 
    checkLvarHeaderDef(top.location, top.env) ++ 
    case lub.typerep of
      functionType(outValueType, protoFunctionType([t1, t2], false),_) ->
        case outValueType of
          pointerType(_, valueType(_, outType)) -> 
            if compatibleTypes(t1, outType, false, true)
              && compatibleTypes(t2, outType, false, true)
            then latticeCheckHelper(top.location, outType, leq, disp, free)
            else [err(top.location, 
               "lub must be function of type Value<" ++
               showType(outType) ++ ">* (" ++ showType(outType) ++
               ", " ++ showType(outType) ++ "), not " ++ 
               showType(lub.typerep))]
       | _ -> [err(top.location, 
          "lub must be function of type Value<a>*(), not " ++ 
          showType(lub.typerep))]
       end
    | pointerType(_, functionType(outValueType, 
        protoFunctionType([t1, t2], false),_)) -> 
        case outValueType of
          pointerType(_, valueType(_, outType)) -> 
            if compatibleTypes(t1, outType, false, true)
              && compatibleTypes(t2, outType, false, true)
            then latticeCheckHelper(top.location, outType, leq, disp, free)
            else [err(top.location, 
               "lub must be function of type Value<" ++
               showType(outType) ++ ">* (" ++ showType(outType) ++
               ", " ++ showType(outType) ++ "), not " ++ 
               showType(lub.typerep))]
       | _ -> [err(top.location, 
          "lub must be function of type Value<a>*(), not " ++ 
          showType(lub.typerep))]
       end
    | _ -> [err(top.location, 
           "lub must be function of type Value<a>*(), not " ++ 
           showType(lub.typerep))]
    end;
              
  forwards to
    mkErrorCheck(childErrors ++ localErrors,
      ableC_Expr{
       inst _newLattice<$directTypeExpr{getTypeFromLub(lub)}>(    
       $Expr{leq}, $Expr{lub}, $Expr{disp}, $Expr{free})
      }
    );
}

abstract production newLatticeNoFree
top::Expr ::= leq::Expr lub::Expr disp::Expr
{
  propagate substituted;
  top.pp =
    pp"lattice(${leq.pp}, ${lub.pp}, ${disp.pp})";

  local childErrors::[Message] =
    leq.errors ++
    lub.errors ++ disp.errors;  

  forwards to newLattice(leq, lub, disp, 
    ableC_Expr{inst _defaultFree<$directTypeExpr{getTypeFromLub(lub)}>},
    location=top.location);
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

abstract production freeLvar
top::Expr ::= lvar::Expr
{
  propagate substituted;
  top.pp = pp"freeLvar(${lvar.pp})";

  local localErrors::[Message] =
    checkLvarHeaderDef(top.location, top.env) ++ lvar.errors;

  local fwrd::Expr =
    case lvar.typerep of
      pointerType(_, lvarType(_, t)) -> 
        ableC_Expr {
          inst _freeLvar<$directTypeExpr{t}>($Expr{lvar})
        }
    | _ ->
        errorExpr([err(top.location, 
        "Can't use freeLvar() with <" ++ showType(lvar.typerep) ++ ">")],
        location=top.location)
    end;

  forwards to mkErrorCheck(localErrors, fwrd);
}

abstract production freeLattice
top::Expr ::= lat::Expr
{
  propagate substituted;
  top.pp = pp"freeLattice(${lat.pp})";

  local localErrors::[Message] =
    checkLvarHeaderDef(top.location, top.env) ++ lat.errors;

  local fwrd::Expr =
    case lat.typerep of
      pointerType(_, latticeType(_, t)) -> 
        ableC_Expr {
          inst _freeLattice<$directTypeExpr{t}>($Expr{lat})
        }
    | _ ->
        errorExpr([err(top.location, 
        "Can't use freeLattice() with <" ++ showType(lat.typerep) ++ ">")],
        location=top.location)
    end;

  forwards to mkErrorCheck(localErrors, fwrd);
}

abstract production freeActSets
top::Expr ::= thresh::Expr
{
  propagate substituted;
  top.pp = pp"freeActSets(${thresh.pp})";

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
        "Can't use freeActSets() with <" ++ showType(thresh.typerep) ++ ">")],
        location=top.location)
    end;

  forwards to mkErrorCheck(localErrors, fwrd);
}

// ************************* show productions *********************************

abstract production showLvars
top::Expr ::= e::Expr
{
  propagate substituted;
  top.pp = pp"display(${e.pp})";
  
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
      "Can't use display() with <" ++
       showType(e.typerep) ++">")], location=top.location)
    end;
      
  forwards to mkErrorCheck(localErrors, fwrd);
}

// to show an lvar (if possible)

abstract production showLvar 
top::Expr ::= baseType::Type l::Expr
{
  propagate substituted;
  top.pp = pp"display(${l.pp})";

  local localErrors::[Message] =
    checkLvarHeaderDef(top.location, top.env) ++ baseType.errors ++ l.errors;

  forwards to
    mkErrorCheck(localErrors,
    ableC_Expr{
      inst _displayLvar<$directTypeExpr{baseType}>($Expr{l})
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
       "get expected first argument of type Lvar*, got type "
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

// to get a value from an lvar
// lvarBaseType helps determine the base type of the lvar

abstract production getCallHelperNoThresh
top::Expr ::=  lvarBaseType::Type lvar::Expr
{
  propagate substituted;
  top.pp = pp"get(${lvar.pp})";

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

// to check for errors in a call to putD(), and forward onward as appropriate

abstract production destrPutCall
top::Expr ::= lvar::Expr value::Expr
{
  propagate substituted;
  top.pp = pp"putD(${lvar.pp}, ${value.pp})";

  local localErrors::[Message] = 
    checkLvarHeaderDef(top.location, top.env) ++ lvar.errors ++ value.errors;

  local fwrd::Expr =
    case lvar.typerep of
      pointerType(_, lvarType(_, l_t)) ->
        putDCallHelper(l_t, lvar, value, location=top.location)
    | _ -> errorExpr([err(top.location, 
          "putD() expected first argument of type Lvar*, got type <"
          ++ showType(lvar.typerep) ++ ">")], location=top.location)
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
  top.pp = pp"putD(${lvar.pp}, ${value.pp})";

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
      inst _put_destructive<$directTypeExpr{lvarBaseType}>($Expr{lvar}, $Expr{value})
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

//**************************** check productions *******************************

abstract production checkLeq
top::Expr ::= lat::Expr smallElem::Expr bigElem::Expr
{
  propagate substituted;
  top.pp = pp"checkLeq(${lat.pp}, ${smallElem.pp}, ${bigElem.pp})";

  local localErrors::[Message] = 
    checkLvarHeaderDef(top.location, top.env) ++ lat.errors
    ++ smallElem.errors ++ bigElem.errors;

  local fwrd::Expr =
    case lat.typerep of
      pointerType(_, latticeType(_, l_t)) ->
        if compatibleTypes(l_t, smallElem.typerep, false, true) &&
           compatibleTypes(l_t, bigElem.typerep, false, true)
        then 
          ableC_Expr{
            inst _checkLeq<$directTypeExpr{l_t}>($Expr{lat}, 
                            $Expr{smallElem}, $Expr{bigElem})
          }
        else errorExpr([err(top.location, 
          "Sample lattice elements in checkLeq() must match base type "
          ++ " of lattice (should be type <"
          ++ showType(lat.typerep) ++ ">)")], location=top.location)
    | _ -> errorExpr([err(top.location, 
          "checkLeq() expected first argument of type Lattice*, got type <"
          ++ showType(lat.typerep) ++ ">")], location=top.location)
    end;

  forwards to 
    mkErrorCheck(localErrors, fwrd);
}

abstract production checkLub
top::Expr ::= lat::Expr rep1::Expr rep2::Expr expLub::Expr eqFunc::Expr
{
  propagate substituted;
  top.pp = pp"checkLub(${lat.pp}, ${rep1.pp}, ${rep2.pp}, ${expLub.pp}, ${eqFunc.pp})";

  local localErrors::[Message] = 
    checkLvarHeaderDef(top.location, top.env) ++ lat.errors
    ++ rep1.errors ++ rep2.errors ++ expLub.errors ++ eqFunc.errors;

  local fwrd::Expr =
    case lat.typerep of
      pointerType(_, latticeType(_, l_t)) ->
        if compatibleTypes(l_t, rep1.typerep, false, true) &&
           compatibleTypes(l_t, rep2.typerep, false, true) &&
           compatibleTypes(l_t, expLub.typerep, false, true)
        then 
          ableC_Expr{
            inst _checkLub<$directTypeExpr{l_t}>($Expr{lat}, 
            $Expr{rep1}, $Expr{rep2}, $Expr{expLub}, $Expr{eqFunc})
          }
        else errorExpr([err(top.location, 
          "Sample lattice elements in checkLub() must match base type "
          ++ " of lattice (should be type <"
          ++ showType(lat.typerep) ++ ">)")], location=top.location)
    | _ -> errorExpr([err(top.location, 
          "checkLub() expected first argument of type Lattice*, got type <"
          ++ showType(lat.typerep) ++ ">")], location=top.location)
    end;

  forwards to 
    mkErrorCheck(localErrors, fwrd);
}

abstract production checkLattice
top::Expr ::= lat::Expr rep1::Expr rep2::Expr expLub::Expr eqFunc::Expr
{
  propagate substituted;
  top.pp = pp"checkLattice(${lat.pp}, ${rep1.pp}, ${rep2.pp}, ${expLub.pp}, ${eqFunc.pp})";

  forwards to 
    andExpr(checkLeq(lat, rep1, rep2, location=top.location),
    checkLub(lat, rep1, rep2, expLub, eqFunc, location=top.location),
    location=top.location);
}

abstract production getLattice
top::Expr ::= lvar::Expr
{
  propagate substituted;
  top.pp = pp"getLattice(${lvar.pp})";

  local localErrors::[Message] =
    checkLvarHeaderDef(top.location, top.env) ++ lvar.errors;

  local fwrd::Expr =
    case lvar.typerep of
      pointerType(_, lvarType(_, t)) -> 
        ableC_Expr {
          inst _getLattice<$directTypeExpr{t}>($Expr{lvar})
        }
    | _ ->
        errorExpr([err(top.location, 
        "Can't use getLattice() with <" ++ showType(lvar.typerep) ++ ">")],
        location=top.location)
    end;

  forwards to mkErrorCheck(localErrors, fwrd);
}

abstract production makeValue
top::Expr ::= val::Expr
{
  propagate substituted;
  top.pp = pp"value(${val.pp})";

  forwards to 
    ableC_Expr{
      inst _newValue<$directTypeExpr{val.typerep}>($Expr{val})
    };
}

abstract production makeTop
top::Expr ::= typ::TypeName
{
  propagate substituted;
  top.pp = pp"top<${typ.pp}>";

  forwards to 
    ableC_Expr{
      inst _newTop<$directTypeExpr{typ.typerep}>()
    };
}

global builtin::Location = builtinLoc("lvars");

