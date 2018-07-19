grammar edu:umn:cs:melt:exts:ableC:lvars:concretesyntax;

marking terminal New_t 'newLvar' lexer classes {Ckeyword};
marking terminal Put_t 'put' lexer classes {Ckeyword};
marking terminal Get_t 'get' lexer classes {Ckeyword};
marking terminal Add_t 'add' lexer classes {Ckeyword};
marking terminal FreeSet_t 'freeSet' lexer classes {Ckeyword};
marking terminal Freeze_t 'freeze' lexer classes {Ckeyword};

closed nonterminal LvarInitializer_c with location, ast<Expr>, lattice;

concrete productions top::LvarInitializer_c
| ')'
  {
    top.ast = newCall(top.lattice, location=top.location);
  }

concrete productions top::PrimaryExpr_c
| 'newLvar' '(' lattice::AssignExpr_c init::LvarInitializer_c
  { 
    top.ast = init.ast;
    init.lattice = lattice.ast;
  }
| 'put' '(' lvar::AssignExpr_c ',' value::AssignExpr_c ')'
  {
    top.ast = putCall(lvar.ast, value.ast, location=top.location);
  }
| 'get' '(' lvar::AssignExpr_c ',' threshold::AssignExpr_c ')'
  {
    top.ast = getCall(lvar.ast, threshold.ast, location=top.location);
  }
| 'add' '(' set::AssignExpr_c ',' item::AssignExpr_c ')'
  {
    top.ast = add(set.ast, item.ast, location=top.location);
  }
| 'freeSet' '(' s::AssignExpr_c ')'
  {
    top.ast = freeSet(s.ast, location=top.location);
  }
| 'freeze' '(' s::AssignExpr_c ')'
  {
    top.ast = freeze(s.ast, location=top.location);
  }
