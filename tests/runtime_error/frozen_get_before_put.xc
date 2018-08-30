#include "lvars.xh"
#include "single_write_double.xh"
 
int main (int argc, char **argv) {
  Lattice<double>* lat = lattice_single_write_double();
  Lvar<double>* l1 = newLvar lat;
  freeze l1;
  printf("Getting after freezing before any put: %f\n", get l1);
}
