grammar edu:umn:cs:melt:exts:ableC:lvars:concretesyntax;

marking terminal New_t 'newLvar' lexer classes {Ckeyword};
marking terminal Put_t 'put' lexer classes {Ckeyword};
marking terminal DestrPut_t 'putD' lexer classes {Ckeyword};
marking terminal Get_t 'get' lexer classes {Ckeyword};
marking terminal Add_t 'add' lexer classes {Ckeyword};
marking terminal FreeSet_t 'freeSet' lexer classes {Ckeyword};
marking terminal FreeLvar_t 'freeLvar' lexer classes {Ckeyword};
marking terminal FreeActSets_t 'freeActSets' lexer classes {Ckeyword};
marking terminal Freeze_t 'freeze' lexer classes {Ckeyword}, precedence = 1;
marking terminal Display_t 'display' lexer classes {Ckeyword};
marking terminal GetLattice_t 'getLattice' lexer classes {Ckeyword};
marking terminal Value_t 'value' lexer classes {Ckeyword};
marking terminal IsTop_t 'isTop' lexer classes {Ckeyword};

terminal In_t 'in' lexer classes {Ckeyword};
terminal With_t 'with' lexer classes {Ckeyword};

concrete productions top::UnaryOp_c
| 'isTop' 
  {
    top.ast = isTop(top.expr, location=top.location);
  }
| 'newLvar' 
  {
    top.ast = newCall(top.expr, location=top.location);
  }
| 'put' id::Identifier_t 'in'
  {
    top.ast = putCall(top.expr, declRefExpr(fromId(id), location=top.location),
              location=top.location);
  }
| 'put' '(' value::AssignExpr_c ')' 'in'
  {
    top.ast = putCall(top.expr, value.ast, location=top.location);
  }
| 'putD' id::Identifier_t 'in'
  {
    top.ast = destrPutCall(top.expr, declRefExpr(fromId(id), location=top.location),
              location=top.location);
  }
| 'putD' '(' value::AssignExpr_c ')' 'in'
  {
    top.ast = destrPutCall(top.expr, value.ast, location=top.location);
  }
| 'get' id::Identifier_t 'with'
  {
    top.ast = getCall(declRefExpr(fromId(id), location=top.location),
              top.expr, location=top.location);
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
| 'getLattice'
  {
    top.ast = getLattice(top.expr, location=top.location);
  }
| 'freeActSets'
  {
    top.ast = freeActSets(top.expr, location=top.location);
  }
| 'display'
  {
    top.ast = showLvars(top.expr, location=top.location);
  }
| 'value'
  {
    top.ast = makeValue(top.expr, location=top.location);
  }

concrete productions top::PrimaryExpr_c
| 'get' '(' lvar::AssignExpr_c ')'
  {
    top.ast = getCallNoThresh(lvar.ast, location=top.location);
  }
| 'get' id::Identifier_t 
  {
    top.ast = getCallNoThresh(declRefExpr(fromId(id), location=top.location),
              location=top.location);
  }
| 'add' '(' set::AssignExpr_c ',' item::AssignExpr_c ')'
  {
    top.ast = add(set.ast, item.ast, location=top.location);
  }
