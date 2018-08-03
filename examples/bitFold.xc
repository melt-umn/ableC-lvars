#include "lvars.xh"
#include <cilk.xh>
#include "bitarr.xh"

cilk int fib(int n);
cilk int fib(int n) {
  if (n < 2) {
    cilk return n;
  }
  int result1, result2;
  spawn result1 = fib(n-1);
  spawn result2 = fib(n-2);
  sync;
  cilk return result1 + result2;
}

cilk int sumToFrom(Lvar<Bits*>* l, int* arr, int start, int end, int numBits) {
  int total = 0;
  int next1, next2, next3;
  for (int i = start; i <= end; i++) {
    spawn next1 = fib(i % 7);
    spawn next2 = fib(i % 11);
    spawn next3 = fib(i % 23);
    sync;
    putInt(l, next1 + next2 + next3, numBits);
  }
  cilk return 1;
}

cilk int sumInChunks(Lvar<Bits*>*l, int* arr, int len, int numChunks, int numBits) {
  int chunkSize = len / numChunks;
  int start = 0;
  int end = chunkSize - 1;
  int result; 
  for (int i = 0; i < numChunks; i++) {
    spawn result = sumToFrom(l, arr, start, end, numBits);
    start = end + 1;
    end = start + chunkSize - 1;
    if (end >= len) {
      end = len - 1;
    }
  }
  if (len % numChunks != 0) {
    spawn result = sumToFrom(l, arr, start, end, numBits); 
  }
  sync;
  cilk return 1;
}

cilk int main(int argc, char **argv) {

  if (argc < 4) {
    printf("Usage: ./bitarrFold.out <number> <number of bits> <number of chunks>\n");
    cilk return 0;
  }

  int size = atoi(argv[1]);
  int numBits = atoi(argv[2]);
  int numChunks = atoi(argv[3]);

  if (size < numChunks || numChunks < 1) {
    printf("Can't divide array of length %d into %d chunks.\n", size, numChunks);
    cilk return 0;
  }

  // set up example array of integers

  int* exArr = malloc(size * sizeof(int));
  for (int i = 0; i < size; i++) {
    exArr[i] = i + 1;
  }

  // make lattice for our type

  Lattice<Bits*>* D = bitLattice();
  Lvar<Bits*>* l = newLvar(D);

  int success;
  spawn success = sumInChunks(l, exArr, size, numChunks, numBits);
  sync;
  freeze(l);
  printf("result = %s\n", show(l).text);

  // clean up

  free(D);
  free(l);

  cilk return 1;
}
