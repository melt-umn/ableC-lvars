#include "lvars.xh"
#include "int_pair.xh"

// Example taken from p. 6 of Kuper's FHPC paper

int main(int argc, char **argv) {
  Lattice<IntPair*> * D = lattice_int_pair(); 

  int start = 1;
  int end = 10;
  ThresholdSet<IntPair*>* t = thresholdSet(D, 2);
  for (int i = start; i < end; i++) {
    ActivationSet<IntPair*>* a = activationSet(D, 1)
                                 {Int_Pair(Int_None(), Int_Some(i))}; 
    add(t, a);
  }

  Lvar<IntPair*>* p = newLvar D;
  put (Int_Pair(Int_Some(3), Int_Some(4))) in p;
  ActivationSet<IntPair*>* v1 = get (p) with t;
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
