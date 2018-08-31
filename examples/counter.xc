#include "lvars.xh"
#include "counter.xh"
#include "cilk.xh"

// Showing how puts and blocking gets interact in the context of an
// integer counter

cilk int checkCounter(Lvar<int>* c) {
  ActivationSet<int>* result = get_counter(c, 10);
  display(result);
  printf("\n");
  freeSet(result);
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
  Lattice<int>* lat = getLattice c;
  freeLvar c;
  free(c);
  cilk return 1;
}
