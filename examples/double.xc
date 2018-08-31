#define DEBUG
#include "lvars.xh"
#include "cilk.xh"
#include "single_write_double.xh"

// Simple example of LVar allowing a single write of a double value

cilk ActivationSet<double>* getCilk(Lvar<double>* l, ThresholdSet<double>* t) {
  cilk return get l with t;
}

cilk int main(int argc, char **argv) {
  Lattice<double>* lat = lattice_single_write_double();

  Lvar<double>* x = newLvar lat;
  Lvar<double>* y = newLvar lat;

  ThresholdSet<double>* t = thresholdSet(lat){activationSet(lat){7.7}, 
                                           activationSet(lat){8.8}};
  ActivationSet<double>* result;

  spawn result = getCilk(x, t);
  put (7.7) in x;
  //put (8.8) in x; (this errors out as an invalid put)
  put (9.9) in y;
  sync;

  printf("Act Set Matched By x: ");
  display result;
  printf("\n");

  freeze y;
  printf("Actual Value of y: %f\n", get y);

  freeLvar x;
  freeLvar y;
  freeActSets t;
  freeSet t;
  free(lat);

  cilk return 1;
}


