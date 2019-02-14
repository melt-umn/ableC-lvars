grammar edu:umn:cs:melt:exts:ableC:lvars:abstractsyntax;

import edu:umn:cs:melt:ableC:abstractsyntax:overloadable;

//********************************* Activation Set ****************************

abstract production actTypeExpr 
top::BaseTypeExpr ::= q::Qualifiers sub::TypeName
{
  propagate substituted;
  top.pp = pp"${terminate(space(), q.pps)}ActivationSet<${sub.pp}>";
  
  sub.env = globalEnv(top.env);

  local headerError::[Message] = checkLvarHeaderDef(builtin, top.env);
  local localErrors::[Message] =
    if null(headerError)
    then sub.errors
    else headerError;

  forwards to
    if !null(localErrors)
    then errorTypeExpr(localErrors)
    else
      injectGlobalDeclsTypeExpr(
        foldDecl([
          templateTypeExprInstDecl(
            q,
            name("_ActivationSet", location=builtin),
            [sub.typerep])]),
        extTypeExpr(q, actType(sub.typerep)));
}

abstract production actType
top::ExtType ::= sub::Type
{
  top.pp = pp"${terminate(space(), top.givenQualifiers.pps)}ActivationSet<${sub.lpp}${sub.rpp}>";
  
  top.host =
    extType(
      top.givenQualifiers,
      refIdExtType(
        structSEU(),
        templateMangledName("_ActivationSet", [sub]),
        templateMangledRefId("_ActivationSet", [sub])));

  top.mangledName = s"ActivationSet_${sub.mangledName}_";

  top.isEqualTo =
    \ other::ExtType ->
      case other of
      | actType(otherSub) -> compatibleTypes(sub, otherSub, false, false)
      | _ -> false
      end;
}

//******************************** Threshold Set type *************************

abstract production threshTypeExpr 
top::BaseTypeExpr ::= q::Qualifiers sub::TypeName
{
  propagate substituted;
  top.pp = pp"${terminate(space(), q.pps)}ThresholdSet<${sub.pp}>";
  
  sub.env = globalEnv(top.env);

  local headerError::[Message] = checkLvarHeaderDef(builtin, top.env);
  local localErrors::[Message] =
    if null(headerError)
    then sub.errors
    else headerError;
  
  forwards to
    if !null(localErrors)
    then errorTypeExpr(localErrors)
    else
      injectGlobalDeclsTypeExpr(
        foldDecl([
          templateTypeExprInstDecl(
            q,
            name("_ThresholdSet", location=builtin),
            [sub.typerep])]),
        extTypeExpr(q, threshType(sub.typerep)));
}

abstract production threshType
top::ExtType ::= sub::Type
{
  top.pp = pp"${terminate(space(), top.givenQualifiers.pps)}ThresholdSet<${sub.lpp}${sub.rpp}>";
  
  top.host =
    extType(
      top.givenQualifiers,
      refIdExtType(
        structSEU(),
        templateMangledName("_ThresholdSet", [sub]),
        templateMangledRefId("_ThresholdSet", [sub])));

  top.mangledName = s"ThresholdSet_${sub.mangledName}_";

  top.isEqualTo =
    \ other::ExtType ->
      case other of
      | threshType(otherSub) -> compatibleTypes(sub, otherSub, false, false)
      | _ -> false
      end;
}

//******************************** Lvar type **********************************

abstract production lvarTypeExpr 
top::BaseTypeExpr ::= q::Qualifiers sub::TypeName
{
  propagate substituted;
  top.pp = pp"${terminate(space(), q.pps)}Lvar<${sub.pp}>";
  
  sub.env = globalEnv(top.env);
  
  local headerError::[Message] = checkLvarHeaderDef(builtin, top.env);
  local localErrors::[Message] =
    if null(headerError)
    then sub.errors
    else headerError;
  
  forwards to
    if !null(localErrors)
    then errorTypeExpr(localErrors)
    else
      injectGlobalDeclsTypeExpr(
        foldDecl([
          templateTypeExprInstDecl(
            q,
            name("_Lvar", location=builtin),
            [sub.typerep])]),
        extTypeExpr(q, lvarType(sub.typerep)));
}

abstract production lvarType
top::ExtType ::= sub::Type
{
  top.pp = pp"${terminate(space(), top.givenQualifiers.pps)}Lvar<${sub.lpp}${sub.rpp}>";
  
  top.host =
    extType(
      top.givenQualifiers,
      refIdExtType(
        structSEU(),
        templateMangledName("_Lvar", [sub]),
        templateMangledRefId("_Lvar", [sub])));

  top.mangledName = s"Lvar_${sub.mangledName}_";

  top.isEqualTo =
    \ other::ExtType ->
      case other of
      | lvarType(otherSub) -> compatibleTypes(sub, otherSub, false, false)
      | _ -> false
      end;
}

//******************************** Lattice type *******************************

abstract production latticeTypeExpr 
top::BaseTypeExpr ::= q::Qualifiers sub::TypeName
{
  propagate substituted;
  top.pp = pp"${terminate(space(), q.pps)}Lattice<${sub.pp}>";
  
  sub.env = globalEnv(top.env);

  local headerError::[Message] = checkLvarHeaderDef(builtin, top.env);
  local localErrors::[Message] =
    if null(headerError)
    then sub.errors
    else headerError;
  
  forwards to
    if !null(localErrors)
    then errorTypeExpr(localErrors)
    else
      injectGlobalDeclsTypeExpr(
        foldDecl([
          templateTypeExprInstDecl(
            q,
            name("_Lattice", location=builtin),
            [sub.typerep])]),
        extTypeExpr(q, latticeType(sub.typerep)));
}

abstract production latticeType
top::ExtType ::= sub::Type
{
  top.pp = pp"${terminate(space(), top.givenQualifiers.pps)}Lattice<${sub.lpp}${sub.rpp}>";
  
  top.host =
    extType(
      top.givenQualifiers,
      refIdExtType(
        structSEU(),
        templateMangledName("_Lattice", [sub]),
        templateMangledRefId("_Lattice", [sub])));

  top.mangledName = s"Lattice_${sub.mangledName}_";

  top.isEqualTo =
    \ other::ExtType ->
      case other of
      | latticeType(otherSub) -> compatibleTypes(sub, otherSub, false, false)
      | _ -> false
      end;
}

//********************************* Value type ********************************

abstract production valueTypeExpr 
top::BaseTypeExpr ::= q::Qualifiers sub::TypeName
{
  propagate substituted;
  top.pp = pp"${terminate(space(), q.pps)}Value<${sub.pp}>";
  
  sub.env = globalEnv(top.env);

  local headerError::[Message] = checkLvarHeaderDef(builtin, top.env);
  local localErrors::[Message] =
    if null(headerError)
    then sub.errors
    else headerError;
  
  forwards to
    if !null(localErrors)
    then errorTypeExpr(localErrors)
    else
      injectGlobalDeclsTypeExpr(
        foldDecl([
          templateTypeExprInstDecl(
            q,
            name("_Value", location=builtin),
            [sub.typerep])]),
        extTypeExpr(q, valueType(sub.typerep)));
}

abstract production valueType
top::ExtType ::= sub::Type
{
  top.pp = pp"${terminate(space(), top.givenQualifiers.pps)}Value<${sub.lpp}${sub.rpp}>";
  
  top.host =
    extType(
      top.givenQualifiers,
      refIdExtType(
        structSEU(),
        templateMangledName("_Value", [sub]),
        templateMangledRefId("_Value", [sub])));

  top.mangledName = s"Value_${sub.mangledName}_";

  top.isEqualTo =
    \ other::ExtType ->
      case other of
      | valueType(otherSub) -> compatibleTypes(sub, otherSub, false, false)
      | _ -> false
      end;
}

