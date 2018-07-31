#define CHECK
#include "lvars.xh"
#include <cilk.xh>

// set up bit type

typedef datatype Bit Bit;
datatype Bit {
  None();
  Zero();
  One();
};

int eqBits(Bit* b1, Bit* b2) {
  match (b1) {
    None() -> {
      match (b2) {
        None() -> {return 1;}
        _ -> {return 0;}
      }
    }
    Zero() -> {
      match (b2) {
        Zero() -> {return 1;} 
        _ -> {return 0;}
      }
    }
    One() -> {
      match (b2) {
        One() -> {return 1;}
        _ -> {return 0;}
      }
    }
  }
}

string showBit(Bit* b) {
    match (b) {
    None() -> {
      return str("None()");
    }
    Zero() -> {
      return str("0");
    }
    One() -> {
      return str("1");
    }
  }
}

typedef datatype BitTrie BitTrie;
datatype BitTrie {
  Top();
  Node(Bit*, BitTrie*, BitTrie*);
  Bot();
};

int isTop(BitTrie* b) {
  match (b) {
    Top() -> {return 1;}
    _ -> {return 0;}
  }
}

int leq(BitTrie* b1, BitTrie* b2) {
  match (b1) {
    Top() -> {
      match (b2) {
        Top() -> {return 1;}
        _ -> {return 0;}
      }
    }
    Bot() -> {
      return 1;
    }
    Node(bit1, left1, right1) -> {
      match (b2) {
        Top() -> {return 1;}
        Bot() -> {return 0;} 
        Node(bit2, left2, right2) -> {
          return eqBits(bit1, bit2) && leq(left1, left2) && leq(right1, right1);
        }
      }
    }
  }
}

BitTrie* lub(BitTrie* b1, BitTrie* b2) {
  match (b1) {
    Top() -> {return b1;}
    Bot() -> {return b2;}
    Node(bit1, left1, right1) -> {
      match (b2) {
        Top() -> {return b2;}
        Bot() -> {return b1;} 
        Node(bit2, left2, right2) -> {
          if (eqBits(bit1, bit2)) {
            return Node(bit1, lub(left1, left2), lub(right1, right2));
          } 
          return Top();
        }
      }
    }
  }
}

string showBitTrie(BitTrie* b) {
  match (b) {
    Top() -> {return str("Top()");}
    Bot() -> {return str("");}
    Node(bit, left, right) -> {
      string result = str("[") + showBitTrie(left) + str("] <-") + showBit(bit) +
                      str("-> [") + showBitTrie(right); 
      return result;
    }
  }
}

cilk int main(int argc, char **argv) {
  cilk return 1;
}

