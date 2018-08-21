#include "lvars.xh"
#include "sum_pos_int.xh"
#include <cilk.xh>

Lvar<int>* accum;
int TASK_SIZE;
int NUM_THREADS;
int N = 24000;

cilk int task(int *xs) {
  for (int i = 0; i < TASK_SIZE; ++i) { 
    put (xs[i]) in accum;
  }
  cilk return 0;
}

cilk int main (int argc, char **argv) {
  accum = make_lvar_sum_pos_int();

  if (argc < 2) {
    printf("Must enter number of threads that evenly divide %d\n", N);
    exit(0);
  }

  NUM_THREADS = atoi(argv[1]);
  if (N % NUM_THREADS != 0) {
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
  free(getLattice(accum));
  free(accum);

  cilk return 1;
}
