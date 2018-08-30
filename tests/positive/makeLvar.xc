#define CHECK
#include "lvars.xh"
#include "int_pair.xh"
#include "cilk.xh"

cilk ActivationSet<IntPair*>* getCilk(Lvar<IntPair*>* l, ThresholdSet<IntPair*>* t) {
  cilk return get l with t;
}

cilk int main (int argc, char **argv) {
  Lvar<IntPair*>* l = makeLvar(leq_int_pair, lub_int_pair);
  Lattice<IntPair*>* lat = getLattice l;
  printf("Before any put: ");
  display l;
  printf("\n");
  
  put (Int_Pair(Int_None(), Int_Some(5))) in l;
  printf("After put of (?, 5), before freezing: ");
  display l;
  printf("\n");

  ActivationSet<IntPair*>* a1 = activationSet(lat, 1){Int_Pair(Int_Some(1), Int_None())};
  printf("a1: ");
  display a1;
  printf("\na2: ");
  ActivationSet<IntPair*>* a2 = activationSet(lat, 1){Int_Pair(Int_Some(2), Int_None())};
  display a2;
  printf("\na3: ");
  ActivationSet<IntPair*>* a3 = activationSet(lat, 1){Int_Pair(Int_Some(2), Int_Some(5))};
  display a3;
  printf("\nt: ");
  ThresholdSet<IntPair*>* t = thresholdSet(lat, 2){a1, a2, a3};
  display t;
  printf("\n");

  ActivationSet<IntPair*>* result;
  spawn result = getCilk(l, t);
  put (Int_Pair(Int_Some(2), Int_None())) in l;
  sync;

  printf("After putting (2, ?) and getting with t: ");
  display result;
  printf("\n");

  freeze l;
  printf("After freezing: ");
  display l;
  printf("\n");
 
  freeLvar l;
  freeActSets t;
  freeSet t;
  freeSet a3;
  free(lat);

  cilk return 1;
}
