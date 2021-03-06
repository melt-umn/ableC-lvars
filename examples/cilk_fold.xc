#include "lvars.xh"
#include "cilk.xh"
#include "int.xh"

//Use of LVars for map-fold operation, using Cilk to spawn parallel tasks 

int TASK_SIZE;
int NUM_THREADS;
int N = 1200;

// example map function
int f(int i) {
  return i * i;
}

// example fold function
Value<int>* g(int a, int b) {
  return value (a + b);
}

int leq(int a, int b) {
  return a <= b;
}

Lvar<int>* accum;

cilk int task(int *xs) {
  for (int i = 0; i < TASK_SIZE; ++i) { 
    put (f(xs[i])) in accum;
  }
  cilk return 0;
}

cilk int main (int argc, char **argv) {
  accum = makeLvar_int(leq, g);

  if (argc < 2) {
    exit(0);
  }

  NUM_THREADS = atoi(argv[1]);
  if (N % NUM_THREADS != 0 || NUM_THREADS <= 0) {
    exit(0);
  }
  TASK_SIZE = N / NUM_THREADS;

  int* arr = malloc(N * sizeof(int));
  for (int i = 0; i < N; i++) {
    arr[i] = i + 1;
  }

  int v;
  for (int i = 0; i < NUM_THREADS; ++i) {
    spawn v = task(&arr[i * TASK_SIZE]);
  }
  sync;
  
  freeze accum;
  printf ("Result: %d\n", get accum);
  free(arr);
  Lattice<int>* lat = getLattice accum;
  freeLvar accum;
  free(lat);

  cilk return 1;
}
