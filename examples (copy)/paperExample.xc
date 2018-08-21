#include "lvars.xh"

// set up data type

typedef datatype Integer Integer;
datatype Integer {
  Top();
  Int(int);
  Bottom();
}

// set up leq function for our lattice

int leqInteger(Integer* n1, Integer* n2) {
  match (n1) {
    Top() -> {
      match (n2) {
        Top() -> {return 1;}
        _ -> {return 0;}
      }
    }
    Int(i1) -> {
      match (n2) {
        Bottom() -> {return 0;}
        Int(i2) -> {return i1 <= i2;}
        Top() -> {return 1;}
      }
    }
    Bottom() -> {
      return 1;
    }
  }
}

// set up lub function for our lattice

Integer* lubInteger(Integer* n1, Integer* n2) {
  match (n1) {
    Top() -> {
      return n1;
    }
    Int(i1) -> {
      match (n2) {
        Bottom() -> {return n1;}
        Int(i2) -> {
          if (i1 <= i2) {
            return n2;
          }
          return n1;
        }
        Top() -> {return n2;}
      }
    }
    Bottom() -> {
      return n2;
    }
  }
}

// set up display function for our lattice

void displayInteger(Integer* n) {
  match (n) {
     Top() -> {printf("Top");}
     Int(i) -> {printf("%d", i);}
     Bottom() -> {printf("Bottom");}
  }
}

int main(int argc, char **argv) {

  // set up lattice
  Lattice<Integer*> * lat = lattice(Top(), leqInteger, lubInteger, displayInteger);

  // make lvar and threshold set for lattice
  Lvar<Integer*> * x = newLvar(lat);
  ActivationSet<Integer*> * a = activationSet(lat){Int(10)};
  ThresholdSet<Integer*> * t = thresholdSet(lat){a};

  // try writing, reading, and freezing the lvar
  int success = put (Int(13)) in x;
  ActivationSet<Integer*> * result = get (x) with t;
  freeze(x);

  if (result == NULL) {
    printf("Activation Set Reached: NULL\n");
  }
  else {
    printf("Activation Set Reached: ");
    display(a);
    printf("\n");
  }
  printf("Actual Value of LVar: ");
  display(x);
  printf("\n");

  // clean up

  free(lat);
  free(x);
  freeSet(a);
  freeSet(t);
}
  
