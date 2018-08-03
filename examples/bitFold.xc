#include "bitarr.xh"

int main(int argc, char **argv) {
  Lattice<Bits*>* D = bitLattice();
  Lvar<Bits*>* x = newLvar(D);
  putInt(x, 27, 16);
  freeze(x);
  printf("%s\n", show(x).text); 
  return 1;
}
