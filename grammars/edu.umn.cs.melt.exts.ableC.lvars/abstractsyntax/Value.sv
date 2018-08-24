grammar edu:umn:cs:melt:exts:ableC:lvars:abstractsyntax;

abstract production makeValue
top::Expr ::= val::Expr
{
  propagate substituted;
  top.pp = pp"value ${val.pp}";

  forwards to 
    ableC_Expr{
      inst _newValue<$directTypeExpr{val.typerep}>($Expr{val})
    };
}

abstract production makeTop
top::Expr ::= typ::TypeName
{
  propagate substituted;
  top.pp = pp"Top<${typ.pp}>";

  forwards to 
    ableC_Expr{
      inst _newTop<$directTypeExpr{typ.typerep}>()
    };
}

abstract production isTop
top::Expr ::= val::Expr
{
  propagate substituted;
  top.pp = pp"isTop ${val.pp}";

  forwards to
    case val.typerep of
      pointerType(_, valueType(_, t)) -> 
        ableC_Expr{
          inst _isTop<$directTypeExpr{t}>($Expr{val})
        }
    | _ -> errorExpr([err(top.location,
           "isTop expected argument of type Value<a>*, got type " ++
           showType(val.typerep))], location=top.location)
    end;
}

