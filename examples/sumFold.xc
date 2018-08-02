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

int main(int argc, char **argv) {

  // make lattice for our type

  Lattice<Int*> * D = lattice(I_Bot(), I_Top(), leqInt, lubInt, isTopInt, showInteger);

  Lvar<Int*>* p = newLvar(D);
  put(p, I(3));
  put(p, I(7));
  freeze(p);
  printf("v1 = %s\n", show(p).text);

  // clean up

  free(D);
  free(p);

  return 1;
}
