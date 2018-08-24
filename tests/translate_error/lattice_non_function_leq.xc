#include "lvars.xh"

Value<int>* lub_ex(int i1, int i2) {
  if (i1 == i2) {
    return value i1;
  }
  return Top<int>;
}

void display_ex(int i) {
  printf("%d", i);
}

int main (int argc, char **argv) {
  Lattice<int>* lat = lattice(5, lub_ex, display_ex);
}
