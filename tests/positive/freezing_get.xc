#include "lvars.xh"
#include "single_write_int.xh"

int main (int argc, char **argv) {
  Lattice<int>* lat = lattice_single_write_int();
  Lvar<int>* l = newLvar lat;

  put (42) in l;
  freeze l;
  printf("Result after freezing: ");
  display l;
  printf("\n");

  freeze l;
  printf("Result after freezing again: ");
  display l;
  printf("\n"); 

  printf("Result after getting with no thresh: %d\n", get l);

  ActivationSet<int>* a1 = activationSet(lat, 1){1};
  ActivationSet<int>* a2 = activationSet(lat, 1){2};
  ThresholdSet<int>* t = thresholdSet(lat, 1){a1, a2};

  ActivationSet<int>* result1 = get l with t;
  printf("Result after getting with thresh with no match: ");
  display result1;
  printf("\n");

  add(t, activationSet(lat, 1){21, 42, 84});
  ActivationSet<int>* result2 = get l with t;
  printf("Result after getting with thresh with a match: ");
  display result2;
  printf("\n");

  freeActSets t;
  freeSet result1;
  freeSet t;
  freeLvar l;
  free(lat);
}
