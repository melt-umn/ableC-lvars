#include "lvars.xh"
#include "intPair.xh"

// Example taken from p. 6 of Kuper's FHPC paper

int main(int argc, char **argv) {

  // make lattice for our type

  Lattice<Pair*> * D = intPairLattice(); 
  Pair* testP1 = IP(I_Bot(), I(3));
  Pair* testP2 = IP(I(4), I(3));
  checkLattice(D, testP1, testP2, testP2, eqIntPair);
  free_intPair(testP1);
  free_intPair(testP2);

  // let p = new in
  //   let _ = put p {(3, 4)} in
  //     let v1 = get p {(?, n) | n in natural numbers} in
  //        ... v1 ...

  int start = 1;
  int end = 10;
  ThresholdSet<Pair*>* t = thresholdSet(D, 2);
  for (int i = start; i < end; i++) {
    ActivationSet<Pair*>* a = activationSet(D, 1){IP(I_Bot(), I(i))}; 
    add(t, a);
  }

  Lvar<Pair*>* p = newLvar(D);
  put (IP(I(3), I(4))) in p;
  ActivationSet<Pair*>* v1 = get (p) with t; // have to specify range
  printf("v1 = ");
  display(v1);
  printf("\n");

  // clean up

  freeActSets t;
  freeSet t;
  freeLvar p;
  freeLattice D;

  return 1;
}

/*

LvarCounter* c = newLvarCounter();
for (int i = 0; i < 5; i++) {
  inc c;
}
put (3) in c; // errors out, can't put in lvar counter
get c with {{3}} // this works

sync;
freeze c;
display c;

*/