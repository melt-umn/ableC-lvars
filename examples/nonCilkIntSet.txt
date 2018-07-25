#define DEBUG
#include "lvars.xh"

int eqint(int i1, int i2) {
  return i1 == i2;
}

string showint(int i) {
  return show(i);
}

typedef datatype Set_int Set_int;
datatype Set_int {
  int_Empty ();
  int_Set (int, Set_int*);
  int_Top();
};

string showInner_int(Set_int* set) {
  string result = str("");
  match (set) {
    int_Empty() -> {}
    int_Set(hd, tl) -> {
      result = showint(hd);
      match (tl) {
        int_Empty() -> {} 
        _ -> {
          result += ", " + showInner_int(tl);
        }
      }
    }
    int_Top() -> {result = str("Top()");}
  }
  return result;
}

string showSet_int(Set_int* set) {
  return "{" + showInner_int(set) + "}";
}

// returns 1 if set1 is a subset of set2, 0 otherwise
int isSubset_int(Set_int* set1, Set_int* set2) {
  match (set1) {
    int_Empty() -> {return 1;}
    int_Top() -> {return 0;}
    int_Set(hd1, tl1) -> {
      match (set2) {
        int_Empty() -> {return 0;}
        int_Top() -> {return 0;}
        int_Set(hd2, tl2) -> {
          if (eqint(hd1, hd2)) {
            return isSubset_int(tl1, tl2);
          }
          return isSubset_int(int_Set(hd1, int_Empty()), tl2) &&
                 isSubset_int(tl1, set2);
        }
      }
    }
  }
}

int eqSet_int(Set_int* set1, Set_int* set2) {
  match (set1) {
    int_Top() -> {
      match (set2) {
        int_Top() -> {return 1;}
        _ -> {return 0;}
      }
    }
    _ -> {return isSubset_int(set1, set2) && isSubset_int(set2, set1);}
  } 
}

int leqSet_int(Set_int* set1, Set_int* set2) {
  return isSubset_int(set1, set2);
}

int isInSet_int(int item, Set_int* set) {
  match (set) {
    int_Empty() -> {return 0;}
    int_Top() -> {return 0;}
    int_Set(hd, tl) -> {
      if (eqint(hd, item)) {
        return 1;
      }
      return isInSet_int(item, tl);
    }
  }
}

Set_int* lubSet_int(Set_int* set1, Set_int* set2) {
  match (set1) {
    int_Empty() -> {return set2;}
    int_Top() -> {return int_Top();}
    int_Set(hd1, tl1) -> {
      match (set2) {
        int_Empty() -> {return set1;}
        int_Top() -> {return int_Top();}
        int_Set(_, _) -> {
          Set_int* partial = lubSet_int(tl1, set2);
          match (partial) {
            int_Empty() -> {return int_Set(hd1, int_Empty());}
            int_Top() -> {return int_Top();}
            int_Set(_, _) -> {
              if (isInSet_int(hd1, partial)) {
                return partial;
              }
              return int_Set(hd1, partial);
            }
          }
        }
      }
    }
  }
}

Lattice<Set_int*> * latticeint() {
  return lattice(int_Empty(), int_Top(), leqSet_int, lubSet_int, eqSet_int, showSet_int);
}
int buildSet(int start, int stop, Lvar<Set_int*>* l);

int buildSet(int start, int stop, Lvar<Set_int*>* l) {
  if (stop < start) {
    put(l, int_Empty());
    return 1;
  }
  put(l, int_Set(start,int_Empty()));
  int res1, res2, res3;
  res1 = buildSet(start + 2, stop - 2, l);
  res3 = buildSet(start + 2, stop - 2, l);
  res2 = buildSet(start + 1, stop, l); 
  return res1 && res2 && res3;
}

int main(int argc, char **argv) {
  Lattice<Set_int*> * D = latticeint();
  Lvar<Set_int*>* set = newLvar(D);
  int res;

  res = buildSet(0, 35, set); // 40 is too high

  ThresholdSet<Set_int*> *t = thresholdSet(D, 1){activationSet(D){int_Empty()}};
  ActivationSet<Set_int*>*  result = get(set, t);
  printf("Act Set: %s\n", show(result).text);
  Set_int* frozen = freeze(set);
  printf("Frozen Lvar: %s\n", show(set).text);
  //put(set, int_Empty());
  free(D);
  free(set);
  freeSet(t);
  freeSet(result);
  free(frozen);
  return 1;
}
