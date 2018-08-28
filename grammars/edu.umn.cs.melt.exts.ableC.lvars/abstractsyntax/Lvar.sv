grammar edu:umn:cs:melt:exts:ableC:lvars:abstractsyntax;

// *************** lvar productions *******************************************

// checks for errors and forwards to _freeLvar<a> if correct
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
        "freeLvar expected argument of type Lvar<a>*, got " ++ 
        showType(lvar.typerep))], location=top.location)
    end;

  forwards to mkErrorCheck(localErrors, fwrd);
}

// checks for errors and forwards to _new<a> if correct
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

// checks for errors and forwards to _freeze<a> if correct
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


// checks for errors and forwards to _getLattice<a> if correct
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

