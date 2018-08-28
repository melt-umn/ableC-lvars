grammar edu:umn:cs:melt:exts:ableC:lvars:abstractsyntax;

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
            consTypeName(sub, nilTypeName()))]),
        directTypeExpr(actType(q, sub.typerep)));
}

abstract production actType
top::Type ::= q::Qualifiers sub::Type
{
  top.lpp = pp"${terminate(space(), q.pps)}ActivationSet<${sub.lpp}${sub.rpp}>";
  top.rpp = pp"";
  
  top.withTypeQualifiers = actType(foldQualifier(top.addedTypeQualifiers ++
                                   q.qualifiers), sub);

  forwards to
    tagType(
      q,
      refIdTagType(
        structSEU(),
        templateMangledName("_ActivationSet", [sub]),
        templateMangledRefId("_ActivationSet", [sub])));
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
            consTypeName(sub, nilTypeName()))]),
        directTypeExpr(threshType(q, sub.typerep)));
}

abstract production threshType
top::Type ::= q::Qualifiers sub::Type
{
  top.lpp = pp"${terminate(space(), q.pps)}ThresholdSet<${sub.lpp}${sub.rpp}>";
  top.rpp = pp"";
  
  top.withTypeQualifiers = threshType(foldQualifier(top.addedTypeQualifiers ++
                                   q.qualifiers), sub);

  forwards to
    tagType(
      q,
      refIdTagType(
        structSEU(),
        templateMangledName("_ThresholdSet", [sub]),
        templateMangledRefId("_ThresholdSet", [sub])));
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
            consTypeName(sub, nilTypeName()))]),
        directTypeExpr(lvarType(q, sub.typerep)));
}

abstract production lvarType
top::Type ::= q::Qualifiers sub::Type
{
  top.lpp = pp"${terminate(space(), q.pps)}Lvar<${sub.lpp}${sub.rpp}>";
  top.rpp = pp"";
  
  top.withTypeQualifiers = lvarType(foldQualifier(top.addedTypeQualifiers ++
                                   q.qualifiers), sub);

  forwards to
    tagType(
      q,
      refIdTagType(
        structSEU(),
        templateMangledName("_Lvar", [sub]),
        templateMangledRefId("_Lvar", [sub])));
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
            consTypeName(sub, nilTypeName()))]),
        directTypeExpr(latticeType(q, sub.typerep)));
}

abstract production latticeType
top::Type ::= q::Qualifiers sub::Type
{
  top.lpp = pp"${terminate(space(), q.pps)}Lattice<${sub.lpp}${sub.rpp}>";
  top.rpp = pp"";
  
  top.withTypeQualifiers = latticeType(foldQualifier(top.addedTypeQualifiers ++
                                   q.qualifiers), sub);

  forwards to
    tagType(
      q,
      refIdTagType(
        structSEU(),
        templateMangledName("_Lattice", [sub]),
        templateMangledRefId("_Lattice", [sub])));
}

//********************************* Value ****************************

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
            consTypeName(sub, nilTypeName()))]),
        directTypeExpr(valueType(q, sub.typerep)));
}

abstract production valueType
top::Type ::= q::Qualifiers sub::Type
{
  top.lpp = pp"${terminate(space(), q.pps)}Value<${sub.lpp}${sub.rpp}>";
  top.rpp = pp"";
  
  top.withTypeQualifiers = valueType(foldQualifier(top.addedTypeQualifiers ++
                                   q.qualifiers), sub);

  forwards to
    tagType(
      q,
      refIdTagType(
        structSEU(),
        templateMangledName("_Value", [sub]),
        templateMangledRefId("_Value", [sub])));
}

