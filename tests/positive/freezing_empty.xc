#include "lvars.xh"
#include "single_write_double.xh"
 
int main (int argc, char **argv) {
  Lattice<double>* lat = lattice_single_write_double();
  Lvar<double>* l = newLvar lat;

  freeze l;
  printf("Displaying after freezing before any put: ");
  display l;
  printf("\n"); 

  ThresholdSet<double>* t = thresholdSet(lat, 0);
  ActivationSet<double>* result = get l with t;
  printf("Result of get with empty threshold before any put: ");
  display result;
  printf("\n");

  freeSet(result);

  add(t, activationSet(lat, 1){1.6, 5.6});
  result = get l with t;
  printf("Result of get with non-empty threshold before any put: ");
  display result;
  printf("\n");

  freeActSets t;
  freeSet t;
  freeSet result;
  freeLvar l;
  free(lat);
}
