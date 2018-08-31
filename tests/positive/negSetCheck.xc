#define CHECK
#include "lvars.xh"
#include "single_write_int.xh"

int main (int argc, char **argv) {
  Lattice<int>* lat = lattice_single_write_int();
  Lvar<int>* l = newLvar lat;
  ActivationSet<int>* a1 = activationSet(lat, -42){4};
  ActivationSet<int>* a2 = activationSet(lat, -4){5};
  ThresholdSet<int>* t = thresholdSet(lat, -3){a1, a2};
  put (5) in l;
  display (get l with t);
  printf("\n");
  freeSet a1;
  freeSet a2;
  freeSet t;
  freeLvar l;
  free(lat);
}
