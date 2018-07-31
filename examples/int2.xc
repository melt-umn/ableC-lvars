#include "lvars.xh"
#include <cilk.xh>

// Example demonstrating that lvars can be used even without
// fancy user-created data types

// ******************** eq function for our int lattice ***********************

int isTop(int n1) {
  return n1 == 100;
}

// ******************** leq function for our lattice ************************

int leq(int n1, int n2) {
  match (n1) {
    0 -> {return 1;}
    100 -> {return 0;}
    v1 -> {
      match (n2) {
        0 -> {return 0;}
        100 -> {return 1;}
        v2 -> {return v1 == v2;}
      }
    }
  }
  return 0;
}

// ******************** lub function for our lattice **************************

int lub(int n1, int n2) {
  match (n1) {
    100 -> {return 100;}
    0 -> {return n2;}
    other1 -> {
      match (n2) {
        100 -> {return 100;}
        0 -> {return n1;}
        other2 -> {
          if (other1 == other2) {
            return other1;
          }
          else {
            return 100;
          }
        }
      }
    }
  }
  return 100;
}

string showInteger(int n) {
  return show(n);
}

cilk ActivationSet<int>* getCilk(Lvar<int>* x, ThresholdSet<int>* t) {
  cilk return get(x, t);
}

cilk int putCilk(Lvar<int>* x, int v) {
  cilk return put(x, v);
}

cilk int main(int argc, char **argv) {
  Lattice<int> * D = lattice(0, 100, leq, lub, isTop, showInteger);
  Lvar<int>* x = newLvar(D);
  Lvar<int>* y = newLvar(D);
  ThresholdSet<int>* t = thresholdSet(D, 1){activationSet(D, 1){8}};
  ActivationSet<int>* result;
  int putres;
  spawn result = getCilk(x, t);
  //spawn result = getCilk(y, t); // if run with nproc 2, this blocks forever, since there are no
  //spawn putres = putCilk(y, 6); // more threads to handle the put
  spawn putres = putCilk(x, 7);
  spawn putres = putCilk(x, 8);	// if this line is commented out, get blocks forever
  //spawn putres = putCilk(y, 42); 
  sync;
  printf("result: %s\n", show(result).text);
  cilk return 1;
}

