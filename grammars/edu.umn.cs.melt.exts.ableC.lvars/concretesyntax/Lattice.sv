grammar edu:umn:cs:melt:exts:ableC:lvars:concretesyntax;

marking terminal Lattice_t 'lattice' lexer classes {Ckeyword};
marking terminal LatticeD_t 'destr_lattice' lexer classes {Ckeyword};
marking terminal MakeLvar_t 'makeLvar' lexer classes {Ckeyword};
marking terminal MakeLvarD_t 'destr_makeLvar' lexer classes {Ckeyword};

concrete productions top::PrimaryExpr_c
| 'lattice' '(' order::AssignExpr_c ',' lub::AssignExpr_c ',' 
                display::AssignExpr_c ',' freeMeth::AssignExpr_c ')'
  {
    top.ast = newLattice(order.ast, lub.ast, display.ast, freeMeth.ast,
              mkIntConst(0, top.location), location=top.location);
  }

| 'lattice' '(' order::AssignExpr_c ',' lub::AssignExpr_c ',' 
                display::AssignExpr_c ')'
  {
    top.ast = newLatticeNoFree(order.ast, lub.ast, display.ast,  
              mkIntConst(0, top.location), location=top.location);
  }
| 'destr_lattice' '(' order::AssignExpr_c ',' lub::AssignExpr_c ',' 
                display::AssignExpr_c ')'
  {
    top.ast = newLatticeNoFree(order.ast, lub.ast, display.ast,  
              mkIntConst(1, top.location), location=top.location);
  }
| 'makeLvar' '(' order::AssignExpr_c ',' lub::AssignExpr_c ',' 
                display::AssignExpr_c ',' freeMeth::AssignExpr_c ')'
  {
    top.ast = makeLvar(order.ast, lub.ast, display.ast, freeMeth.ast,
              mkIntConst(0, top.location), location=top.location);
  }

| 'makeLvar' '(' order::AssignExpr_c ',' lub::AssignExpr_c ')'
  {
    top.ast = makeLvarDefaults(order.ast, lub.ast, 
              mkIntConst(0, top.location), location=top.location);
  }
| 'destr_makeLvar' '(' order::AssignExpr_c ',' lub::AssignExpr_c ',' 
                display::AssignExpr_c ')'
  {
    top.ast = makeLvarNoFree(order.ast, lub.ast, display.ast,
              location=top.location);
  }

| 'destr_makeLvar' '(' order::AssignExpr_c ',' lub::AssignExpr_c ')'
  {
    top.ast = makeLvarDefaults(order.ast, lub.ast, 
              mkIntConst(1, top.location), location=top.location);
  }
