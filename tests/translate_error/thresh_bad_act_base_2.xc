#include "lvars.xh"
#include "single_write_int.xh"
#include "single_write_double.xh"

int main (int argc, char **argv) {
  Lattice<int>* lat = lattice_single_write_int();
  Lattice<double>* latD = lattice_single_write_double();
  Lvar<int>* l = newLvar lat;
  ActivationSet<double>* a = activationSet(latD, 2){5.5};
  ThresholdSet<int>* t = thresholdSet(lat, 2);
  add(t, a);
}
