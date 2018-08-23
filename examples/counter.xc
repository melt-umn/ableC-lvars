#include "lvars.xh"
#include "counter.xh"
#include "cilk.xh"

cilk int checkCounter(Lvar<int>* c) {
  display(get_counter(c, 10));
  printf("\n");
  exit(0);
  cilk return 1;
}

cilk int countLoop(Lvar<int>* c) {
  while (1) {
    inc(c, 1);
  }
  cilk return 1;
}

cilk int main(int argc, char **argv) {
  Lvar<int>* c = make_counter();
  int result1, result2;
  spawn result1 = checkCounter(c);
  spawn result2 = countLoop(c);
  sync;
  cilk return 1;
}
