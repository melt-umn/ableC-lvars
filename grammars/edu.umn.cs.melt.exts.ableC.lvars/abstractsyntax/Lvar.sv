grammar edu:umn:cs:melt:exts:ableC:lvars:abstractsyntax;

abstract production freeLvar
top::Expr ::= lvar::Expr
{
  propagate substituted;
  top.pp = pp"freeLvar ${lvar.pp}";

  local headerError::[Message] = checkLvarHeaderDef(top.location, top.env);
  local localErrors::[Message] =
    if null(headerError)
    then lvar.errors
    else headerError;

  local fwrd::Expr =
    case lvar.typerep of
      pointerType(_, lvarType(_, t)) -> 
        ableC_Expr {
          inst _freeLvar<$directTypeExpr{t}>($Expr{lvar})
        }
    | _ ->
        errorExpr([err(top.location, 
        "freeLvar expected argument of type Lvar<a>*, got " ++ showType(lvar.typerep))],
        location=top.location)
    end;

  forwards to mkErrorCheck(localErrors, fwrd);
}

// to show an lvar (if possible)

abstract production showLvar 
top::Expr ::= baseType::Type l::Expr
{
  propagate substituted;
  top.pp = pp"display ${l.pp}";

  local headerError::[Message] = checkLvarHeaderDef(top.location, top.env);
  local localErrors::[Message] =
    if null(headerError)
    then baseType.errors ++ l.errors
    else headerError;

  forwards to
    mkErrorCheck(localErrors,
    ableC_Expr{
      inst _displayLvar<$directTypeExpr{baseType}>($Expr{l})
    });
}


// to create a new lvar from a lattice

abstract production newCall
top::Expr ::= l::Expr
{
  propagate substituted;
  top.pp = pp"newLvar ${l.pp}";

  local headerError::[Message] = checkLvarHeaderDef(top.location, top.env);
  local localErrors::[Message] =
    if null(headerError)
    then l.errors
    else headerError;

  local fwrd::Expr =
    case l.typerep of
      pointerType(_, latticeType(_, l_t)) ->
        ableC_Expr{
          inst _new<$directTypeExpr{l_t}>($Expr{l})
        }
    | _ -> errorExpr([err(top.location,
          "newLvar expected argument of type Lattice<a>*, got type "
          ++ showType(l.typerep))], location=top.location)
    end;

  forwards to 
    mkErrorCheck(localErrors, fwrd);
}

abstract production freeze
top::Expr ::= lvar::Expr
{
  propagate substituted;
  top.pp = pp"freeze ${lvar.pp}";

  local headerError::[Message] = checkLvarHeaderDef(top.location, top.env);
  local localErrors::[Message] =
    if null(headerError)
    then lvar.errors
    else headerError;

  local fwrd::Expr =
    case lvar.typerep of
      pointerType(_, lvarType(_, l_t)) ->
        ableC_Expr{
          inst _freeze<$directTypeExpr{l_t}>($Expr{lvar})
        }
    | _ -> errorExpr([err(top.location, 
          "freeze expected argument of type Lvar<a>*, got type "
          ++ showType(lvar.typerep))], location=top.location)
    end;

  forwards to 
    mkErrorCheck(localErrors, fwrd);
}

abstract production getLattice
top::Expr ::= lvar::Expr
{
  propagate substituted;
  top.pp = pp"getLattice ${lvar.pp}";

  local headerError::[Message] = checkLvarHeaderDef(top.location, top.env);
  local localErrors::[Message] =
    if null(headerError)
    then lvar.errors
    else headerError;

  local fwrd::Expr =
    case lvar.typerep of
      pointerType(_, lvarType(_, t)) -> 
        ableC_Expr {
          inst _getLattice<$directTypeExpr{t}>($Expr{lvar})
        }
    | _ ->
        errorExpr([err(top.location, 
        "getLattice expected argument of type Lvar<a>*, got type "
        ++ showType(lvar.typerep))],
        location=top.location)
    end;

  forwards to mkErrorCheck(localErrors, fwrd);
}

