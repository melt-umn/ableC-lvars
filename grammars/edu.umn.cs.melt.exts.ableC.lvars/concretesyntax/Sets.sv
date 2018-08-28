grammar edu:umn:cs:melt:exts:ableC:lvars:concretesyntax;

marking terminal ActivationSet_t 'activationSet' lexer classes {Ckeyword};
marking terminal ThresholdSet_t 'thresholdSet' lexer classes {Ckeyword};
marking terminal Add_t 'add' lexer classes {Ckeyword};
marking terminal FreeSet_t 'freeSet' lexer classes {Ckeyword};
marking terminal FreeActSets_t 'freeActSets' lexer classes {Ckeyword};

inherited attribute lattice::Expr;

closed nonterminal ActInitializer_c with location, ast<Expr>, lattice;
closed nonterminal ThreshInitializer_c with location, ast<Expr>, lattice;
closed nonterminal ConstructorExprList_c with location, ast<[Expr]>;

concrete productions top::PrimaryExpr_c
| 'activationSet' '(' lattice::AssignExpr_c init::ActInitializer_c
  { 
    top.ast = init.ast;
    init.lattice = lattice.ast;
  }
| 'thresholdSet' '(' lattice::AssignExpr_c init::ThreshInitializer_c
  {
    top.ast = init.ast;
    init.lattice = lattice.ast;
  }

concrete productions top::ActInitializer_c
| ')'
  {
    top.ast = newActWithInitAndSize(top.lattice, [],
              mkIntConst(20, top.location), location=top.location);
  }
| ',' size::AssignExpr_c ')'
  {
    top.ast = newActWithInitAndSize(top.lattice, [], size.ast,
              location=top.location);
  }
| ')' '{' items::ConstructorExprList_c '}'
  {
    top.ast = newActWithInitAndSize(top.lattice, items.ast,
              mkIntConst(20, top.location), location=top.location);
  }
| ',' size::AssignExpr_c ')' '{' items::ConstructorExprList_c '}'
  {
    top.ast = newActWithInitAndSize(top.lattice, items.ast, size.ast,
              location=top.location);
  }

concrete productions top::ThreshInitializer_c
| ')'
  {
    top.ast = newThreshWithInitAndSize(top.lattice, [],
              mkIntConst(20, top.location), location=top.location);
  }
| ',' size::AssignExpr_c ')'
  {
    top.ast = newThreshWithInitAndSize(top.lattice, [], size.ast,
              location=top.location);
  }
| ')' '{' items::ConstructorExprList_c '}'
  {
    top.ast = newThreshWithInitAndSize(top.lattice, items.ast,
              mkIntConst(20, top.location), location=top.location);
  }
| ',' size::AssignExpr_c ')' '{' items::ConstructorExprList_c '}'
  {
    top.ast = newThreshWithInitAndSize(top.lattice, items.ast, size.ast,
              location=top.location);
  }

concrete productions top::ConstructorExprList_c
| e::AssignExpr_c
    { top.ast = [e.ast]; }

| t::AssignExpr_c ',' h::ConstructorExprList_c
    { top.ast = h.ast ++ [t.ast]; }

concrete productions top::UnaryOp_c
| 'freeSet'
  {
    top.ast = freeSet(top.expr, location=top.location);
  }
| 'freeActSets'
  {
    top.ast = freeActSets(top.expr, location=top.location);
  }

concrete productions top::PrimaryExpr_c
| 'add' '(' set::AssignExpr_c ',' item::AssignExpr_c ')'
  {
    top.ast = add(set.ast, item.ast, location=top.location);
  }
