#include "lvars.xh"

// set up data type

typedef datatype Integer Integer;
datatype Integer {
  Top();
  Int(int);
  Bottom();
}

// set up eq function for our lattice

int eqInteger(Integer* n1, Integer* n2) {
  match (n1) {
    Top() -> {
      match (n2) {
        Top() -> {return 1;}
        _ -> {return 0;}
      }
    }
    Int(i1) -> {
      match (n2) {
        Int(i2) -> {return i1 == i2;}
        _ -> {return 0;}
      }
    }
    Bottom() -> {
      match (n2) {
        Bottom() -> {return 1;}
        _ -> {return 0;}
      }
    }
  }
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

// set up show function for our lattice

string showInteger(Integer* n) {
  match (n) {
     Top() -> {return str("Top");}
     Int(i) -> {return show(i);}
     Bottom() -> {return str("Bottom");}
  }
}

int main(int argc, char **argv) {

  // set up lattice
  Lattice<Integer*> * lat = lattice(Bottom(), Top(), leqInteger, lubInteger, eqInteger, showInteger);

  // make lvar and threshold set for lattice
  Lvar<Integer*> * x = newLvar(lat);
  ActivationSet<Integer*> * a = activationSet(lat){Int(10)};
  ThresholdSet<Integer*> * t = thresholdSet(lat){a};

  // try writing, reading, and freezing the lvar
  int success = put(x, Int(13));
  ActivationSet<Integer*> * result = get(x, t);
  freeze(x);

  if (result == NULL) {
    printf("Activation Set Reached: NULL\n");
  }
  else {
    printf("Activation Set Reached: %s\n", show(a).text);
  }
  printf("Actual Value of LVar: %s\n", show(x).text);

  // clean up

  free(lat);
  free(x);
  freeSet(a);
  freeSet(t);
}
  
