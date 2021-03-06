#define DEBUG
#include "lvars.xh"

int leq(int* i1, int* i2) {
  return *i1 == *i2;
}

Value<int*>* lub(int* i1, int* i2) {
  int* result = malloc(sizeof(int));
  if (*i1 == *i2) {
    *result = *i1;
    return value result;
  }
  return Top<int*>;
}

void displayInt(int* i) {
  printf("%d", *i);
}

void freeInt(int* i) {
  free(i);
}

int main (int argc, char **argv) {
  Lattice<int*>* lat = lattice(leq, lub, displayInt, freeInt);
  Lvar<int*>* l = newLvar lat;
  int* x = malloc(sizeof(int));
  int* y = malloc(sizeof(int));
  *x = 3;
  *y = 4;
  ThresholdSet<int*>* t = thresholdSet(lat){activationSet(lat)};
  put x in l;
  get l with t;
  return 0;
}
