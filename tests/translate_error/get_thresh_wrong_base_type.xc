#include "lvars.xh"
#include "single_write_int.xh"
#include "single_write_double.xh"

int main (int argc, char **argv) {
  Lattice<int>* lat = lattice_single_write_int();
  Lattice<double>* latD = lattice_single_write_double();
  ActivationSet<double>* a = activationSet(latD){1.1, 2.1, 3.1};
  ThresholdSet<double>* t = thresholdSet(latD){a};
  Lvar<int>* l = newLvar lat;
  get l with t;
}
