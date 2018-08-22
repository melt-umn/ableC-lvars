#include "lvars.xh"
typedef datatype Color Color;
datatype Color {
  Red();
  Orange();
  Yellow();
  Green();
  Blue();
  Violet();
  Top();
};

int main(int argc, char **argv) {
  Color* c1 = Red();
  Color* c2 = Blue();
  int x = match (c2) (
    Orange() -> 1;
    _ -> (
      match (c2) (
        Violet() -> 0;
        _ -> 3;
      )
    );
  );
}

/*
matchExpr(
  declRefExpr(name("c2")),
  consExprClause(
    exprClause(
      constructorPattern("Orange", nilPattern()),
        realConstant(integerConstant("1", false, noIntSuffix()))
    ),
    oneExprClause(
      exprClause(
        patternWildcard(),
        parenExpr(
          matchExpr(
            declRefExpr(name("c2")),
            consExprClause(
              exprClause(
                constructorPattern("Violet", nilPattern()),
                realConstant(integerConstant("0", false, noIntSuffix()))
              ),
            oneExprClause(
              exprClause(
                patternWildcard(),
                realConstant(integerConstant("3", false, noIntSuffix()))
              )
            )
          )
        )
      )
    )
  )
)
*/
