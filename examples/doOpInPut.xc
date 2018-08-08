#include "lvars.xh"
#include "sumInt.xh"
#include <cilk.xh>

// not completely a traditional lvar, since lub operation depends on order
// of arguments (should lub(resultSoFar, addingStuff)), and prints
// non-deterministically

Lvar<Int*>* resultLvar;

int fib(int n) {
  if (n < 2) {
    return n;
  }
  return fib(n - 1) + fib(n - 2);
}

typedef datatype NodeSet NodeSet;
datatype NodeSet {
  Top();
  Set(int, NodeSet*);
  Empty();
};

int eqNodes(int n1, int n2) {
  return n1 == n2;
}

void showNode(int n) {
  printf("%d", n);
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

int isInSet(int elem, NodeSet* set) {
  match (set) {
    Top() -> {return 0;}
    Empty() -> {return 0;}  
    Set(hd, tl) -> {
      if (eqNodes(elem, hd)) {
        return 1;
      }
      return isInSet(elem, tl);
    }
  }
}

int isEmpty(NodeSet* set) {
  match (set) {
    Empty() -> {return 1;}
    _ -> {return 0;}
  }
}

NodeSet* nodeSetUnion(NodeSet* set1, NodeSet* set2) {
  NodeSet* result = Empty();
  NodeSet* tempSet1 = set1;
  NodeSet* tempSet2 = set2;
  while (!isEmpty(tempSet1)) {
    match (tempSet1) {
      Top() -> {return Top();}
      Set(hd, tl) -> {
        if (!isInSet(hd, result)) {
          result = Set(hd, result);
        }  
        tempSet1 = tl;
      }
    }
  }
  while (!isEmpty(tempSet2)) {
    match (tempSet2) {
      Top() -> {return Top();}
      Set(hd, tl) -> {
        if (!isInSet(hd, result)) {
          // only do when adding from right
          put(resultLvar, I(fib(hd)));
          result = Set(hd, result);
        }  
        tempSet2 = tl;
      }
    }
  }
  return result;
}

void showNodes(NodeSet* s) {
  match (s) {
    Empty() -> {}
    Set(hd, tl) -> {
      showNode(hd);
      match (tl) {
        Empty() -> {}
        Set(_, _) -> {
          printf(", ");
          showNodes(tl);
        }
      }
    }
  }
}

cilk int setPut(Lvar<NodeSet*>* l, int value) {
  cilk return put(l, Set(value, Empty()));
}

cilk int main(int argc, char **argv) {

  Lattice<NodeSet*>* D = lattice(Empty(), Top(), isNodeSubset, nodeSetUnion, 
                                 showNodes);

  Lattice<Int*>* intLat = sumIntLattice();
  resultLvar = newLvar(intLat);
  Lvar<NodeSet*>* l = newLvar(D);
  int success;
  for (int i = 0; i < 20; i++) {
    spawn success = setPut(l, i);
  }
  for (int i = 2; i < 15; i++) {
    spawn success = setPut(l, i);
  }
  sync;
  freeze(l);
  freeze(resultLvar);
  printf("result = {");
  show(l);
  printf("}\n");
  printf("result = {");
  show(resultLvar);
  printf("}\n");
  cilk return 1;
}
