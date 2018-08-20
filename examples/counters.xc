#include "lvars.xh"
#include "counter.xh"

int main(int argc, char **argv) {

  Lvar<int>* c = newLvarCounter();
  for (int i = 0; i < 5; i++) {
    inc(c);
  }
  display(getCounter(c, 3));
  printf("\n");
  freeze c;
  display c;
  printf("\n");

  return 1;
}

