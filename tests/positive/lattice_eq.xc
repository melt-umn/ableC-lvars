#define DEBUG
#include "lvars.xh"

int leq(int i1, int i2) {
  return i1 <= i2;
}

Value<int>* lub(int i1, int i2) {
  if (i1 > i2) {
    return value i1;
  }
  return value i2;
}

void displayInt(int i) {
  printf("%d", i);
}

void freeInt(int i) {
  return;
}

int main (int argc, char **argv) {
  Lattice<int>* lat1 = lattice(leq, lub, displayInt, freeInt);
  Lattice<int>* lat2 = lattice(leq, lub, displayInt, freeInt);
  ActivationSet<int>* a = activationSet(lat1);
  ThresholdSet<int>* t = thresholdSet(lat2){a};
  return 0;
}
