#define CHECK
#include "lvars.xh"
#include <cilk.xh>

// set up bit type

typedef datatype BitTrie BitTrie;
datatype BitTrie {
  Top();
  Node(BitTrie*, BitTrie*);
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
    Node(left1, right1) -> {
      match (b2) {
        Top() -> {return 1;}
        Bot() -> {return 0;} 
        Node(left2, right2) -> {
          return leq(left1, left2) && leq(right1, right1);
        }
      }
    }
  }
}

BitTrie* lub(BitTrie* b1, BitTrie* b2) {
  match (b1) {
    Top() -> {return b1;}
    Bot() -> {return b2;}
    Node(left1, right1) -> {
      match (b2) {
        Top() -> {return b2;}
        Bot() -> {return b1;} 
        Node(left2, right2) -> {
            BitTrie* lub1 = lub(left1, left2);
            if (isTop(lub1)) {
              return Top();
            }
            BitTrie* lub2 = lub(right1, right2);
            if (isTop(lub2)) {
              return Top();
            }
            return Node(lub1, lub2);
        }
      }
    }
  }
}

string showBitTrie(BitTrie* b) {
  match (b) {
    Top() -> {return str("Error");}
    Bot() -> {return str("");}
    Node(left, right) -> {
      match (left) {
        Top() -> {return str("Error");}
        Bot() -> {
           match (right) {
             Top() -> {return str("Error");}
             Bot() -> {return str("");}
             Node(_, _) -> {return str("Node(1, _, ") + showBitTrie(right) + str(")");} 
           }
        }
        Node(_, _) -> {
          match (right) {
             Top() -> {return str("Error");}
             Bot() -> {return str("Node(0, ") + showBitTrie(left) + str(", _)");}
             Node(_, _) -> {return str("Node(1, ") + showBitTrie(left) + str(", ") + showBitTrie(right) + str(")");}
          }
        }
      }
      string result = str("Node(") + showBitTrie(left) + str(",") + showBitTrie(right) + str(")"); 
      return result;
    }
  }
}

//ids are 8 bit numbers
BitTrie* generateBitTrie(int id, int numBits) {
  if (numBits == 0) {
    return Bot();
  }
  if (id >> (numBits - 1)) {
    return Node(Bot(), generateBitTrie(id, numBits - 1));
  }
  else {
    return Node(generateBitTrie(id, numBits - 1), Bot());
  }
}

int insertCustomer(int id, int numBits, Lvar<BitTrie*>* l) {
  return put(l, generateBitTrie(id, numBits));
}

cilk int main(int argc, char **argv) {
  Lattice<BitTrie*>* D = lattice(Bot(), Top(), leq, lub, isTop, showBitTrie);
  Lvar<BitTrie*>* l = newLvar(D);
  for (int i = 0; i < 10; i++) {
    insertCustomer(i, 8, l);
  }
  freeze(l);
  printf("%s\n", show(l).text);
  cilk return 1;
}

