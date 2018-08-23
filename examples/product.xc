#include "lvars.xh"
#include "product_int.xh"
#include <cilk.xh>

Lvar<int>* accum;
int TASK_SIZE;
int NUM_THREADS;
int N = 15;

cilk int task(int *xs) {
  for (int i = 0; i < TASK_SIZE; ++i) { 
    put (xs[i]) in accum;
  }
  cilk return 0;
}

cilk int main (int argc, char **argv) {
  if (argc < 2) {
    printf("Must enter number of threads that evenly divide %d\n", N);
    cilk return 0;
  }

  NUM_THREADS = atoi(argv[1]);
  if (N % NUM_THREADS != 0) {
    cilk return 0;
  }

  accum = makeLvar_product_int();
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
