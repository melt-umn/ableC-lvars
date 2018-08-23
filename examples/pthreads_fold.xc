#include "lvars.xh"
#include "int.xh"
#include "quiesce.xh"
#include <pthread.h>

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
Lvar<int>* done;

void* task(void *xs) {
  int* xsInt = (int*) xs;
  for (int i = 0; i < TASK_SIZE; ++i) { 
    put (f(xsInt[i])) in accum;
  }
  done_task(done);
  return NULL;
}

int main (int argc, char **argv) {
  if (argc < 2) {
    printf("Must enter number of threads that evenly divide %d\n", N);
    exit(0);
  }

  NUM_THREADS = atoi(argv[argc - 1]);
  if (N % NUM_THREADS != 0 || NUM_THREADS == 0) {
    exit(0);
  }

  accum = makeLvar_int(leq, g);
  done = make_quiescer();
  TASK_SIZE = N / NUM_THREADS;

  int* arr = malloc(N * sizeof(int));
  for (int i = 0; i < N; i++) {
    arr[i] = i + 1;
  }

  pthread_t* threadArr;
  threadArr = malloc(NUM_THREADS * sizeof(pthread_t));

  for (int i = 0; i < NUM_THREADS; ++i) {
    if (pthread_create(&threadArr[i], NULL, task, (void *) (&arr[i * TASK_SIZE]))) {
      printf("Error creating thread.\n");
      exit(0);
    }
  }

  for (int i = 0; i < NUM_THREADS; i++) {
    pthread_join(threadArr[i], NULL);
  }

  quiesce(done, NUM_THREADS);

  freeze accum;
  printf ("Result: %d\n", get accum);
  free(threadArr);
  free(arr);
  Lattice<int>* lat = getLattice accum;
  freeLvar accum;
  free(lat);

  return 1;
}
