#define CHECK
#include "lvars.xh"
#include <cilk.xh>

typedef datatype Trie Trie;
datatype Trie {
  Top();
  Empty();
  Leaf(int);
  Node(Trie*, Trie*);
}

int isTop(Trie* t) {
  match (t) {
    Top() -> {return 1;}
    _ -> {return 0;}
  }
}

int leq(Trie* t1, Trie* t2) {
  match (t1) {
    Top() -> {
      match (t2) {
        Top() -> {return 1;}
        _ -> {return 0;}
      }
    }
    Empty() -> {
      return 1;
    }
    Leaf(n1) -> {
      match (t2) {
        Empty() -> {return 0;}
        Leaf(n2) -> {return n1 == n2;}
      } 
    }
    Node(left1, right1) -> {
      match (t2) {
        Top() -> {return 1;}
        Empty()-> {return 0;}
        Leaf(n) -> {return 0;}
        Node(left2, right2) -> {
          return leq(left1, left2) && leq(right1, right2);
        }
      }
    }
  }
}

Trie* lub(Trie* t1, Trie* t2) {
  match (t1) {
    Top() -> {return t1;}
    Empty() -> {return t2;}
    Leaf(n1) -> {
      match (t2) {
        Top() -> {return t2;}
        Empty() -> {return t1;}
        Leaf(n2) -> {
          if (n1 == n2) {
            return t1;
          }
          return Top();
        }
        Node(left, right) -> {
          return Top();
        }
      } 
    }
    Node(left1, right1) -> {
      match (t2) {
        Top() -> {return t2;}
        Empty()-> {return t1;}
        Leaf(n) -> {return Top();}
        Node(left2, right2) -> {
          return Node(lub(left1, left2), lub(right1, right2));
        }
      }
    }
  } 
}

string showTrie(Trie* t) {
  match (t) {
    Top() -> {return str("Top()");}
    Empty() -> {return str("Empty()");}
    Leaf(n) -> {return str("Leaf(") + show(n) + str(")");}
    Node(left, right) -> {
      return str("Node(") + showTrie(left) + str(", ") + showTrie(right) + str(")");
    }
  }
}

string getNumber(Trie* path) {
  match (path) {
    Empty() -> {return str("");}
    Leaf(n) -> {return str("");}
    Node(left, right) -> {
      match (left) {
        Empty() -> {return str("1") + getNumber(right);}
        Leaf(n) -> {return str("0");}
        Node(_, _) -> {return str("0") + getNumber(left);}
      }
    }
  }
}

Trie* makeTrie(int value, int id, int numBits) {
  if (numBits == 0) {
    return Leaf(value);
  }
  if ((id >> (numBits - 1)) & 1) {
    printf("1");
    return Node(Empty(), makeTrie(value, id, numBits - 1));
  }
  else {
    printf("0");
    return Node(makeTrie(value, id, numBits - 1), Empty());
  }
}

int insertCustomer(int id, int numBits, Lvar<Trie*>* l) {
  return put(l, makeTrie(id, id, numBits));
}

cilk int main(int argc, char **argv) {
  Lattice<Trie*>* D = lattice(Empty(), Top(), leq, lub, isTop, showTrie);
  Lvar<Trie*>* l = newLvar(D);
  insertCustomer(8, 4, l);
  printf("\n");
  printf("%s\n", getNumber(freeze(l)).text);
  printf("%s\n", show(l).text);
  cilk return 1;
}

