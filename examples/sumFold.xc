#define DEBUG
#include "lvars.xh"
#include <cilk.xh>

// parallel sum fold operation
// does not use fully valid lvar, since no idempotency from lub operation
// this means that threshold sets don't really work-- you can't create one that
// is non-conflicting unless it has a single element

// set up data type

typedef datatype Int Int;
datatype Int {
  I_Top();
  I(int);
  I_Bot();
};

// set up show method

string showInteger(Int* i) {
  match (i) {
    I_Top() -> {return str("Error!");}
    I(n) -> {return show(n);}
    I_Bot() -> {return str("?");}
  } 
}

// set up isTop() method

int isTopInt(Int* i) {
  match (i) {
    I_Top() -> {return 1;}
    _ -> {return 0;}
  }
}

// set up leq method

int leqInt(Int* i1, Int* i2) {
  match (i1) {
    I_Bot() -> {return 1;}
    I(n1) -> {
      match (i2) {
        I_Bot() -> {return 0;}
        I(n2) -> {return 1;} // since any int can be reached from any other
        I_Top() -> {return 1;} 
      }
    }
    I_Top() -> {
      match(i2) {
        I_Top() -> {return 1;}
        _ -> {return 0;}
      }
    }
  }
}


// set up lub method

Int* lubInt(Int* i1, Int* i2) {
  match (i1) {
    I_Top() -> {return i1;}
    I_Bot() -> {return i2;}
    I(n1) -> {
      match (i2) {
        I_Top() -> {return i2;}
        I_Bot() -> {return i1;}
        I(n2) -> {
          return I(n1 + n2);
        }
      }
    }
  }
}

// uses semi-lvar to sum the integers in arr from index start to index end (inclusive)

cilk int sumToFrom(Lvar<Int*>* l, int* arr, int start, int end) {
  int total = 0;
  for (int i = start; i <= end; i++) {
    total = total + arr[i];
  }
  cilk return put(l, I(total));
}

cilk int sumInChunks(Lvar<Int*>*l, int* arr, int len, int numChunks) {
  int chunkSize = len / numChunks;
  int start = 0;
  int end = chunkSize - 1;
  int result; 
  for (int i = 0; i < numChunks; i++) {
    spawn result = sumToFrom(l, arr, start, end);
    start = end + 1;
    end = start + chunkSize - 1;
    if (end >= len) {
      end = len - 1;
    }
  }
  if (len % numChunks != 0) {
    spawn result = sumToFrom(l, arr, start, end); 
  }
  sync;
  cilk return 1;
}

cilk int main(int argc, char **argv) {

  if (argc < 3) {
    printf("Usage: ./sumFold.out <array size> <number of chunks>\n");
    cilk return 0;
  }

  int size = atoi(argv[1]);  // max is around 65500, or get above limits of int
  int numChunks = atoi(argv[2]);

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

  Lattice<Int*>* D = lattice(I_Bot(), I_Top(), leqInt, lubInt, isTopInt, showInteger);

  Lvar<Int*>* l = newLvar(D);
  int success;
  spawn success = sumInChunks(l, exArr, size, numChunks);
  sync;
  freeze(l);
  printf("result = %s\n", show(l).text);

  // clean up

  free(D);
  free(l);

  cilk return 1;
}
