#include "lvars.xh"
#include "single_write_int.xh"

int main (int argc, char **argv) {
  Lattice<int>* lat = lattice_single_write_int();
  Lvar<int>* l = newLvar lat;
  putD (4.7) in l;
}
