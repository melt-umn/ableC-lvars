#include "lvars.xh"

int leq_ex(int i1, int i2) {
  return i1 == i2;
}

int lub_ex(int i1, int i2) {
  if (i1 == i2) {
    return i1;
  }
}

void display_ex(int i) {
  printf("%d", i);
}

int main (int argc, char **argv) {
  Lattice<int>* lat = lattice(leq_ex, lub_ex, display_ex);
}
