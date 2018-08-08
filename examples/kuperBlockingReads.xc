#include "lvars.xh"

// Example taken from p. 6 of Kuper's FHPC paper

// set up data types

typedef datatype Int Int;
datatype Int {
  I_Top();
  I(int);
  I_Bot();
};

typedef datatype Pair Pair;
datatype Pair {
  Top();
  P(Int*, Int*);
  Bot();
};

// set up show methods

void showInteger(Int* i) {
  match (i) {
    I_Top() -> {printf("Error!");}
    I(n) -> {printf("%d", n);}
    I_Bot() -> {printf("?");}
  } 
}

void showPair(Pair* p) {
  match (p) {
    Top() -> {printf("Error!");}
    P(i1, i2) -> {
      printf("(");
      showInteger(i1);
      printf(", ");
      showInteger(i2);
      printf(")");
    }
    Bot() -> {printf("?");}
  }
}

// set up isTop() methods

int isTopInt(Int* i) {
  match (i) {
    I_Top() -> {return 1;}
    _ -> {return 0;}
  }
}

// set up leq methods

int leqInt(Int* i1, Int* i2) {
  match (i1) {
    I_Bot() -> {return 1;}
    I(n1) -> {
      match (i2) {
        I_Bot() -> {return 0;}
        I(n2) -> {return n1 == n2;}
        I_Top() -> {return 1;} 
      }
    }
    I_Top() -> {
      match(i2) {
        I_Top() -> {return 1;}
        _ -> {return 0;}
      }
    }
  }
}

int leq(Pair* p1, Pair* p2) {
  match (p1) {
    Top() -> {
      match (p2) {
        Top() -> {return 1;}
        _ -> {return 0;}
      }
    }
    P(i1, i2) -> {
      match (p2) {
        Top() -> {return 1;}
        P(i3, i4) -> {
          return leqInt(i1, i3) && leqInt(i2, i4);
        }
        Bot() -> {return 0;}
      }
    }
    Bot() -> {return 1;}
  }
}

// set up lub methods

Int* lubInt(Int* i1, Int* i2) {
  match (i1) {
    I_Top() -> {return i1;}
    I_Bot() -> {return i2;}
    I(n1) -> {
      match (i2) {
        I_Top() -> {return i2;}
        I_Bot() -> {return i1;}
        I(n2) -> {
          if (n1 == n2) {
            return i1;
          }
          return I_Top(); 
        }
      }
    }
  }
}

Pair* lub(Pair* p1, Pair* p2) {
  match (p1) {
    Top() -> {return p1;}
    Bot() -> {return p2;}
    P(i1, i2) -> {
      match (p2) {
        Top() -> {return p2;}
        Bot() -> {return p1;}
        P(i3, i4) -> {
          Int* val1 = lubInt(i1, i3);
          if (isTopInt(val1)) {
            return Top();
          }
          Int* val2 = lubInt(i2, i4);
          if (isTopInt(val2)) {
            return Top();
          }
          return P(val1, val2);
        }
      }
    }
  }
}

int main(int argc, char **argv) {

  // make lattice for our type

  Lattice<Pair*> * D = lattice(Bot(), Top(), leq, lub, showPair);

  // make threshold set of (some) natural number right-hand pair values

  ActivationSet<Pair*>* a1 = activationSet(D){P(I_Bot(), I(1))};
  ActivationSet<Pair*>* a2 = activationSet(D){P(I_Bot(), I(2))};
  ActivationSet<Pair*>* a3 = activationSet(D){P(I_Bot(), I(3))};
  ActivationSet<Pair*>* a4 = activationSet(D){P(I_Bot(), I(4))};
  ActivationSet<Pair*>* a5 = activationSet(D){P(I_Bot(), I(5))};
  ActivationSet<Pair*>* a6 = activationSet(D){P(I_Bot(), I(6))};
  ThresholdSet<Pair*>* t = thresholdSet(D){a1, a2, a3, a4, a5, a6};

  // let p = new in
  //   let _ = put p {(3, 4)} in
  //     let v1 = get p {(?, n) | n in natural numbers} in
  //        ... v1 ...

  Lvar<Pair*>* p = newLvar(D);
  put(p, P(I(3), I(4)));
  ActivationSet<Pair*>* v1 = get(p, t);
  printf("v1 = ");
  show(v1);
  printf("\n");

  // clean up

  free(D);
  freeSet(a1);
  freeSet(a2);
  freeSet(a3);
  freeSet(a4);
  freeSet(a5);
  freeSet(a6);
  freeSet(t);
  free(p);

  return 1;
}
