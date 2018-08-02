#include "lvars.xh"
#include <cilk.xh>

// not completely a traditional lvar, since lub operation depends on order
// of arguments (should lub(resultSoFar, addingStuff)), and prints
// non-deterministically

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
        I(n2) -> {return 1;} // since any int can be reached from any other
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

Lvar<Int*>* resultLvar;

cilk int fib(int n);
cilk int fib(int n) {
  if (n < 2) {
    cilk return n;
  }
  int result1, result2;
  spawn result1 = fib(n - 1);
  spawn result2 = fib(n - 2);
  cilk return result1 + result2;
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
          printf("adding %d\n", hd);
          // only print when adding from right
          put(resultLvar, I(hd));
          printf("%s\n", showInteger(resultLvar->_value).text);
          result = Set(hd, result);
        }  
        tempSet2 = tl;
      }
    }
  }
  return result;
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

  Lattice<Int*>* intLat = lattice(I_Bot(), I_Top(), leqInt, lubInt, 
                                 isTopInt, showInt);
  resultLvar = newLvar(intLat);
  Lvar<NodeSet*>* l = newLvar(D);
  int success;
  for (int i = 0; i < 4; i++) {
    spawn success = setPut(l, i);
  }
  for (int i = 2; i < 4; i++) {
    spawn success = setPut(l, i);
  }
  sync;
  freeze(l);
  freeze(resultLvar);
  printf("result = {%s}\n", show(l).text);
  printf("result = {%s}\n", show(resultLvar).text);
  cilk return 1;
}
