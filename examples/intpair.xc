#include "lvars.xh"
#include "int_pair.xh"

// Example taken from p. 6 of Kuper's FHPC paper

int main(int argc, char **argv) {
  Lattice<Pair*> * D = intPairLattice(); 

  int start = 1;
  int end = 10;
  ThresholdSet<Pair*>* t = thresholdSet(D, 2);
  for (int i = start; i < end; i++) {
    ActivationSet<Pair*>* a = activationSet(D, 1){IP(Unknown(), I(i))}; 
    add(t, a);
  }

  Lvar<Pair*>* p = newLvar D;
  put (IP(I(3), I(4))) in p;
  ActivationSet<Pair*>* v1 = get (p) with t;
  printf("v1 = ");
  display(v1);
  printf("\n");

  // clean up

  freeActSets t;
  freeSet t;
  freeLvar p;
  free(D);

  return 1;
}
