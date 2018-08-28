grammar edu:umn:cs:melt:exts:ableC:lvars:concretesyntax;
imports edu:umn:cs:melt:exts:ableC:lvars:abstractsyntax;

marking terminal Put_t 'put' lexer classes {Ckeyword};
marking terminal Get_t 'get' lexer classes {Ckeyword};
marking terminal Display_t 'display' lexer classes {Ckeyword};

terminal In_t 'in' lexer classes {Ckeyword};
terminal With_t 'with' lexer classes {Ckeyword};

concrete productions top::UnaryOp_c
| 'put' id::Identifier_t 'in'
  {
    top.ast = putCall(top.expr, declRefExpr(fromId(id), location=top.location),
              location=top.location);
  }
| 'put' '(' value::AssignExpr_c ')' 'in'
  {
    top.ast = putCall(top.expr, value.ast, location=top.location);
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
| 'display'
  {
    top.ast = displayHelper(top.expr, location=top.location);
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
