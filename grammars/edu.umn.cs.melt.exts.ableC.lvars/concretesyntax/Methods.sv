grammar edu:umn:cs:melt:exts:ableC:lvars:concretesyntax;

marking terminal New_t 'newLvar' lexer classes {Ckeyword};
marking terminal Put_t 'put' lexer classes {Ckeyword};
marking terminal DestrPut_t 'putD' lexer classes {Ckeyword};
marking terminal Get_t 'get' lexer classes {Ckeyword};
marking terminal Add_t 'add' lexer classes {Ckeyword};
marking terminal FreeSet_t 'freeSet' lexer classes {Ckeyword};
marking terminal FreeLvar_t 'freeLvar' lexer classes {Ckeyword};
marking terminal FreeLattice_t 'freeLattice' lexer classes {Ckeyword};
marking terminal FreeActSets_t 'freeActSets' lexer classes {Ckeyword};
marking terminal Freeze_t 'freeze' lexer classes {Ckeyword}, precedence = 1;
marking terminal CheckLeq_t 'checkLeq' lexer classes {Ckeyword};
marking terminal CheckLub_t 'checkLub' lexer classes {Ckeyword};
marking terminal CheckLat_t 'checkLattice' lexer classes {Ckeyword};

//closed nonterminal LvarInitializer_c with location, ast<Expr>, lattice;
//closed nonterminal Lvar_c with location, ast<Expr>;
terminal In_t 'in' lexer classes {Ckeyword};

/*concrete productions top::LvarInitializer_c
| ')'
  { 
    top.ast = newCall(top.lattice, location=top.location);
  }

concrete productions top::UnaryExpr_c
| 'newLvar' '(' lattice::AssignExpr_c init::LvarInitializer_c
  {
    top.ast = init.ast;
    init.lattice = lattice.ast;
  }

*/

concrete productions top::UnaryOp_c
| 'newLvar' 
  {
    top.ast = newCall(top.expr, location=top.location);
  }

concrete productions top::PrimaryExpr_c
| 'put' '(' value::AssignExpr_c ')' 'in' '(' lvar::AssignExpr_c ')'
  {
    top.ast = putCall(lvar.ast, value.ast, location=top.location);
  }
| 'putD' '(' lvar::AssignExpr_c ',' value::AssignExpr_c ')'
  {
    top.ast = destrPutCall(lvar.ast, value.ast, location=top.location);
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
| 'freeLvar' '(' s::AssignExpr_c ')'
  {
    top.ast = freeLvar(s.ast, location=top.location);
  }
| 'freeLattice' '(' s::AssignExpr_c ')'
  {
    top.ast = freeLattice(s.ast, location=top.location);
  }
| 'freeActSets' '(' s::AssignExpr_c ')'
  {
    top.ast = freeActSets(s.ast, location=top.location);
  }
| 'freeze' '(' s::AssignExpr_c ')'
  {
    top.ast = freeze(s.ast, location=top.location);
  }
| 'checkLeq' '(' lat::AssignExpr_c ',' smallE::AssignExpr_c ',' bigE::AssignExpr_c ')'
  {
    top.ast = checkLeq(lat.ast, smallE.ast, bigE.ast, location=top.location);
  }
| 'checkLub' '(' lat::AssignExpr_c ',' rep1::AssignExpr_c ',' rep2::AssignExpr_c ',' 
                 expLub::AssignExpr_c ',' eqFunc::AssignExpr_c ')'
  {
    top.ast = checkLub(lat.ast, rep1.ast, rep2.ast, expLub.ast, eqFunc.ast, 
                       location=top.location);
  }
| 'checkLattice' '(' lat::AssignExpr_c ',' rep1::AssignExpr_c ',' rep2::AssignExpr_c ',' 
                 expLub::AssignExpr_c ',' eqFunc::AssignExpr_c ')'
  {
    top.ast = checkLattice(lat.ast, rep1.ast, rep2.ast, expLub.ast, eqFunc.ast, 
                       location=top.location);
  }
