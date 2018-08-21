#include "lvars.xh"

// Based on example from composition.al post
// "How to read from an LVar: an illustrated guide"

// ******************** Setting up data types *********************************

typedef datatype YN YN;
datatype YN {
  Yes ();
  No ();
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

// ********************** free function ***************************************

void freePersonVote(Vote* v) {
  match (v) {
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
  match (v) {
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
  match (v1) {
    Yes() -> {
      match (v2) {
        Yes() -> {return 1;} 
        _ -> {return 0;}
      }
    }
    No() -> {
      match (v2) {
        No() -> {return 1;}  
        _ -> {return 0;}
      }
    }
  }
}

int eqPeopleVotes(Vote* v1, Vote* v2) {
  match (v1) {
    Horace(vote1) -> {
      match (v2) {
        Horace(vote2) -> {return eqVotes(vote1, vote2);}
        _ -> {return 0;}
      }
    }
    Kat(vote1) -> {
      match (v2) {
        Kat(vote2) -> {return eqVotes(vote1, vote2);}
        _ -> {return 0;}
      }
    }
    Franz(vote1) -> {
      match (v2) {
        Franz(vote2) -> {return eqVotes(vote1, vote2);}
        _ -> {return 0;}
      }
    }
  }
}

int isInSet(Vote* v, VoteSet* votes) {
  match (votes) {
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
  match (v2) {
    Top() -> {return 1;}
    Empty() -> {
      match (v1) {
        Empty() -> {return 1;}
        _ -> {return 0;}
      }
    }
    Set(hd2, tl2) -> {
      match (v1) {
        Top() -> {return 0;}
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
  match (v) {
    Yes() -> {return Yes();}
    No() -> {return No();}
  }
}

Vote* copyPersonVote(Vote* v) {
  match (v) {
    Horace(vote) -> {return Horace(copyVote(vote));}
    Franz(vote) -> {return Franz(copyVote(vote));}
    Kat(vote) -> {return Kat(copyVote(vote));}
  }
}

VoteSet* copyVoteSet(VoteSet* v) {
  match (v) {
    Top() -> {return Top();}
    Empty() -> {return Empty();}
    Set(hd, tl) -> {
      return Set(copyPersonVote(hd), copyVoteSet(tl));
    }
  }
}

YN* getOtherVote(YN* v) {
  match (v) {
    Yes() -> {return No();}
    No() -> {return Yes();}
  }
}

VoteSet* voteSetUnion(VoteSet* v1, VoteSet* v2) {
  match (v1) {
    Top() -> {return Top();}
    Empty() -> {return copyVoteSet(v2);}
    Set(hd1, tl1) -> {
      match (v2) {
        Top() -> {return Top();}
        Empty() -> {return copyVoteSet(v1);}
        Set(hd2, tl2) -> {
          match (hd1) {
            Horace(vote) -> {
              Vote* other = Horace(getOtherVote(vote));
              if (isInSet(other, v2)) {
                freePersonVote(other);
                return Top();
              }
              freePersonVote(other);
              if (isInSet(hd1, v2)) {
                return voteSetUnion(tl1, v2);
              }
              VoteSet* result = voteSetUnion(tl1, v2);
              match (result) {
                Top() -> {return Top();}
                _ -> {return Set(copyPersonVote(hd1), result);}
              }
            }
            Franz(vote) -> {
              Vote* other = Franz(getOtherVote(vote));
              if (isInSet(other, v2)) {
                freePersonVote(other);
                return Top();
              }
              freePersonVote(other);
              if (isInSet(hd1, v2)) {
                return voteSetUnion(tl1, v2);
              }
              VoteSet* result = voteSetUnion(tl1, v2);
              match (result) {
                Top() -> {return Top();}
                _ -> {return Set(copyPersonVote(hd1), result);}
              }
            }
            Kat(vote) -> {
              Vote* other = Kat(getOtherVote(vote));
              if (isInSet(other, v2)) {
                freePersonVote(other);
                return Top();
              }
              freePersonVote(other);
              if (isInSet(hd1, v2)) {
                return voteSetUnion(tl1, v2);
              }
              VoteSet* result = voteSetUnion(tl1, v2);
              match (result) {
                Top() -> {return Top();}
                _ -> {return Set(copyPersonVote(hd1), result);}
              }
            }
          }
        }
      }
    }
  }
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

int main(int argc, char **argv) {
  Lattice<VoteSet*> * D = lattice(Top(), isVoteSubset, voteSetUnion, 
                                  displayVoteSet, freeVoteSet);

  Lvar<VoteSet*>* y = newLvar D;
  Lvar<VoteSet*>* n = newLvar D;

  ActivationSet<VoteSet*>* noPizza = activationSet(D){Set(Horace(No()), 
                                                      Set(Franz(No()), 
                                                      Set(Kat(No()), 
                                                      Empty())))};
  ActivationSet<VoteSet*>* yesPizza = activationSet(D){Set(Horace(Yes()), Empty()),
                                                       Set(Kat(Yes()), Empty()),
                                                       Set(Franz(Yes()), Empty())};
  ThresholdSet<VoteSet*>* t = thresholdSet(D){noPizza, yesPizza};

  printf("Kat votes No\n");
  put (Set(Kat(No()), Empty())) in y;
  printf("Franz votes No\n");
  put (Set(Franz(No()), Empty())) in y;
  printf("Kat votes No again\n");
  put (Set(Kat(No()), Empty())) in y;
  printf("Horace votes Yes\n");
  put (Set(Horace(Yes()), Empty())) in y;

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
  put (Set(Kat(No()), Empty())) in n;
  printf("Franz votes No\n");
  put (Set(Franz(No()), Empty())) in n;
  //printf("Kat votes tries to change her vote to Yes\n");
  //put (Set(Kat(Yes()), Empty())) in n; (this will produce an invalid put error)
  printf("Horace votes No\n");
  put (Set(Horace(No()), Empty())) in n;

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
  put (Set(Franz(Yes()), Empty())) in y;

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
  freeLattice D;
}

