#include "lvars.xh"
#include "single_write_int.xh"

int main (int argc, char **argv) {
  Lattice<int>* lat = lattice_single_write_int();
  Lvar<int>* lvar = newLvar lat;
  ActivationSet<int>* a1 = activationSet(lat, 0);
  printf("Empty act set: ");
  display a1;
  printf("\nEmpty thresh set: ");
  ThresholdSet<int>* t = thresholdSet(lat, 0);
  display t;
  printf("\n");

  // Getting with an empty threshold blocks perpetually
  // ActivationSet<int>* result1 = get lvar with t; 
  // put (7) in lvar;
  // This is true whether lvar is empty or not
  // ActivationSet<int>* result1 = get lvar with t; 

  // Likewise, getting with a threshold set that contains only empty act
  // sets also blocks forever
  add(t, a1);
  // ActivationSet<int>* result1 = get lvar with t; 
  // put (7) in lvar;
  // This is true whether lvar is empty or not
  // ActivationSet<int>* result1 = get lvar with t;
  put (7) in lvar;
  add(t, activationSet(lat, 2){1, 7});
  ActivationSet<int>* result1 = get lvar with t;
  printf("Getting with ");
  display t;
  printf(": ");
  display result1;
  printf("\n");

  printf("After freezing: ");
  freeze lvar;
  printf("\nActual value: ");
  display lvar;

  printf("\nGetting with {}: ");
  ThresholdSet<int>* t2 = thresholdSet(lat, 0);
  ActivationSet<int>* result2 = get lvar with t2;
  display result2;
  printf("\n");

  add(t2, a1);
  printf("Getting with ");
  display t2;
  printf(": ");
  ActivationSet<int>* result3 = get lvar with t2;
  display result3;
  printf("\n");

  freeActSets t;
  freeSet result2;
  freeSet result3;
  freeSet t;
  freeSet t2;
  freeLvar lvar;
  free(lat);
}
