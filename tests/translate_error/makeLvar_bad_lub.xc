#include "lvars.xh"

int leq_ex(int i1, int i2) {
  return i1 == i2;
}

Value<int>* lub_ex(int i1, int i2) {
  if (i1 == i2) {
    return value i1;
  }
  return Top<int>;
}

void display_ex(double d) {
  printf("%f", d);
}

void free_ex(int d) {
  return;
}

int main (int argc, char **argv) {
  Lvar<int>* l = makeLvar(leq_ex, display_ex);
}
