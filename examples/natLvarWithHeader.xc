#define DEBUG
#include "lvars.xh"
#include "natural.xh"

// example that is essentially the same as int.xc, but uses a datatype with a
// better top and bottom

int main(int argc, char **argv) {

  // set up lattice

  Lattice<Nat*> * D = natLattice();

  // make some lvars 

  Lvar<Nat*> *x = newLvar(D);
  Lvar<Nat*> *y = newLvar(D);

  // try putting in a value

  int success = put Int(7) in (x);
  if (!success) {
    free(D);
    return 0;
  }

  // build some activation sets

  ActivationSet<Nat*> * a1 = activationSet(D){Int(7)};
  ActivationSet<Nat*> * a2 = activationSet(D);
  add(a2, Int(8));
  ActivationSet<Nat*> * a3 = activationSet(D, 1);
  ActivationSet<Nat*> * a4 = activationSet(D, 1);
  add(a3, Int(7));

  // make threshold set

  ThresholdSet<Nat*> *t = thresholdSet(D){a1, a2};
  
  // try getting from lvar
  
  ActivationSet<Nat*>*  result = get(x, t);

  if (result == NULL) {
    free(x);
    free(y);
    freeSet(a1);
    freeSet(a2);
    freeSet(a3);
    freeSet(t);
    free(D); 
    return 0;
  }
  else if (result == a1) {;
    printf("7\n");
  }
  else if (result == a2) {
    printf("8\n");
  }
  else if (result == a3) {
    printf("9\n");
  }
  else {
    printf("Error.");
  }

  printf("Threshold set: ");
  show(t);

  // clean up
  
  free(x);
  free(y);
  freeSet(a1);
  freeSet(a2);
  freeSet(a3);
  freeSet(t);
  free(D); 
  return 1;
}
