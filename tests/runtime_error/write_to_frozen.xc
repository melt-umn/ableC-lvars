#define DEBUG
#include "lvars.xh"

int leq(int* i1, int* i2) {
  return *i1 <= *i2;
}

Value<int*>* lub(int* i1, int* i2) {
  int* result = malloc(sizeof(int));
  if (*i1 > *i2) {
    *result = *i1;
    return value result;
  }
  *result = *i2;
  return value result;
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
  ActivationSet<int*>* a1 = activationSet(lat){x};
  ActivationSet<int*>* a2 = activationSet(lat){y};
  put x in l;
  freeze l;
  put y in l;
  return 0;
}
