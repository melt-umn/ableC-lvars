#include "lvars.xh"

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

void displayYN(YN* yn) {
  match (yn) {
    Yes () -> {
      printf("Yes()");
    }
    No () -> {
      printf("No()");
    }
    Undecided () -> {
      printf("Undecided()");
    }
  }
}

void displayVote(Vote* v) {
  match (v) {
    Horace(yn1) -> {
      printf("Horace(");
      displayYN(yn1);
      printf(")");
    }
    Franz(yn1) -> {
      printf("Franz(");
      displayYN(yn1);
      printf(")");
    }
    Kat(yn1) -> {
      printf("Kat(");
      displayYN(yn1);
      printf(")");
    }
  }
}

void displayInner(VoteSet* v) {
  match (v) {
    Empty () -> {}
    Set (hd, tl) -> {
      displayVote(hd);
      match (tl) {
        Empty () -> {}
        other -> { 
          printf(", ");
          displayInner(tl);
        }
      }
    }
    Top () -> {printf("Top()");}
  }
}

void displayVoteSet(VoteSet* v) {
  printf("{");
  displayInner(v);
  printf("}");
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
    Top() -> {
      match (v2) {
        Top() -> {return 1;}
        _ -> {return 0;}
      }
    }
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

int main(int argc, char **argv) {

  //*********** set up lattice ************************************************

  Lattice<VoteSet*> * D = lattice(Top(), leq, lub, displayVoteSet);

  // **************** create some new lvars ***********************************

  Lvar<VoteSet*> *x = newLvar(D);
  Lvar<VoteSet*> *y = newLvar(D);

  // ***** build activation set that indicates no one wants pizza *************

  ActivationSet<VoteSet*> * noPizza = activationSet(D, 1);
  add(noPizza, Set(Horace(No()), Set(Kat(No()), Set(Franz(No()), Empty()))));
  printf("Activation Set noPizza: ");
  display(noPizza);
  printf("\n");

  // *** build activation set that indicates at least one person want pizza ***

  ActivationSet<VoteSet*> * yesPizza = activationSet(D);
  add(yesPizza, Set(Horace(Yes()), Empty()));
  add(yesPizza, Set(Kat(Yes()), Empty()));
  add(yesPizza, Set(Franz(Yes()), Empty()));
  printf("Activation Set yesPizza: ");
  display(yesPizza);
  printf("\n");

  // ******** put together threshold set **************************************

  ThresholdSet<VoteSet*> *t = thresholdSet(D, 2){yesPizza, noPizza};
  printf("Threshold set: ");
  display(t);
  printf("\n");

  // ************* try collecting some votes **********************************

  int success = put (Set(Kat(No()), Empty())) in x;
  if (!success) {
    printf("Invalid put operation of Set(Kat(No()), Empty())!\n");
    freeSet(t);
    free(D);
    return 0;
  }

  success = put (Set(Franz(No()), Empty())) in x;
  if (!success) {
    printf("Invalid put operation of Set(Franz(No()), Empty())!\n");
    freeSet(t);
    free(D);
    return 0;
  }

  success = put (Set(Horace(Yes()), Empty())) in x;
  if (!success) {
    printf("Invalid put operation of Set(Horace(Yes()), Empty())!\n");
    freeSet(t);
    free(D);
    return 0;
  }

  // ***************** try getting result *************************************

  ActivationSet<VoteSet*>*  result = get (x) with t;
  if (result == NULL) {
    printf("Invalid get operation.\n");
    free(x);
    free(y);
    freeSet(noPizza);
    freeSet(yesPizza);
    freeSet(t);
    free(D);
    return 0;
  }
  else if (result == noPizza) {;
    printf("Don't get pizza.\n");
  }
  else if (result == yesPizza) {
    printf("You should get pizza!\n");
  }
  else {
    printf("Error!");
  }

  add(result, Set(Horace(Undecided()), Set(Franz(Yes()), Empty())));
  display(result);
  printf("\n");

  // ********************* clean up *******************************************
  
  free(x);
  free(y);
  freeSet(noPizza);
  freeSet(yesPizza);
  freeSet(t);
  free(D);
}
