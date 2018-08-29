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
  Lattice<int*>* lat2 = lattice(leq, lub, displayInt);
  Lvar<int*>* l = newLvar lat;
  Lvar<int*>* l2 = newLvar lat;
  int* x = malloc(sizeof(int));
  int* y = malloc(sizeof(int));
  *x = 3;
  *y = 4;
  ActivationSet<int*>* a = activationSet(lat){x};
  ThresholdSet<int*>* t = thresholdSet(lat){a};
  ActivationSet<int*>* a2 = activationSet(lat2){x};
  ThresholdSet<int*>* t2 = thresholdSet(lat2){a2};
  put x in l;
  put y in l2;
  freeze l; 
  get l2;
  return 0;
}
