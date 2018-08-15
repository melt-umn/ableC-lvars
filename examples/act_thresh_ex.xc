#include "lvars.xh"
#include "int.xh"

int intEq(Int* i1, Int* i2) {
  match (i1) {
    I_Top() -> {
      match (i2) {
        I_Top() -> {return 1;}
        _ -> {return 0;}
      }
    }
    I(n1) -> {
      match (i2) {
        I_Top() -> {return 1;}
        I(n2) -> {return n1 == n2;}
      }
    }
  }
}

Int* intId(Int* i1, Int* i2) {
  match (i1) {
    I_Top() -> {return i1;}
    I(n1) -> {
      match (i2) {
        I_Top() -> {return i2;}
        I(n2) -> {
          if (n1 == n2) {return i1;}
          else {return I_Top();}
        }
      }
    }
  }
}

int main(int argc, char **argv) {
  Lattice<Int*>* lat = lattice(I_Top(), intEq, intId, showInteger);
  ActivationSet<Int*>* a1 = activationSet(lat){I(1), I(2)};
  ActivationSet<Int*>* a2 = activationSet(lat){I(3), I(4)};
  // lub of any element from a1 and any element from a2 
  // must be top/error to preserve determinism
  ThresholdSet<Int*>* t = thresholdSet(lat){a1, a2};
  Lvar<Int*>* l = newLvar lat;
  put (I(2)) in l;
  show(get l with t);
  // displays the activation set {I(1), I(2)}
  // since value of l is at or above I(2)
}
