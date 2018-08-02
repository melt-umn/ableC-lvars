#define CHECK
#include "lvars.xh"
#include <cilk.xh>

typedef datatype NodeSet NodeSet;
datatype NodeSet {
  Top();
  Set(int, NodeSet*);
  Empty();
};

int eqNodes(int n1, int n2) {
  return n1 == n2;
}

string showNode(int n) {
  return show(n);
}

// helper that checks if set1 is a subset of set2

int isNodeSubset(NodeSet* set1, NodeSet* set2) {
  match (set1) {
    Top() -> {
      match (set2) {
        Top() -> {return 1;}
        _ -> {return 0;}
      }
    }
    Empty() -> {return 1;}
    Set(hd1, tl1) -> {
      match (set2) {
        Top() -> {return 1;}
        Empty() -> {return 0;}
        Set(hd2, tl2) -> {
          if (eqNodes(hd1, hd2)) {
            return isNodeSubset(tl1, tl2);
          }
          return isNodeSubset(Set(hd1, Empty()), tl2) &&
                 isNodeSubset(tl1, set2);
        }
      }
    }
  }
}

int isTopNodeSet(NodeSet* s) {
  match (s) {
    Top() -> {
      return 1;
    }
    _ -> {return 0;}
  }   
}

NodeSet* nodeSetUnion(NodeSet* set1, NodeSet* set2) {
  match (set1) {
    Top() -> {return set1;}
    Empty() -> {return set2;}
    Set(hd1, tl1) -> {
      match (set2) {
        Top() -> {return set2;}
        Empty() -> {return set1;}
        Set(hd2, tl2) -> {
          NodeSet* partial = nodeSetUnion(tl1, set2);
          if (isTopNodeSet(partial)) {
            return partial;
          }
          if (isNodeSubset(Set(hd1, Empty()), partial)) {
            return partial;
          }
          return Set(hd1, partial);
        }
      }
    }
  }
}

string showNodes(NodeSet* s) {
  match (s) {
    Empty() -> {return str("");}
    Set(hd, tl) -> {
      string result = showNode(hd);
      match (tl) {
        Empty() -> {return result;}
        Set(_, _) -> {return result + ", " + showNodes(tl);}
      }
    }
  }
}

cilk int setPut(Lvar<NodeSet*>* l, int value) {
  cilk return put(l, Set(value, Empty()));
}

cilk int main(int argc, char **argv) {
  Lattice<NodeSet*>* D = lattice(Empty(), Top(), isNodeSubset, nodeSetUnion, 
                                 isTopNodeSet, showNodes);
  Lvar<NodeSet*>* l = newLvar(D);
  int success;
  for (int i = 0; i < 10; i++) {
    spawn success = setPut(l, i);
  }
  sync;
  freeze(l);
  printf("result = {%s}\n", show(l).text);
}
