#include "lvars.xh"
#include "intPair.xh"

// Example taken from p. 6 of Kuper's FHPC paper

int main(int argc, char **argv) {

  // make lattice for our type

  Lattice<Pair*> * D = intPairLattice(); 
  inst checkLattice<Pair*>(D, IP(I_Bot(), I(3)), IP(I(4), I(3)), IP(I(4), I(3)), eqIntPair);

  // let p = new in
  //   let _ = put p {(3, 4)} in
  //     let v1 = get p {(?, n) | n in natural numbers} in
  //        ... v1 ...

  Lvar<Pair*>* p = newLvar(D);
  put(p, IP(I(3), I(4)));
  ActivationSet<Pair*>* v1 = getSnd(p, 1, 10); // have to specify range
  printf("v1 = ");
  show(v1);
  printf("\n");

  // clean up

  free(D);
  freeLvar(p);

  return 1;
}
