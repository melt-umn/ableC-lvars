#include "lvars.xh"
#include "single_write_int.xh"

int main (int argc, char **argv) {
  Lattice<int>* lat = lattice_single_write_int();
  ActivationSet<int>* a = activationSet(lat){1};
  freeActSets a;
}
