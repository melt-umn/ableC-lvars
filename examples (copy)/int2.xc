#define CHECK
#include "lvars.xh"
#include <cilk.xh>

// Example demonstrating that lvars can be used even without
// fancy user-created data types

// ******************** leq function for our lattice ************************

int leq(int n1, int n2) {
  match (n1) {
    100 -> {
      match (n2) {
        100 -> {return 1;}
        _ -> {return 0;}
      }
    }
    v1 -> {
      match (n2) {
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
    other1 -> {
      match (n2) {
        100 -> {return 100;}
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

void displayInteger(int n) {
  printf("%d", n);
}

cilk ActivationSet<int>* getCilk(Lvar<int>* x, ThresholdSet<int>* t) {
  cilk return get (x) with t;
}

cilk int putCilk(Lvar<int>* x, int v) {
  cilk return put (v) in x;
}

cilk int main(int argc, char **argv) {
  Lattice<int> * D = lattice(100, leq, lub, displayInteger);
  Lvar<int>* x = newLvar(D);
  Lvar<int>* y = newLvar(D);
  ThresholdSet<int>* t = thresholdSet(D, 1){activationSet(D,1){7}, activationSet(D, 1){8}};
  ActivationSet<int>* result;
  int putres;
  spawn result = getCilk(x, t);
  //spawn result = getCilk(y, t); // if run with nproc 2, this blocks forever, since there are no
  //spawn putres = putCilk(y, 6); // more threads to handle the put
  spawn putres = putCilk(x, 7);
  spawn putres = putCilk(x, 8);	// if this line is commented out, get blocks forever
  //spawn putres = putCilk(y, 42); 
  sync;
  printf("result: ");
  display(result);
  printf("\n");
  cilk return 1;
}

