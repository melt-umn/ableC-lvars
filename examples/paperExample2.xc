#include "lvars.xh"

// leq function for our lattice
int leqInt(int n1, int n2) {
  if (n1 > 100 || n2 > 100 || n1 < 0 || n2 < 0) {
    exit(0);
  }
  return n1 <= n2;
}
// lub function for our lattice
int lubInt(int n1, int n2) {
  if (n1 > 100 || n2 > 100 || n1 < 0 || n2 < 0) {
    exit(0);
  }
  if (n1 >= n2) {
    return n1;
  }
  return n2;
}
// display function for our lattice
void showInteger(int n) {
  printf("%d", n);
}
int main(int argc, char **argv) {
  // set up lattice
  Lattice<int> * D =
    lattice(0, 100, leqInt, lubInt, showInteger);
  // make lvar and threshold set for lattice
  Lvar<int> *x = newLvar(D);
  ActivationSet<int> * a = activationSet(D){6};
  ThresholdSet<int> * t = thresholdSet(D){a};
  // write, read, and freeze lvar
  put(x, 42);
  ActivationSet<int> * result = get(x, t);
  freeze(x);
  printf("Value of x: ");
  show(x); 
  printf("\n");
  if (result != NULL) {
    printf("Result of get: ");
    show(result);
    printf("\n");
  }
  else {
    printf("Result of get: NULL\n");
  }
  // clean up
  free(D);
  free(x);
  freeSet(a);
  freeSet(t);
  return 1;
}
