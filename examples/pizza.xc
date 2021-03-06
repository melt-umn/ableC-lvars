#include "lvars.xh"

// Based on example from composition.al post
// "How to read from an LVar: an illustrated guide"

// LVar representing a set of votes for pizza; if at least one person votes "yes,"
// the group should get pizza; if everyone votes "no," the group should not get
// pizza

// ******************** Setting up data types *********************************

typedef datatype YN YN;
datatype YN {
  Yes ();
  No ();
};

allocate datatype YN with malloc;

typedef datatype Vote Vote;
datatype Vote {
  Horace (YN*);
  Franz (YN *);
  Kat (YN *);
}

allocate datatype Vote with malloc;

typedef datatype VoteSet VoteSet;
datatype VoteSet {
  Empty ();
  Set (Vote*, VoteSet*);
}

allocate datatype VoteSet with malloc;

// ********************** free function ***************************************

void freePersonVote(Vote* v) {
  match (*v) {
    Horace(vote) -> {
      free(vote);
      free(v);
    }
    Franz(vote) -> {
      free(vote);
      free(v);
    }
    Kat(vote) -> {
      free(vote);
      free(v);
    }
  }
}

void freeVoteSet(VoteSet* v) {
  match (*v) {
    Set(hd, tl) -> {
      freePersonVote(hd);
      freeVoteSet(tl);
      free(v);
    }
    _ -> {free(v);}
  }
}

// *********************** leq method for our lattice *************************

int eqVotes(YN* v1, YN* v2) {
  match (*v1) {
    Yes() -> {
      match (*v2) {
        Yes() -> {return 1;} 
        _ -> {return 0;}
      }
    }
    No() -> {
      match (*v2) {
        No() -> {return 1;}  
        _ -> {return 0;}
      }
    }
  }
}

int eqPeopleVotes(Vote* v1, Vote* v2) {
  match (*v1) {
    Horace(vote1) -> {
      match (*v2) {
        Horace(vote2) -> {return eqVotes(vote1, vote2);}
        _ -> {return 0;}
      }
    }
    Kat(vote1) -> {
      match (*v2) {
        Kat(vote2) -> {return eqVotes(vote1, vote2);}
        _ -> {return 0;}
      }
    }
    Franz(vote1) -> {
      match (*v2) {
        Franz(vote2) -> {return eqVotes(vote1, vote2);}
        _ -> {return 0;}
      }
    }
  }
}

int isInSet(Vote* v, VoteSet* votes) {
  match (*votes) {
    Empty() -> {return 0;}
    Set(hd, tl) -> {
      if (eqPeopleVotes(v, hd)) {
        return 1;
      }
      return isInSet(v, tl);
    }
  }
}

int isVoteSubset(VoteSet* v1, VoteSet* v2) {
  match (*v2) {
    Empty() -> {
      match (*v1) {
        Empty() -> {return 1;}
        _ -> {return 0;}
      }
    }
    Set(hd2, tl2) -> {
      match (*v1) {
        Empty() -> {return 1;}
        Set(hd1, tl1) -> {
          return isInSet(hd1, v2) && isVoteSubset(tl1, v2);
        }
      }
    }
  }
}

// ********************* lub function for our lattice *************************

YN* copyVote(YN* v) {
  match (*v) {
    Yes() -> {return malloc_Yes();}
    No() -> {return malloc_No();}
  }
}

Vote* copyPersonVote(Vote* v) {
  match (*v) {
    Horace(vote) -> {return malloc_Horace(copyVote(vote));}
    Franz(vote) -> {return malloc_Franz(copyVote(vote));}
    Kat(vote) -> {return malloc_Kat(copyVote(vote));}
  }
}

VoteSet* copyVoteSet(VoteSet* v) {
  match (*v) {
    Empty() -> {return malloc_Empty();}
    Set(hd, tl) -> {
      return malloc_Set(copyPersonVote(hd), copyVoteSet(tl));
    }
  }
}

YN* getOtherVote(YN* v) {
  match (*v) {
    Yes() -> {return malloc_No();}
    No() -> {return malloc_Yes();}
  }
}

VoteSet* voteSetUnion(VoteSet* v1, VoteSet* v2) {
  match (*v1) {
    Empty() -> {return copyVoteSet(v2);}
    Set(hd1, tl1) -> {
      match (*v2) {
        Empty() -> {return copyVoteSet(v1);}
        Set(hd2, tl2) -> {
          match (*hd1) {
            Horace(vote) -> {
              Vote* other = malloc_Horace(getOtherVote(vote));
              if (isInSet(other, v2)) {
                freePersonVote(other);
                return NULL;
              }
              freePersonVote(other);
              if (isInSet(hd1, v2)) {
                return voteSetUnion(tl1, v2);
              }
              VoteSet* result = voteSetUnion(tl1, v2);
              if (result == NULL) {
                return result;
              }
              else {
                return malloc_Set(copyPersonVote(hd1), result);
              }
            }
            Franz(vote) -> {
              Vote* other = malloc_Franz(getOtherVote(vote));
              if (isInSet(other, v2)) {
                freePersonVote(other);
                return NULL;
              }
              freePersonVote(other);
              if (isInSet(hd1, v2)) {
                return voteSetUnion(tl1, v2);
              }
              VoteSet* result = voteSetUnion(tl1, v2);
              if (NULL == result) {
                return result;
              }
              else {
                return malloc_Set(copyPersonVote(hd1), result);
              }
            }
            Kat(vote) -> {
              Vote* other = malloc_Kat(getOtherVote(vote));
              if (isInSet(other, v2)) {
                freePersonVote(other);
                return NULL;
              }
              freePersonVote(other);
              if (isInSet(hd1, v2)) {
                return voteSetUnion(tl1, v2);
              }
              VoteSet* result = voteSetUnion(tl1, v2);
              if (NULL == result) {
                return result;
              }
              else {
                return malloc_Set(copyPersonVote(hd1), result);
              }
            }
          }
        }
      }
    }
  }
}

Value<VoteSet*>* lubVoteSet(VoteSet* v1, VoteSet* v2) {
  VoteSet* result = voteSetUnion(v1, v2);
  if (result == NULL) {
    return Top<VoteSet*>;
  }
  return value result;
}

// ******************* display method for our lattice *************************

void displayYN(YN* yn) {
  match (*yn) {
    Yes () -> {
      printf("Yes()");
    }
    No () -> {
      printf("No()");
    }
  }
}

void displayVote(Vote* v) {
  match (*v) {
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
  match (*v) {
    Empty () -> {}
    Set (hd, tl) -> {
      displayVote(hd);
      match (*tl) {
        Empty () -> {}
        other -> { 
          printf(", ");
          displayInner(tl);
        }
      }
    }
  }
}

void displayVoteSet(VoteSet* v) {
  printf("{");
  displayInner(v);
  printf("}");
}

int main(int argc, char **argv) {
  Lattice<VoteSet*> * D = lattice(isVoteSubset, lubVoteSet, 
                                  displayVoteSet, freeVoteSet);

  Lvar<VoteSet*>* y = newLvar D;
  Lvar<VoteSet*>* n = newLvar D;

  ActivationSet<VoteSet*>* noPizza = activationSet(D){malloc_Set(malloc_Horace(malloc_No()), 
                                                      malloc_Set(malloc_Franz(malloc_No()), 
                                                      malloc_Set(malloc_Kat(malloc_No()), 
                                                      malloc_Empty())))};
  ActivationSet<VoteSet*>* yesPizza = activationSet(D){malloc_Set(malloc_Horace(malloc_Yes()), malloc_Empty()),
                                                       malloc_Set(malloc_Kat(malloc_Yes()), malloc_Empty()),
                                                       malloc_Set(malloc_Franz(malloc_Yes()), malloc_Empty())};
  ThresholdSet<VoteSet*>* t = thresholdSet(D){noPizza, yesPizza};

  printf("Kat votes No\n");
  put (malloc_Set(malloc_Kat(malloc_No()), malloc_Empty())) in y;
  printf("Franz votes No\n");
  put (malloc_Set(malloc_Franz(malloc_No()), malloc_Empty())) in y;
  printf("Kat votes No again\n");
  put (malloc_Set(malloc_Kat(malloc_No()), malloc_Empty())) in y;
  printf("Horace votes Yes\n");
  put (malloc_Set(malloc_Horace(malloc_Yes()), malloc_Empty())) in y;

  ActivationSet<VoteSet*>*  result1 = get y with t;
  freeze y; 
  printf("Actual vote set is: ");
  display y;
  printf("\n");
  if (result1 == noPizza) {
    printf("Don't get pizza\n");
  }
  if (result1 == yesPizza) {
    printf("Get pizza\n");
  }

  printf("\n");
  printf("Kat votes No\n");
  put (malloc_Set(malloc_Kat(malloc_No()), malloc_Empty())) in n;
  printf("Franz votes No\n");
  put (malloc_Set(malloc_Franz(malloc_No()), malloc_Empty())) in n;
  //printf("Kat votes tries to change her vote to Yes\n");
  //put (Set(Kat(Yes()), Empty())) in n; (this will produce an invalid put error)
  printf("Horace votes No\n");
  put (malloc_Set(malloc_Horace(malloc_No()), malloc_Empty())) in n;

  ActivationSet<VoteSet*>*  result2 = get n with t;
  freeze n; 
  printf("Actual vote set is: ");
  display n;
  printf("\n");
  if (result2 == noPizza) {
    printf("Don't get pizza\n");
  }
  if (result2 == yesPizza) {
    printf("Get pizza\n");
  }

  freeLvar y;
  y = newLvar D;

  printf("\n");
  printf("Franz votes Yes\n");
  put (malloc_Set(malloc_Franz(malloc_Yes()), malloc_Empty())) in y;

  result1 = get y with t;
  freeze y; 
  printf("Actual vote set is: ");
  display y;
  printf("\n");
  if (result1 == noPizza) {
    printf("Don't get pizza\n");
  }
  if (result1 == yesPizza) {
    printf("Get pizza\n");
  }

/*
  freeLvar n;
  n = newLvar D;

  printf("\n");
  printf("Franz votes No\n");
  put (Set(Franz(No()), Empty())) in n;

  result2 = get n with t; // this blocks indefinitely, hasn't reached threshold
  freeze n; 
  printf("Actual vote set is: ");
  display n;
  printf("\n");
  if (result1 == noPizza) {
    printf("Don't get pizza\n");
  }
  if (result1 == yesPizza) {
    printf("Get pizza\n");
  }
*/

  freeActSets t;
  freeSet t;
  freeLvar y;
  freeLvar n;
  free(D);
}

