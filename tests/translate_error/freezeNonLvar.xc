#include "lvars.xh"

// Example demonstrating the use of lvars for Boolean "and" operation
// Note that user is responsible for providing appropriate type, eq, leq,
// lub, and display functions based on their needs

// Based on example in Kuper Section 2.6.2

//*********************** setting up data types *******************************

typedef  datatype Bl  Bl;
datatype Bl {
  T ();
  F ();
  Bot ();
};

typedef  datatype State  State;
datatype State {
  Top ();
  Pair (Bl*, Bl*);
};

//*************** eq function for our types ***********************************

int eqBool(Bl* b1, Bl* b2) {
  match (b1) {
    T() -> {
      match (b2) {
        T() -> {return 1;}
        other -> {return 0;}
      }
    }
    F() -> {
      match (b2) {
        F() -> {return 1;}
        other -> {return 0;}
      }
    }
    Bot() -> {
      match (b2) {
        Bot() -> {return 1;}
        other -> {return 0;}
      }
    }
  }
}

//**************** leq function for State ***********************************

int leq(State* s1, State* s2) {
  match (s1) {
    Top() -> {
      match (s2) {
        Top() -> {return 1;}
        _ -> {return 0;}
      }
    }
    Pair(Bot(), Bot()) -> {return 1;}
    Pair(b1, Bot()) -> { 
      match (s2) {
        Pair(b2, other) -> {return eqBool(b1, b2);}
        Top() -> {return 1;}			
      }
    }
    Pair(Bot(), b1) -> { 
      match (s2) {
        Pair(other, b2) -> {return eqBool(b1, b2);}
        Top() -> {return 1;}
      }
    }
    Pair(b1, b2) -> {
      match (s2) {
        Top() -> {return 1;}
        Pair(other1, other2) -> {
          return eqBool(b1, other1) && eqBool(b2, other2);
        }
      }
    }
  }
  return 0;
}

//*********************** lub function for State ******************************

State* lub (State* s1, State* s2) {
  match (s1) {
    Top() -> {return Top();}
    Pair(Bot(), Bot()) -> {return s2;}
    Pair(x1, y1) ->  {
      match (s2) {
        Top() -> {return Top();}
        Pair(Bot(), Bot()) -> {return s1;}
        Pair(x2, y2) -> {
          Bl* x;
          Bl* y;
          match (x1) {
            Bot() -> {x = x2;}
            other1 -> {
              match (x2) {
                Bot() -> {x = x1;}
                other2 -> {
                  if (eqBool(x1, x2)) { 
                    x = x1;
                  }
                  else {
                    return Top();
                  }
                }
              }
            } 
          }
          match (y1) {
            Bot() -> {y = y2;}
            other1 -> {
              match (y2) {
                Bot() -> {y = y1;}
                other2 -> {
                  if (eqBool(y1, y2)) {
                    y = y1;
                  }
                  else {
                    return Top();
                  }
                }
              }
            } 
          }
          return Pair(x, y);
        }
      }
    }
  }
  return NULL;
}

//************** display function for State ***********************************

void showState(State* s) {
  match (s) {
    Top() -> {printf("Top()");}
    Pair(b1, b2) -> {
      printf("Pair(");
      match (b1) {
        T() -> {printf("T(), ");}
        F() -> {printf("F(), ");}
        Bot() -> {printf("Bot(), ");}
      }
      match (b2) {
        T() -> {printf("T())");}
        F() -> {printf("F())");}
        Bot() -> {printf("Bot())");}
      }
    }
  }
}

int main (int argc, char **argv) {

  Lattice<State*>* l = lattice(Pair(Bot(), Bot()), Top(), leq,
                              lub, showState);

  freeze(l);
  return 0;
}
