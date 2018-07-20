#include "lvars.xh"
#include <cilk.xh>

// fib lattice example-- won't work if user tries to put in invalid pairs of numbers (i.e., that aren't in the lattice), so might not meet lattice requirements

// data type set-up

typedef  datatype MaybeInt  MaybeInt;
datatype MaybeInt {
  Unknown();
  Int(int);
};

// show function

string showInteger(MaybeInt* i) {
  match (i) {
    Unknown() -> {return str("Unknown()");}
    Int(n) -> {return show(n);}
  }
}

typedef  datatype FibPair FibPair;
datatype FibPair {
  Top();
  Fib(int, MaybeInt*);
  Bot();
};


// eq function

int eqInt(MaybeInt* i1, MaybeInt* i2) {
  match (i1) {
    Unknown() -> {
      match (i2) {
        Unknown() -> {return 1;}
        _ -> {return 0;}
      } 
    }
    Int(n1) -> {
      match (i2) {
        Unknown() -> {return 0;}
        Int(n2) -> {
          return n1 == n2;
        }
      }
    }
  }
}


int eqFib(FibPair* f1, FibPair* f2) {
  match (f1) {
    Top() -> {
      match (f2) {
        Top() -> {return 1;}
        _ -> {return 0;}
      }
    }
    Fib(n1, res1) -> {
      match (f2) {
        Fib(n2, res2) -> {
          return (n1 == n2 && eqInt(res1, res2));
        }
        _ -> {return 0;}
      }
    }
    Bot() -> {
      match (f2) {
        Bot() -> {return 1;}
        _ -> {return 0;}
      }
    }
  }
}


// leq function

int leqFib(FibPair* f1, FibPair* f2) {
  match (f1) {
    Top() -> {
      match (f2) {
        Top() -> {return 1;}
        _ -> {return 0;}
      }
    }
    Fib(n1, res1) -> {
      match (f2) {
        Top() -> {return 1;}
        Bot() -> {return 0;}
        Fib(n2, res2) -> {
          if (n1 <= n2) {
            return 1; 
          }
          return 0;
        }
      }
    }
    Bot() -> {return 1;}
  }
}

// lub function

MaybeInt* addInt(MaybeInt* i1, MaybeInt* i2) {
  printf("in addint: %s + %s\n", showInteger(i1).text, showInteger(i2).text);
  match (i1) {
    Unknown() -> {
      match (i2) {
        Unknown() -> {return Unknown();}
        _ -> {return i2;}
      }
    } 
    Int(n1) -> {
      match (i2) {
        Unknown() -> {return i1;}
        Int(n2) -> {
          return Int(n1 + n2);
        }
      }
    }
  }
}

FibPair* lubFib(FibPair* f1, FibPair* f2) {
  match (f1) {
    Top() -> {return Top();}
    Fib(n1, res1) -> {
      match (f2) {
        Top() -> {return Top();}
        Fib(n2, res2) -> {
          if (n1 == n2) {
            if (res1 == res2) {
              return f1;
            }
            else {
              return Top();
            }
          }
          else if (n1 == n2 - 1) {
            return Fib(n2 + 1, addInt(res1, res2));
          }
          else if (n2 == n1 - 1) {
            return Fib(n1 + 1, addInt(res1, res2));
          }
          else {
            return Top();
          }
        }
        Bot() -> {return f1;}
      }
    }
    Bot() -> {return f2;}
  } 
}

string showFib(FibPair* f) {
  string result;
  match (f) {
    Top() -> {result = str("Top()");}
    Bot() -> {result = str("Bot()");}
    Fib(n, res) -> {result = "The " + show(n) +
                        "th fibonacci number is " + showInteger(res) + "\n";}
  }
  return result;
}

cilk int fib(Lvar<FibPair*>* f, ThresholdSet<FibPair*>* t, int n);
cilk int fib(Lvar<FibPair*>* f, ThresholdSet<FibPair*>* t, int n) {
  //printf("%s %s %d\n", showFib(f->_value).text, show(t).text, n);
  ActivationSet<FibPair*>* result = get(f, t);
  if (result == NULL) {
    if (n < 2) {
      put(f, Fib(n, Int(n)));
      cilk return n;
    }
    int f1, f2;
    spawn f1 = fib(f, t, n - 1);
    spawn f2 = fib(f, t, n - 2);
    sync;
    put(f, Fib(n - 1, Int(f1)));
    put(f, Fib(n - 2, Int(f2)));
    cilk return f1 + f2;
  }
  else {
    FibPair* val = freeze(f);
    match (val) {
      Top() -> {exit(1);}
      Bot() -> {exit(1);}
      Fib(num, value) -> {
        match (value) {
          Unknown() -> {exit(1);} 
          Int(i) -> {cilk return i;} 
        }
      }
    }
  }
}

cilk int main(int argc, char **argv) {
  int n = 10;
  Lattice<FibPair*>* D = lattice(Bot(), Top(), leqFib, lubFib, eqFib, showFib);
  Lvar<FibPair*>* f = newLvar(D);
  ActivationSet<FibPair*>* a = activationSet(D, 1){Fib(n, Unknown())};
  ThresholdSet<FibPair*>* t = thresholdSet(D, 1){a};
  int result;
  spawn result = fib(f, t, n);
  sync;
  printf("Result: %s\n", show(f).text);
  free(D);
  free(f);
  freeSet(a);
  freeSet(t);
  cilk return 1;
}
