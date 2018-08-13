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

terminal In_t 'in' lexer classes {Ckeyword};
terminal With_t 'with' lexer classes {Ckeyword};

concrete productions top::UnaryOp_c
| 'newLvar' 
  {
    top.ast = newCall(top.expr, location=top.location);
  }
| 'put' '(' value::AssignExpr_c ')' 'in'
  {
    top.ast = putCall(top.expr, value.ast, location=top.location);
  }
| 'putD' '(' value::AssignExpr_c ')' 'in'
  {
    top.ast = destrPutCall(top.expr, value.ast, location=top.location);
  }
| 'get' '(' lvar::AssignExpr_c ')' 'with'
  {
    top.ast = getCall(lvar.ast, top.expr, location=top.location);
  }
| 'freeze'
  {
    top.ast = freeze(top.expr, location=top.location);
  }
| 'freeSet'
  {
    top.ast = freeSet(top.expr, location=top.location);
  }
| 'freeLvar'
  {
    top.ast = freeLvar(top.expr, location=top.location);
  }
| 'freeLattice'
  {
    top.ast = freeLattice(top.expr, location=top.location);
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
