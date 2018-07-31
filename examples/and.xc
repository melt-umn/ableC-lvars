#define CHECK
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

int isTop(State* s) {
  match (s) {
    Top() -> {return 1;}
    _ -> {return 0;}
  } 
}

//**************** leq function for State ***********************************

int leq(State* s1, State* s2) {
  match (s1) {
    Top() -> {return 0;}
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

string showState(State* s) {
  string result;
  match (s) {
    Top() -> {result = str("Top()");}
    Pair(b1, b2) -> {
      result = str("Pair(");
      match (b1) {
        T() -> {result += "T(), ";}
        F() -> {result += "F(), ";}
        Bot() -> {result += "Bot(), ";}
      }
      match (b2) {
        T() -> {result += "T())";}
        F() -> {result += "F())";}
        Bot() -> {result += "Bot())";}
      }
    }
  }
  return result;
}

int main(int argc, char **argv) {

  //************* Step 1. set up lattice **************************************

  Lattice<State*> * D = lattice(Pair(Bot(), Bot()), Top(), leq,
                                lub, isTop, showState);

  //************* Step 2. create lvar(s) **************************************

  Lvar<State*> *x = newLvar(D);
  Lvar<State*> *y = newLvar(D);

  //************* Step 3. put() value(s) into lvar(s) ***************************

  int success = put(x, Pair(Bot(), T())); //returns 0 if fails, 1 otherwise
  if (!success) {
    printf("Invalid put!\n");
    free(D);
    return 0;
  }

  success = put(x, Pair(T(), Bot()));
  if (!success) {
    printf("Invalid put!\n");
    free(D);
    return 0;
  }

  //************* Step 4. Set up threshold sets *******************************

  // create good threshold set

  ActivationSet<State*> * a1 = activationSet(D)
                                 {Pair(F(), Bot()), Pair(Bot(), F()),
                                  Pair(F(), T()), Pair(T(), F()),
                                  Pair(F(), F())};
  ActivationSet<State*> * a2 = activationSet(D, 1){Pair(T(), T())};
  ThresholdSet<State*> *t = thresholdSet(D){a1, a2};

  printf("The actual threshold set being used: \n%s\n", show(t).text);

  // create bad threshold set-- elements from different activation sets are
  // compatible with each other, so will reject second activation set

  ActivationSet<State*> * a3 = activationSet(D, 2)
                                 {Pair(F(), Bot()), Pair(Bot(), F())};
  ActivationSet<State*> * a4 = activationSet(D)
                                 {Pair(T(), Bot()), Pair(Bot(), T())};
  ThresholdSet<State*> *tBad = thresholdSet(D, 2){a3, a4, a1};

  printf("After trying invalid addition to threshold: \n%s\n", show(tBad).text);

  //************ Step 5. Try get()-ing the values of lvars ********************
  
  ActivationSet<State*>*  result = get(x, t); // return NULL if fails,
                   // otherwise the matched activation set in the threshold set

  printf("The value of x after putting (T(), Bot()) and (Bot(), T()) is ");
  if (result == NULL) {
    printf("Invalid get operation.\n");
    free(x);
    free(y);
    freeSet(a1);
    freeSet(a2);
    freeSet(a3);
    freeSet(a4);
    freeSet(t);
    freeSet(tBad);
    free(D);
    return 0;
  }
  else if (result == a1) { // if any of the members of the "false" set matched
    printf("False\n");
  }
  else if (result == a2) { // if any of the members of the "true" set matched
    printf("True\n");
  }
  else {
    printf("Error! Something went gruesomely wrong.");
  }

  //************* Step 6. Clean up ********************************************

  free(x);
  free(y);
  freeSet(a1);
  freeSet(a2);
  freeSet(a3);
  freeSet(a4);
  freeSet(t);
  freeSet(tBad);
  free(D);
  
  return 1;
}
