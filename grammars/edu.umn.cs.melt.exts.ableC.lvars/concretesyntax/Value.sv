grammar edu:umn:cs:melt:exts:ableC:lvars:concretesyntax;

marking terminal Top_t 'Top' lexer classes {Ckeyword};
marking terminal Value_t 'value' lexer classes {Ckeyword};
marking terminal IsTop_t 'isTop' lexer classes {Ckeyword};

concrete productions top::PrimaryExpr_c
| 'Top' '<' typ::TypeName_c '>'
  {
    top.ast = makeTop(typ.ast, location=top.location);
  }

concrete productions top::UnaryOp_c
| 'isTop' 
  {
    top.ast = isTop(top.expr, location=top.location);
  }
| 'value'
  {
    top.ast = makeValue(top.expr, location=top.location);
  }


