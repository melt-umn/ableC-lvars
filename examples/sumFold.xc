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
        I(n2) -> {return n1 <= n2;}
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

cilk int sumToFrom(Lvar<Int*>* l, int* arr, int start, int end);
cilk int sumToFrom(Lvar<Int*>* l, int* arr, int start, int end) {
  int smallLen = end - start + 1;
  if (smallLen == 0) {
    cilk return 0;
  }
  if (smallLen == 1) {
    cilk return put(l, I(arr[start]));
  }
  int splitIndex = smallLen / 2 + start;
  int result1, result2;
  spawn result1 = sumToFrom(l, arr, start, splitIndex - 1);
  spawn result2 = sumToFrom(l, arr, splitIndex, end);
  sync;
  cilk return result1 && result2;
}

cilk int main(int argc, char **argv) {

  int size = 1000;

  // set up example array of integers

  int* exArr = malloc(size * sizeof(int));
  for (int i = 0; i < size; i++) {
    exArr[i] = i + 1;
  }

  // make lattice for our type

  Lattice<Int*>* D = lattice(I_Bot(), I_Top(), leqInt, lubInt, isTopInt, showInteger);

  Lvar<Int*>* l = newLvar(D);
  int success;
  spawn success = sumToFrom(l, exArr, 0, size - 1);
  sync;
  freeze(l);
  printf("result = %s\n", show(l).text);

  // clean up

  free(D);
  free(l);

  cilk return 1;
}
