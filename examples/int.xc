#include "lvars.xh"
#include "cilk.xh"
#include "single_write_int.xh"

// Simple example of an LVar allowing a single write of an integer value

cilk ActivationSet<int>* getCilk(Lvar<int>* l, ThresholdSet<int>* t) {
  cilk return get l with t;
}

cilk int main(int argc, char **argv) {
  Lattice<int>* lat = lattice_single_write_int();

  Lvar<int>* x = newLvar lat;
  Lvar<int>* y = newLvar lat;

  ThresholdSet<int>* t = thresholdSet(lat){activationSet(lat){7}, 
                                           activationSet(lat){8}};
  ActivationSet<int>* result;

  spawn result = getCilk(x, t);
  put (7) in x;
  //put (8) in x; (this errors out as an invalid put)
  put (9) in y;
  sync;

  printf("Act Set Matched By x: ");
  display result;
  printf("\n");

  freeze y;
  printf("Actual Value of y: %d\n", get y);

  freeLvar x;
  freeLvar y;
  freeActSets t;
  freeSet t;
  free(lat);

  cilk return 1;
}


