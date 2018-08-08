#include "lvars.xh"
#include "int.xh"
#include <cilk.xh>

int f(int i) {
  return i * 3;
}

// must be associative

int g(int a, int b) {
  return a + b;
}

Int* lubInt(Int* i1, Int* i2) {
  match (i1) {
    I_Top() -> {return i1;}
    I_Bot() -> {return i2;}
    I(n1) -> {
      match (i2) {
        I_Top() -> {return i2;}
        I_Bot() -> {return i1;}
        I(n2) -> {return I(g(n1, n2));}
      }
    }
  }
}

// int leq(int a, int b) { return a <= b; }

int leqInt(Int* i1, Int* i2) {
  match (i1) {
    I_Top() -> {
      match (i2) {
        I_Top() -> {return 1;}
        _ -> {return 0;}
      }
    }
    I_Bot() -> {return 1;}
    I(n1) -> {
      match (i2) {
        I_Top() -> {return 1;}
        I_Bot() -> {return 0;}
        I(n2) -> {return n1 <= n2;}
      }
    }
  }
}

/*

lvar<int> accum = make_lvar(g, leq);

cilk int task(int *xs)
{ for (int i = 0; i < TASK_SIZE; ++i) { 
    put f(xs[i]) in accum;
  }
  cilk return 0;
}

*/

cilk int main (int argc, char **argv) {
/*
  // declare, allocate and fill array `arr` with 
  // `NUM_THREADS * TASK_SIZE` values 
  for (int i = 0; i < NUM_THREADS; ++i) {
    spawn v = task (&arr[i * TASK_SIZE])
  }
  sync;
  freeze accum;
  printf ("Result: %d\n", get accum);*/
  cilk return 1;
}
