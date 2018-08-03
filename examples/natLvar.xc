#define DEBUG
#include "lvars.xh"

// example that is essentially the same as int.xc, but uses a datatype with a
// better top and bottom


// *************************** set up data type *******************************

typedef  datatype Nat  Nat;
datatype Nat {
  Top ();
  Bottom ();
  Int (int);
};

// ************************** leq method for our lattice ********************

int leq(Nat* n1, Nat* n2) {
  int result;
  match (n1) {
    Top() -> {
      match (n2) {
        Top() -> {return 1;} 
        _ -> {return 0;}
      }
    }
    Bottom() -> {result = 1;}
    Int(i1) ->  {
      match (n2) {
        Top() -> {result =  1;}
        Bottom() -> {result = 0;}
        Int(i2) -> {result = i1 == i2;}
      }
    }
  }
  return result;
} 

// ************************ lub method for our lattice ************************

Nat* lub(Nat* n1, Nat* n2) {
  Nat* result;
  match (n1) {
    Top() -> {result = Top();}
    Bottom() -> {result = n2;}
    Int(i1) ->  {
      match (n2) {
        Top() -> {result =  Top();}
        Bottom() -> {result = n1;}
        Int(i2) -> {
          if (i1 == i2) {
            result = n1;
          }
          else {
           result = Top();
          }
        }
      }
    }
  }
  return result;
}

// ********************* display method for our lattice ***********************

string showNat(Nat* n) {
  string result;
  match (n) {
    Top() -> {result = str("Top()");}
    Bottom() -> {result = str("Bottom()");}
    Int(i) -> {result = "Int(" + show(i) + ")";}
  }
  return result;
}

int main(int argc, char **argv) {

  // set up lattice

  Lattice<Nat*> * D = lattice(Bottom(), Top(), leq, lub, showNat);

  // make some lvars 

  Lvar<Nat*> *x = newLvar(D);
  Lvar<Nat*> *y = newLvar(D);

  // try putting in a value

  int success = put(x, Int(7));
  if (!success) {
    free(D);
    return 0;
  }

  // build some activation sets

  ActivationSet<Nat*> * a1 = activationSet(D){Int(7)};
  ActivationSet<Nat*> * a2 = activationSet(D);
  add(a2, Int(8));
  ActivationSet<Nat*> * a3 = activationSet(D, 1);
  ActivationSet<Nat*> * a4 = activationSet(D, 1);
  add(a3, Int(7));

  // make threshold set

  ThresholdSet<Nat*> *t = thresholdSet(D){a1, a2};
  
  // try getting from lvar
  
  ActivationSet<Nat*>*  result = get(x, t);

  if (result == NULL) {
    free(x);
    free(y);
    freeSet(a1);
    freeSet(a2);
    freeSet(a3);
    freeSet(t);
    free(D); 
    return 0;
  }
  else if (result == a1) {;
    printf("7\n");
  }
  else if (result == a2) {
    printf("8\n");
  }
  else if (result == a3) {
    printf("9\n");
  }
  else {
    printf("Error.");
  }

  printf("Threshold Set: %s\n", show(t).text);

  // clean up
  
  free(x);
  free(y);
  freeSet(a1);
  freeSet(a2);
  freeSet(a3);
  freeSet(t);
  free(D); 
  return 1;
}
