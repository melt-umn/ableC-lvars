grammar edu:umn:cs:melt:exts:ableC:lvars:concretesyntax;

marking terminal Leq_t 'leq' lexer classes {Ckeyword};

concrete productions top::PrimaryExpr_c
| 'leq' '(' lattice::AssignExpr_c ',' val1::AssignExpr_c ',' val2::AssignExpr_c ')'
  {
    top.ast = leq(lattice.ast, val1.ast, val2.ast, location=top.location);
  }
