grammar edu:umn:cs:melt:exts:ableC:lvars:concretesyntax;

marking terminal New_t 'newLvar' lexer classes {Ckeyword};
marking terminal Freeze_t 'freeze' lexer classes {Ckeyword}, precedence = 1;
marking terminal FreeLvar_t 'freeLvar' lexer classes {Ckeyword};
marking terminal GetLattice_t 'getLattice' lexer classes {Ckeyword};

concrete productions top::UnaryOp_c
| 'newLvar' 
  {
    top.ast = newCall(top.expr, location=top.location);
  }
| 'freeze'
  {
    top.ast = freeze(top.expr, location=top.location);
  }
| 'freeLvar'
  {
    top.ast = freeLvar(top.expr, location=top.location);
  }
| 'getLattice'
  {
    top.ast = getLattice(top.expr, location=top.location);
  }
