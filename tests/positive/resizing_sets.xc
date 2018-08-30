#include "lvars.xh"
#include "max_int.xh"

int main (int argc, char **argv) {
  Lattice<int>* lat = lattice_max_int();

  ActivationSet<int>* a1 = activationSet(lat, 0);
  add(a1, 1);
  add(a1, 2);
  printf("Expected: {1, 2}. Actual: ");
  display a1;
  printf("\n");

  ActivationSet<int>* a2 = activationSet(lat, 0){1, 2};
  printf("Expected: {1, 2}. Actual: ");
  display a2;
  printf("\n");

  ActivationSet<int>* a3 = activationSet(lat);
  for (int i = 0; i < 40; i++) {
    add(a3, i); 
  }
  printf("Expected: {0, 1, 2, 3, ... , 38, 39}\nActual: ");
  display a3;
  printf("\n");

  ThresholdSet<int>* t1 = thresholdSet(lat, 0);
  add(t1, a1);
  add(t1, a2);
  printf("Expected: {{1, 2}, {1, 2}}. Actual: ");
  display t1;
  printf("\n");

  ThresholdSet<int>* t2 = thresholdSet(lat, 0){a1, a2};
  printf("Expected: {{1, 2}, {1, 2}}. Actual: ");
  display t2;
  printf("\n");

  ThresholdSet<int>* t3 = thresholdSet(lat);
  for (int i = 0; i < 40; i++) {
    add(t3, activationSet(lat, 1){i}); 
  }
  printf("Expected: {{0}, {1}, {2}, {3}, ... , {38}, {39}}\nActual: ");
  display t3;
  printf("\n");

  freeSet a1;
  freeSet a2;
  freeSet a3;
  freeSet t1;
  freeSet t2;
  freeActSets t3;
  freeSet t3;
  free(lat);
}
