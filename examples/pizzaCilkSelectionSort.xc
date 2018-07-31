#include "lvars.xh"
#include <cilk.xh>

// Based on example from composition.al post
// "How to read from an LVar: an illustrated guide"

// ******************** Setting up data types *********************************

typedef datatype YN YN;
datatype YN {
  Yes ();
  No ();
  Undecided ();
};

typedef datatype Vote Vote;
datatype Vote {
  Horace (YN*);
  Franz (YN *);
  Kat (YN *);
}

typedef datatype VoteSet VoteSet;
datatype VoteSet {
  Empty ();
  Set (Vote*, VoteSet*);
  Top ();
}

// ******************* display method for our lattice *************************

string showYN(YN* yn) {
  string result;
  match (yn) {
    Yes () -> {
      result = str("Yes()");
    }
    No () -> {
      result = str("No()");
    }
  }
  return result;
}

string showVote(Vote* v) {
  string result;
  match (v) {
    Horace(yn1) -> {
      result = "Horace(" + showYN(yn1) + ")";
    }
    Franz(yn1) -> {
      result = "Franz(" + showYN(yn1) + ")";
    }
    Kat(yn1) -> {
      result = "Kat(" + showYN(yn1) + ")";
    }
  }
  return result;
}

string showInner(VoteSet* v) {
  string result = str("");
  match (v) {
    Empty () -> {}
    Set (hd, tl) -> {
      result = showVote(hd);
      match (tl) {
        Empty () -> {}
        other -> { 
          result += ", " + showInner(tl);
        }
      }
    }
    Top () -> {result = str("Top()");}
  }
  return result;
}

string showVoteSet(VoteSet* v) {
  return "{" + showInner(v) + "}";
}


// *********************** eq method for our lattice **************************

// to determine if two YNs are the same

int eqYN(YN * yn1, YN* yn2) {
  match (yn1) {
    Yes () -> {
      match (yn2) {
        Yes () -> {return 1;}
        other -> {return 0;}
      }
    }
    No () -> {
      match (yn2) {
        No () -> {return 1;}
        other -> {return 0;}
      }
    }
    Undecided () -> {
      match (yn2) {
        Undecided () -> {return 1;}
        other -> {return 0;}
      }
    }
  }
}

// to determine if two Votes are the same

int eqVotes(Vote * v1, Vote * v2) {
  match (v1) {
    Horace(yn1) -> {
      match (v2) {
        Horace(yn2) -> {return eqYN(yn1, yn2);}
        other -> {return 0;}
      }
    }
    Franz(yn1) -> {
      match (v2) {
        Franz(yn2) -> {return eqYN(yn1, yn2);}
        other -> {return 0;}
      }
    }
    Kat(yn1) -> {
      match (v2) {
        Kat(yn2) -> {return eqYN(yn1, yn2);}
        other -> {return 0;}
      }
    }
  }
}

// helper function to assist in determining whether sets of
// votes are the same (set-wise)

VoteSet* removeFromSet(Vote* v, VoteSet* vs) {
  match (vs) {
    Empty () -> {return Empty ();}
    Set (hd, rest) -> {
      if (eqVotes(hd, v)) {
        return rest;
      }
      return Set (hd, removeFromSet(v, rest));
    }
    Top () -> {return Top();}
  }
}

int isTop(VoteSet* v) {
  match (v) {
    Top() -> {return 1;}
    _ -> {return 0;}
  }
}

// *********************** leq method for our lattice ***********************

// helper function to get someones vote from a voteset, assuming it matches the
// vote we have specifed for that person (or that vote is undecided)

YN* getVote(VoteSet* v, Vote* vt) {
  match (v) {
    Empty () -> {return Undecided();}
    Set (Horace(yn1), tail) -> {
      match (vt) {
        Horace(yn2) -> {
          if (eqYN(yn1, yn2) || eqYN(yn1, Undecided()) || eqYN(yn2, Undecided())) {
            return yn1;
          } 
          return NULL;
        }
        other -> {return getVote(tail, vt);}
      }
    }
    Set (Kat(yn1), tail) -> {
      match (vt) {
        Kat(yn2) -> {
          if (eqYN(yn1, yn2) || eqYN(yn1, Undecided()) || eqYN(yn2, Undecided())) {
            return yn1;
          } 
          return NULL;
        }
        other -> {return getVote(tail, vt);}
      }
    }
    Set (Franz(yn1), tail) -> {
      match (vt) {
        Franz(yn2) -> {
          if (eqYN(yn1, yn2) || eqYN(yn1, Undecided()) || eqYN(yn2, Undecided())) {
            return yn1;
          } 
          return NULL;
        }
        other -> {return getVote(tail, vt);}
      }
    }
  }
}

int isInSet(Vote * v, VoteSet * votes) {
  match (votes) {
    Empty() -> {return 0;}
    Top() -> {return 0;}
    Set(hd, tail) -> {
      if (eqVotes(v, hd)) {
        return 1;
      }
      return isInSet(v, tail);
    }
  }
}

YN* getVoteType(Vote * v) {
  match (v) {
    Horace(vote) -> {return vote;}
    Franz(vote) -> {return vote;}
    Kat(vote) -> {return vote;}
  }
}

int leq(VoteSet* v1, VoteSet* v2) {
  match (v1) {
    Empty() -> {return 1;}
    Top() -> {return 0;}
    Set(hd, tail) -> {
      if (isInSet(hd, v2) == 1 || eqYN(getVoteType(hd), Undecided())) {
        return leq(tail, v2);
      }
      return 0;
    }
  }
}

// ********************* lub function for our lattice *************************

// lub for VoteSet

VoteSet* lub(VoteSet* v1, VoteSet* v2) {
  match (v1) {
    Empty () -> {return v2;}
    Set (hd1, rest1) -> {
      if (getVote(v2, hd1) == NULL) {
        return Top();
      }
      match (lub(rest1, v2)) {
        Top() -> {return Top();}
        other -> {return Set(hd1, lub(rest1, v2));}
      }
    }
    Top () -> {return Top();}
  }
}

//*****************************************************************************

int* randArr(int size) {
  int* arr = malloc(size * sizeof(int));
  for (int i = 0; i < size; i++) {
    arr[i] = rand();
  }
  return arr;
}

void printArr(int* arr, int length) {
  printf("[");
  if (length == 0) {
    printf("]\n");
    return;
  }
  for (int i = 0; i < length - 1; i++) {
    printf("%d ", arr[i]);
  }
  printf("%d]\n", arr[length - 1]);
}

int minIndex(int* arr, int length) {
  int min_i = 0;
  for (int i = 0; i < length; i++) {
    if (arr[i] < arr[min_i]) {
      min_i = i;
    }
  }
  return min_i;
}

int* copyArr(int* arr, int start, int end) {
  int* newArr = malloc((end - start) * sizeof(int));
  for (int i = start; i < end; i++) {
    newArr[i - start] = arr[i];
  }
  return newArr;
}

int* concatArr(int* arr1, int length1, int* arr2, int length2) {
  int* newArr = malloc((length1 + length2) * sizeof(int));
  int i = 0;
  for (; i < length1; i++) {
    newArr[i] = arr1[i];
  }
  for (; i < length1 + length2; i++) {
    newArr[i] = arr2[i - length1];
  }
  return newArr;
}

int* selection_sort(int* arr, int length);

// sorts arr using selection sort

int* selection_sort(int* arr, int length) {
  if (length < 2) {
    return copyArr(arr, 0, length);
  }
  int i = minIndex(arr, length);

  int* partial;
  int* section1 = copyArr(arr, 0, i);
  int* section2 = copyArr(arr, i+1, length);
  int* total = concatArr(section1, i, section2, length - i - 1);

  partial = selection_sort(total, length - 1);
  int* newOne = malloc(sizeof(int));
  newOne[0] = arr[i];
  int* result = concatArr(newOne, 1, partial, length - 1);

  free(section1);
  free(section2);
  free(partial);
  free(total);
  free(newOne);
  return result;
}

cilk int* c_selection_sort(int* arr, int length);

// sorts arr using selection sort

cilk int* c_selection_sort(int* arr, int length) {
  if (length < 2) {
    cilk return copyArr(arr, 0, length);
  }
  int i = minIndex(arr, length);

  int* partial;
  int* section1 = copyArr(arr, 0, i);
  int* section2 = copyArr(arr, i+1, length);
  int* total = concatArr(section1, i, section2, length - i - 1);

  spawn partial = c_selection_sort(total, length - 1);
  sync;
  int* newOne = malloc(sizeof(int));
  newOne[0] = arr[i];
  int* result = concatArr(newOne, 1, partial, length - 1);

  free(section1);
  free(section2);
  free(partial);
  free(total);
  free(newOne);
  cilk return result;
}

YN* getVoteSearch(int* arr, int size) {
  int* sorted;
  sorted = selection_sort(arr, size);
  int result = sorted[0];
  if (result > 1000000000) {
    free(sorted);
    return Yes();
  }
  free(sorted);
  return No();
}

cilk YN* getVoteSearchCilk(int* arr, int size) {
  int* sorted;
  spawn sorted = c_selection_sort(arr, size);
  sync;
  int result = sorted[0];
  if (result > 1000000000) {
    free(sorted);
    cilk return Yes();
  }
  free(sorted);
  cilk return No();
}

int nonCilk(int* arr, int size) {

  Lattice<VoteSet*> * D = lattice(Empty(), Top(), leq, lub, isTop, showVoteSet);
  Lvar<VoteSet*> *votes = newLvar(D);

  ActivationSet<VoteSet*> * noPizza = activationSet(D, 1);
  add(noPizza, Set(Horace(No()), Set(Kat(No()), Set(Franz(No()), Empty()))));
  ActivationSet<VoteSet*> * yesPizza = activationSet(D);
  add(yesPizza, Set(Horace(Yes()), Empty()));
  add(yesPizza, Set(Kat(Yes()), Empty()));
  add(yesPizza, Set(Franz(Yes()), Empty()));
  ThresholdSet<VoteSet*> *t = thresholdSet(D, 2){yesPizza, noPizza};

  YN* kresult;
  YN* hresult;
  YN* fresult;
  kresult = getVoteSearch(arr, size);
  put(votes, Set(Kat(kresult), Empty()));
  hresult = getVoteSearch(arr, size);
  put(votes, Set(Horace(hresult), Empty()));
  fresult = getVoteSearch(arr, size);
  put(votes, Set(Franz(fresult), Empty()));

  ActivationSet<VoteSet*>* getPiz = get(votes, t);
  if (getPiz == yesPizza) {
    printf("Get pizza! At least one person will eat some.\n");
    return 1;
  }
  if (getPiz == noPizza) {
    printf("Don't get pizza. Nobody will eat any.\n");
    return 0;
  }
  printf("Not enough information to get pizza or not!\n");
  return -1;
}


cilk int withCilk(int* arr, int size) {

  Lattice<VoteSet*> * D = lattice(Empty(), Top(), leq, lub, isTop, showVoteSet);
  Lvar<VoteSet*> *votes = newLvar(D);

  ActivationSet<VoteSet*> * noPizza = activationSet(D, 1);
  add(noPizza, Set(Horace(No()), Set(Kat(No()), Set(Franz(No()), Empty()))));
  ActivationSet<VoteSet*> * yesPizza = activationSet(D);
  add(yesPizza, Set(Horace(Yes()), Empty()));
  add(yesPizza, Set(Kat(Yes()), Empty()));
  add(yesPizza, Set(Franz(Yes()), Empty()));
  ThresholdSet<VoteSet*> *t = thresholdSet(D, 2){yesPizza, noPizza};

  YN* kresult;
  YN* hresult;
  YN* fresult;
  spawn kresult = getVoteSearchCilk(arr, size);
  spawn hresult = getVoteSearchCilk(arr, size);
  spawn fresult = getVoteSearchCilk(arr, size);
  sync;
  put(votes, Set(Kat(kresult), Empty()));
  put(votes, Set(Horace(hresult), Empty()));
  put(votes, Set(Franz(fresult), Empty()));
  ActivationSet<VoteSet*>* getPiz = get(votes, t);
  if (getPiz == yesPizza) {
    printf("Get pizza! At least one person will eat some.\n");
    cilk return 1;
  }
  if (getPiz == noPizza) {
    printf("Don't get pizza. Nobody will eat any.\n");
    cilk return 0;
  }
  printf("Not enough information to get pizza or not!\n");
  cilk return -1;
}

cilk int main(int argc, char **argv) {
  int size = 30000;
  int* arr = randArr(size);
  nonCilk(arr, size);
  int result;
  spawn result = withCilk(arr, size);
  sync;
  free(arr);
  cilk return 1;
}

