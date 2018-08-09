#include "lvars.xh"
#include "intPair.xh"

// Example taken from p. 6 of Kuper's FHPC paper

int main(int argc, char **argv) {

  // make lattice for our type

  Lattice<Pair*> * D = intPairLattice(); 
  Pair* testP1 = IP(I_Bot(), I(3));
  Pair* testP2 = IP(I(4), I(3));
  inst checkLattice<Pair*>(D, testP1, testP2, testP2, eqIntPair);
  free_intPair(testP1);
  free_intPair(testP2);

  // let p = new in
  //   let _ = put p {(3, 4)} in
  //     let v1 = get p {(?, n) | n in natural numbers} in
  //        ... v1 ...

  int start = 1;
  int end = 10;
  ThresholdSet<Pair*>* t = thresholdSet(D, end - start + 1);
  for (int i = start; i < end; i++) {
    ActivationSet<Pair*>* a = activationSet(D, 1){IP(I_Bot(), I(i))}; 
    add(t, a);
  }

  Lvar<Pair*>* p = newLvar(D);
  put(p, IP(I(3), I(4)));
  ActivationSet<Pair*>* v1 = get(p, t); // have to specify range
  printf("v1 = ");
  show(v1);
  printf("\n");

  // clean up

  inst freeActSets<Pair*>(t);
  freeSet(t);
  freeLvar(p);
  inst freeLattice<Pair*>(D);

  return 1;
}
