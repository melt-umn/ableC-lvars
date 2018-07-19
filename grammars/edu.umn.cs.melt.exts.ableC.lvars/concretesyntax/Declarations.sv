grammar edu:umn:cs:melt:exts:ableC:lvars:concretesyntax;
imports edu:umn:cs:melt:exts:ableC:templating:concretesyntax:instantiationTypeExpr;
imports silver:langutil only ast;
imports edu:umn:cs:melt:ableC:abstractsyntax:host;
imports edu:umn:cs:melt:ableC:abstractsyntax:construction;
imports edu:umn:cs:melt:ableC:concretesyntax;
imports edu:umn:cs:melt:exts:ableC:templating:abstractsyntax;

marking terminal Lat_t 'Lattice' lexer classes {Ckeyword};
marking terminal Lv_r 'Lvar' lexer classes {Ckeyword};
marking terminal Thresh_t 'ThresholdSet' lexer classes {Ckeyword};
marking terminal Act_r 'ActivationSet' lexer classes {Ckeyword};

concrete productions top::TypeSpecifier_c
| 'Lattice' '<' params::TypeName_c '>'
  {
  top.realTypeSpecifiers = [latticeTypeExpr(top.givenQualifiers, params.ast)];
  top.preTypeSpecifiers = []; 
  }
| 'Lvar' '<' params::TypeName_c '>'
  {
  top.realTypeSpecifiers = [lvarTypeExpr(top.givenQualifiers, params.ast)];
  top.preTypeSpecifiers = []; 
  }
| 'ActivationSet' '<' params::TypeName_c '>'
  {
  top.realTypeSpecifiers = [actTypeExpr(top.givenQualifiers, params.ast)];
  top.preTypeSpecifiers = []; 
  }
| 'ThresholdSet' '<' params::TypeName_c '>'
  {
  top.realTypeSpecifiers = [threshTypeExpr(top.givenQualifiers, params.ast)];
  top.preTypeSpecifiers = []; 
  }



