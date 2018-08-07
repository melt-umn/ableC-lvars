grammar edu:umn:cs:melt:exts:ableC:lvars:concretesyntax;
imports edu:umn:cs:melt:exts:ableC:lvars:abstractsyntax;

marking terminal Lattice_t 'lattice' lexer classes {Ckeyword};
marking terminal ActivationSet_t 'activationSet' lexer classes {Ckeyword};
marking terminal ThresholdSet_t 'thresholdSet' lexer classes {Ckeyword};

inherited attribute lattice::Expr;

closed nonterminal ActInitializer_c with location, ast<Expr>, lattice;
closed nonterminal ThreshInitializer_c with location, ast<Expr>, lattice;
closed nonterminal ConstructorExprList_c with location, ast<[Expr]>;

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

concrete productions top::PrimaryExpr_c
| 'lattice' '(' least::AssignExpr_c ',' greatest::AssignExpr_c ','
                order::AssignExpr_c ',' lub::AssignExpr_c ',' 
                display::AssignExpr_c ',' freeMeth::AssignExpr_c ')'
  {
    top.ast = newLattice(least.ast, greatest.ast, order.ast, lub.ast,
                         display.ast, freeMeth.ast, location=top.location);
  }

| 'lattice' '(' least::AssignExpr_c ',' greatest::AssignExpr_c ','
                order::AssignExpr_c ',' lub::AssignExpr_c ',' 
                display::AssignExpr_c ')'
  {
    top.ast = newLatticeNoFree(least.ast, greatest.ast, order.ast, lub.ast,
                         display.ast, location=top.location);
  }

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

concrete productions top::ConstructorExprList_c
| e::AssignExpr_c
    { top.ast = [e.ast]; }

| t::AssignExpr_c ',' h::ConstructorExprList_c
    { top.ast = h.ast ++ [t.ast]; }

