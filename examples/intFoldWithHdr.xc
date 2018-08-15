#include "lvars.xh"
#include "intFold.xh"
#include "cilk.xh"

#include <time.h>
#   define CLOCK_REALTIME		0
typedef __clockid_t clockid_t;
extern int clock_gettime (clockid_t __clock_id, struct timespec *__tp) __THROW;
long nsdiff(struct timespec *end_time, struct timespec *start_time)
{
    return (end_time->tv_sec - start_time->tv_sec) * 1E9
        + end_time->tv_nsec - start_time->tv_nsec;
}

int fib (int n) {
    if (n < 2) {
        return n;
    } else {
        int result1, result2;
        result1 = fib(n-1);
        result2 =  fib(n-2);
        return result1 + result2;
    }
}

int compute (int v) {
    //printf("compute: %d\n", v);
    int fibres1 = fib(v % 20 + 10);
    int fibres2 = fib(v % 15 + 15);
    int fibres3 = fib(v % 10 + 17);
    return (fibres1 + fibres2 + fibres3)/3;
}

int f(int i) {
  return compute(i);
}

// must be associative

int g(int a, int b) {
  return a + b;
}

// lvar<int> accum = make_lvar(g, leq);
// note that we can't initialize globally, since "initializer element is not constant"

int TASK_SIZE;
int NUM_THREADS;
int N = 12000;
Lattice<Int*>* lat;
Lvar<Int*>* accum;

cilk int task(int *xs) {
  for (int i = 0; i < TASK_SIZE; ++i) { 
    //put f(xs[i]) in accum;
    intFoldPut(accum, xs[i]);
  }
  cilk return 0;
}

cilk int main (int argc, char **argv) {

  if (argc < 2) {
    exit(0);
  }

  NUM_THREADS = atoi(argv[1]);
  if (N % NUM_THREADS != 0) {
    exit(0);
  }
  TASK_SIZE = N / NUM_THREADS;

  lat = intFoldLattice(f, g);
  accum = newLvar(lat);

  int* arr = malloc(N * sizeof(int));
  for (int i = 0; i < N; i++) {
    arr[i] = i + 1;
  }

  // declare, allocate and fill array `arr` with 
  // `NUM_THREADS * TASK_SIZE` values 

  struct timespec start_time;
  clock_gettime(CLOCK_REALTIME, &start_time);

  int v;
  for (int i = 0; i < NUM_THREADS; ++i) {
    spawn v = task (&arr[i * TASK_SIZE]);
  }
  sync;

  struct timespec end_time;
  clock_gettime(CLOCK_REALTIME, &end_time);
  printf("time: %fms\n", nsdiff(&end_time, &start_time) * 1E-6);

  // freeze accum
  freeze(accum);
  //printf("Result: %d\n", get accum);
  printf("Result: ");
  display(accum);
  printf("\n");
  cilk return 1;
}
