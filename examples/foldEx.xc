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

// lvar<int> accum = make_lvar(g, leq);
// note that we can't initialize globally, since "initializer element is not constant"

int TASK_SIZE = 4;
int NUM_THREADS = 1;
int N = 4;
Lattice<Int*>* lat;
Lvar<Int*>* accum;

cilk int task(int *xs) {
  for (int i = 0; i < TASK_SIZE; ++i) { 
    //put f(xs[i]) in accum;
    put (I(f(xs[i]))) in accum;
  }
  cilk return 0;
}

cilk int main (int argc, char **argv) {
  lat = lattice(I_Top(), leqInt, lubInt, showInteger, freeInteger);
  accum = newLvar(lat);

  int* arr = malloc(N * sizeof(int));
  for (int i = 0; i < N; i++) {
    arr[i] = i + 1;
  }

  // declare, allocate and fill array `arr` with 
  // `NUM_THREADS * TASK_SIZE` values 

  int v;
  for (int i = 0; i < NUM_THREADS; ++i) {
    spawn v = task (&arr[i * TASK_SIZE]);
  }
  sync;
  // freeze accum
  freeze(accum);
  //printf("Result: %d\n", get accum);
  printf("Result: ");
  show(accum);
  printf("\n");
  cilk return 1;
}
