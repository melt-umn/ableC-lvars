grammar edu:umn:cs:melt:exts:ableC:lvars:abstractsyntax;

// *************** lattice construction ***************************************

// check types of functions provided to lattice constructor
function latticeCheckHelper
[Message] ::= loc::Location outType::Type leq::Expr disp::Expr free::Expr 
              e::Decorated Env
{

  local loc_leq::Expr = leq;
  loc_leq.returnType = loc_leq.returnType;
  loc_leq.env = e;
  local loc_disp::Expr = disp;
  loc_disp.returnType = loc_leq.returnType;
  loc_disp.env = e;
  local loc_free::Expr = free;
  loc_free.returnType = loc_leq.returnType;
  loc_free.env = e;
 
  return 
      case loc_leq.typerep of
        functionType(t0, protoFunctionType([t1, t2], false),_) -> 
          if compatibleTypes(t1, outType, false, true)
             && compatibleTypes(t2, outType, false, true)
             && t0.isIntegerType
          then []
          else [err(loc, 
               "leq must be function of type int(" ++ 
               showType(outType) ++ ", " ++ showType(outType)
               ++ "), not " ++ showType(loc_leq.typerep))]
      | pointerType(_, 
          functionType(t0, protoFunctionType([t1, t2], false),_)) -> 
            if compatibleTypes(t1, outType, false, true)
              && compatibleTypes(t2, outType, false, true)
              && t0.isIntegerType
            then []
            else [err(loc, 
                  "leq must be function of type int(" ++ 
                  showType(outType) ++ ", " ++ showType(outType)
                  ++ "), not " ++ showType(loc_leq.typerep))]
    
      | _ -> [err(loc, 
             "leq must be function of type int(" ++ 
              showType(outType) ++ ", " ++ 
              showType(outType) ++ "), not " ++ 
              showType(loc_leq.typerep))]
      end

      ++ 
    
      case loc_disp.typerep of 
        functionType(builtinType(nilQualifier(), voidType()),
        protoFunctionType([t], false),_) -> 
          if compatibleTypes(t, outType, false, true)
          then []
          else [err(loc, 
               "display must be function of type void(" ++
               showType(outType) ++ "), not " ++ 
               showType(loc_disp.typerep))]
      | pointerType(_, functionType(builtinType(nilQualifier(), voidType()),
        protoFunctionType([t], false),_)) -> 
          if compatibleTypes(t, outType, false, true)
          then []
          else [err(loc, 
               "display must be function of type void(" ++
               showType(outType) ++ "), not " ++ 
               showType(loc_disp.typerep))]
      | _ -> [err(loc, 
             "display must be function of type void(" ++
             showType(outType) ++ "), not " ++ 
             showType(loc_disp.typerep))]
      end
      
      ++

      case loc_free.typerep of
        functionType(builtinType(nilQualifier(), voidType()),
        protoFunctionType([t], false),_) -> 
          if compatibleTypes(t, outType, false, true)
          then []
          else [err(loc, 
               "free must be function of type void(" ++
               showType(outType) ++ 
               "), not " ++ showType(loc_free.typerep))]
      | pointerType(_, functionType(builtinType(nilQualifier(), voidType()),
        protoFunctionType([t], false),_)) -> 
          if compatibleTypes(t, outType, false, true)
          then []
          else [err(loc, 
               "free must be function of type void(" ++
               showType(outType) ++ 
               "), not " ++ showType(loc_free.typerep))]
      | _ -> [err(loc, 
             "free must be function of type void(" ++
             showType(outType) ++ "), not " ++ 
             showType(loc_free.typerep))]
      end; 
}

// extract the desired base type for a lattice from the return of lub
function getTypeFromLub
Type ::= lub::Expr e::Decorated Env
{

  local loc_lub::Expr = lub;
  loc_lub.returnType = loc_lub.returnType;
  loc_lub.env = e;

  return
    case loc_lub.typerep of
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

// check for errors and call lattice constructor
abstract production newLattice
top::Expr ::= leq::Expr lub::Expr disp::Expr free::Expr destr::Expr
{
  propagate substituted;
  top.pp =
    pp"lattice(${leq.pp}, ${lub.pp}, ${disp.pp}, ${free.pp})";

  local childErrors::[Message] =
    leq.errors ++
    lub.errors ++ disp.errors ++ free.errors;

  local lvarErrors::[Message] = 
    checkLvarHeaderDef(top.location, top.env) ++ 
    case lub.typerep of
      functionType(outValueType, protoFunctionType([t1, t2], false),_) ->
        case outValueType of
          pointerType(_, valueType(_, outType)) -> 
            if compatibleTypes(t1, outType, false, true)
              && compatibleTypes(t2, outType, false, true)
            then latticeCheckHelper(top.location, outType, leq, disp, free,
                                    openScopeEnv(top.env))
            else [err(top.location, 
               "lub must be function of type Value<" ++
               showType(outType) ++ ">* (" ++ showType(outType) ++
               ", " ++ showType(outType) ++ "), not " ++ 
               showType(lub.typerep))]
       | _ -> [err(top.location, 
          "lub must be function of type Value<a>*(a, a), not " ++ 
          showType(lub.typerep))]
       end
    | pointerType(_, functionType(outValueType, 
        protoFunctionType([t1, t2], false),_)) -> 
        case outValueType of
          pointerType(_, valueType(_, outType)) -> 
            if compatibleTypes(t1, outType, false, true)
              && compatibleTypes(t2, outType, false, true)
            then latticeCheckHelper(top.location, outType, leq, disp, free,
                                    openScopeEnv(top.env))
            else [err(top.location, 
               "lub must be function of type Value<" ++
               showType(outType) ++ ">* (" ++ showType(outType) ++
               ", " ++ showType(outType) ++ "), not " ++ 
               showType(lub.typerep))]
       | _ -> [err(top.location, 
          "lub must be function of type Value<a>*(a, a), not " ++ 
          showType(lub.typerep))]
       end
    | _ -> [err(top.location, 
           "lub must be function of type Value<a>*(a, a), not " ++ 
           showType(lub.typerep))]
    end;

  local headerError::[Message] = checkLvarHeaderDef(top.location, top.env);
  local localErrors::[Message] =
    if null(headerError)
    then lvarErrors ++ childErrors
    else headerError;
              
  forwards to
    mkErrorCheck(localErrors,
      ableC_Expr{
       inst _newLattice<$directTypeExpr{getTypeFromLub(lub, 
         openScopeEnv(top.env))}>(    
       $Expr{leq}, $Expr{lub}, $Expr{disp}, $Expr{free}, $Expr{destr})
      }
    );
}

// sub default free into newLattice production
abstract production newLatticeNoFree
top::Expr ::= leq::Expr lub::Expr disp::Expr destr::Expr
{
  propagate substituted;
  top.pp = pp"lattice(${leq.pp}, ${lub.pp}, ${disp.pp})";

  forwards to newLattice(leq, lub, disp, 
    ableC_Expr{inst _defaultFree<$directTypeExpr
    {getTypeFromLub(lub, openScopeEnv(top.env))}>}, destr, 
    location=top.location);
}

// to make a new lattice and lvar from that lattice
abstract production makeLvar
top::Expr ::= leq::Expr lub::Expr disp::Expr free::Expr destr::Expr
{
  propagate substituted;
  top.pp =
    pp"makeLvar(${leq.pp}, ${lub.pp}, ${disp.pp}, ${free.pp})";

  forwards to newCall(newLattice(leq, lub, disp, free, destr, 
     location=top.location), location=top.location);
}

// sub default free and show into makeLvar
abstract production makeLvarDefaults
top::Expr ::= leq::Expr lub::Expr destr::Expr
{
  propagate substituted;
  top.pp =
    pp"makeLvar(${leq.pp}, ${lub.pp})";

  local baseType::Type = getTypeFromLub(lub, openScopeEnv(top.env));

  forwards to newCall(newLattice(leq, lub, 
     ableC_Expr{inst _defaultDisplay<$directTypeExpr{baseType}>}, 
     ableC_Expr{inst _defaultFree<$directTypeExpr{baseType}>}, destr, 
     location=top.location), location=top.location);
}
