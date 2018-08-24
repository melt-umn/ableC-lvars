grammar edu:umn:cs:melt:exts:ableC:lvars:abstractsyntax;

function latticeCheckHelper
[Message] ::= loc::Location outType::Type leq::Expr disp::Expr free::Expr e::Decorated Env
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
              
  forwards to
    mkErrorCheck(childErrors ++ localErrors,
      ableC_Expr{
       inst _newLattice<$directTypeExpr{getTypeFromLub(lub, 
         openScopeEnv(top.env))}>(    
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
    ableC_Expr{inst _defaultFree<$directTypeExpr
      {getTypeFromLub(lub, openScopeEnv(top.env))}>},
    location=top.location);
}

abstract production makeLvar
top::Expr ::= leq::Expr lub::Expr disp::Expr free::Expr
{
  propagate substituted;
  top.pp =
    pp"makeLvar(${leq.pp}, ${lub.pp}, ${disp.pp}, ${free.pp})";

  local childErrors::[Message] =
    leq.errors ++ lub.errors ++ disp.errors ++ free.errors;

  forwards to newCall(newLattice(leq, lub, disp, free,
     location=top.location), location=top.location);
}

abstract production makeLvarDefaults
top::Expr ::= leq::Expr lub::Expr
{
  propagate substituted;
  top.pp =
    pp"makeLvar(${leq.pp}, ${lub.pp})";

  local childErrors::[Message] =
    leq.errors ++
    lub.errors;

  local baseType::Type = getTypeFromLub(lub, openScopeEnv(top.env));

  forwards to newCall(newLattice(leq, lub, 
     ableC_Expr{inst _defaultDisplay<$directTypeExpr{baseType}>}, 
     ableC_Expr{inst _defaultFree<$directTypeExpr{baseType}>},
     location=top.location), location=top.location);
}