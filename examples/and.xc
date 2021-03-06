#define DEBUG
#include "lvars.xh"
#include "cilk.xh"

// Example demonstrating the use of lvars for Boolean "and" operation

// Note that user is responsible for providing appropriate type, leq,
// lub, and display functions based on their needs

// Based on example in Kuper Dissertation Section 2.6.2

//*********************** setting up data types *******************************

typedef  datatype Bl  Bl;
datatype Bl {
  T ();
  F ();
  Bot ();
};

allocate datatype Bl with malloc;

typedef  datatype State  State;
datatype State {
  Pair (Bl*, Bl*);
};

allocate datatype State with malloc;

//********************* leq function ******************************************

int leqBl(Bl* b1, Bl* b2) {
  match (*b1) {
    Bot() -> {return 1;}
    T() -> {
      match (*b2) {
        T() -> {return 1;}
        _ -> {return 0;}
      }
    }
    F() -> {
      match (*b2) {
        F() -> {return 1;}
        _ -> {return 0;}
      }
    }
  }
}

int leqAnd(State* s1, State* s2) {
  match (*s2) {
    Pair(b21, b22) -> {
      match (*s1) {
        Pair(b11, b12) -> { return leqBl(b11, b21) && leqBl(b12, b22);}
      }
    }
  }
} 

//**************************** lub function ***********************************

Bl* copy(Bl* b) {
  match (*b) {
    Bot() -> {return malloc_Bot();}
    T() -> {return malloc_T();}
    F() -> {return malloc_F();}
  }
}

Value<State*>* lub(State* s1, State* s2) {
  match (*s1) {
    Pair(b11, b12) -> {
      match (*s2) {
        Pair(b21, b22) -> {
          Bl* bool1;
          Bl* bool2;
          if (leqBl(b11, b21)) {
            bool1 = copy(b21);
          }
          else if (leqBl(b21, b11)) {
            bool1 = copy(b11);
          }
          else {
            return Top<State*>;
          }

          if (leqBl(b12, b22)) {
            bool2 = copy(b22);
          }
          else if (leqBl(b22, b12)) {
            bool2 = copy(b12);
          }
          else {
            free(bool1);
            return Top<State*>;
          }

          return value malloc_Pair(bool1, bool2);
        }
      }
    }
  }
}

//**************************** display function *******************************

void displayBl(Bl* b) {
  match (*b) {
    Bot() -> {printf("?");}
    T() -> {printf("T");}
    F() -> {printf("F");}
  }
}

void displayState(State* s) {
  match (*s) {
    Pair(b1, b2) -> {
      printf("(");
      displayBl(b1);
      printf(", ");
      displayBl(b2);
      printf(")");
    }
  }
}

//*************************** free function ***********************************

void freeState(State* s) {
  match (*s) {
    Pair(b1, b2) -> {
      free(b1);
      free(b2);
      free(s);
    }
  }
}

cilk ActivationSet<State*>* getCilk(Lvar<State*>* l, ThresholdSet<State*>* t) {
  cilk return (get l with t);
}

cilk int main(int argc, char **argv) {

  Lattice<State*>* lat = lattice(leqAnd, lub, displayState, freeState);

  Lvar<State*>* l1 = newLvar lat;
  Lvar<State*>* l2 = makeLvar(leqAnd, lub, displayState, freeState);

  put (malloc_Pair(malloc_Bot(), malloc_T())) in l1;
  put (malloc_Pair(malloc_Bot(), malloc_T())) in l1;
  put (malloc_Pair(malloc_T(), malloc_Bot())) in l1;
  
  ActivationSet<State*>* trueAct = activationSet(lat){malloc_Pair(malloc_T(), malloc_T())};
  ActivationSet<State*>* falseAct = activationSet(lat){
                                      malloc_Pair(malloc_F(), malloc_Bot()), malloc_Pair(malloc_Bot(), malloc_F()),
                                      malloc_Pair(malloc_F(), malloc_T()), malloc_Pair(malloc_T(), malloc_F()), 
                                      malloc_Pair(malloc_F(), malloc_F())
                                    };
  ThresholdSet<State*>* t = thresholdSet(lat){trueAct, falseAct};

  printf("After putting (?, T), (?, T), and (T, ?):\n  Act Set Matched: ");
  display(get l1 with t);
  printf("\n");

  ActivationSet<State*>* result;
  spawn result = getCilk(l2, t);

  put (malloc_Pair(malloc_F(), malloc_Bot())) in l2;
  sync;

  printf("After putting (F, ?):\n  Act Set Matched: ");
  display(result);
  printf("\n");

  // clean-up

  freeLvar l1;
  Lattice<State*>* lat2 = getLattice l2;
  freeLvar l2;
  freeActSets t;
  freeSet t;
  free(lat);
  free(lat2);

  cilk return 1;
}


