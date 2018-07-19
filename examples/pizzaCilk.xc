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

// eq method for VoteSets

int eq (VoteSet * v1, VoteSet * v2) {
  match (v1) {
    Empty () -> {
      match (v2) {
        Empty () -> {return 1;}
        other -> {return 0;}
      }
    }
    Set (head1, rest1) -> {
      match (v2) {
        Empty () -> {return 0;}
        Set (head2, rest2) -> {return eq(rest1, removeFromSet(head1, v2));}
        Top () -> {return 0;}
      }
    }
    Top () -> {
      match (v2) {
        Top () -> {return 1;}
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
    Top() -> {return 0;}
    Set(hd, tail) -> {
      if (isInSet(hd, v2) || eqYN(getVoteType(hd), Undecided())) {
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

cilk Vote* getVoteFromUser() {
  char* name = malloc(10 * sizeof(char));
  int vote;
  printf("Enter your name: ");
  scanf("%s", name);
  printf("Enter your vote, %s (1 for yes, 0 for no, or another number to wait): ", name);
  scanf("%d", &vote);

  YN* voteResult;
  if (vote == 1) {
    voteResult = Yes();
  }
  else if (vote == 0) {
    voteResult = No();
  }
  else {
    voteResult = Undecided();
  }

  Vote* personVote;

  if (strcmp(name, "Kat") == 0 || strcmp(name, "kat") == 0) {
      personVote = Kat(voteResult);
  }
  else if (strcmp(name, "Horace") == 0 || strcmp(name, "horace") == 0) {
      personVote = Horace(voteResult);
  }
  else if (strcmp(name, "Franz") == 0 || strcmp(name, "franz") == 0) {
      personVote = Franz(voteResult);
  }
  else {
    personVote = NULL;
  }

  free(name);
  cilk return personVote;
}

cilk int getPizza() {
  Lattice<VoteSet*> * D = lattice(Empty(), Top(), leq, lub, eq, showVoteSet);
  Lvar<VoteSet*> *votes = newLvar(D);

  ActivationSet<VoteSet*> * noPizza = activationSet(D, 1);
  add(noPizza, Set(Horace(No()), Set(Kat(No()), Set(Franz(No()), Empty()))));
  ActivationSet<VoteSet*> * yesPizza = activationSet(D);
  add(yesPizza, Set(Horace(Yes()), Empty()));
  add(yesPizza, Set(Kat(Yes()), Empty()));
  add(yesPizza, Set(Franz(Yes()), Empty()));
  ThresholdSet<VoteSet*> *t = thresholdSet(D, 2){yesPizza, noPizza};\
  show(t);

  ActivationSet<VoteSet*>* getPiz = NULL;
  int putResult = 1; 
  while (getPiz == NULL && putResult) {

    Vote* vote;

    spawn vote = getVoteFromUser();
    sync;
    if (vote != NULL) {
      putResult = put(votes, Set(vote, Empty()));
      if (putResult) {
        getPiz = get(votes, t);
      }
    }
  }

  int result;
  if (getPiz == noPizza) {
    result = 0;
  }
  else if (getPiz == yesPizza) {
    result = 1;
  }
  else if (!putResult) {
    result = -1;
    printf("You can't vote two different ways!\n");
  }
  else {
    result = -1;
  }

  free(votes);
  freeSet(noPizza);
  freeSet(yesPizza);
  freeSet(t);
  free(D);
  cilk return result;
}

cilk int main(int argc, char **argv) {
  int result;
  spawn result = getPizza();
  sync;
  if (result == 1) {
    printf("Get pizza! At least one person will eat some.\n");
    cilk return 1;
  }
  if (result == 0) {
    printf("Don't get pizza. Nobody will eat any.\n");
    cilk return 0;
  }
  printf("Error!\n");
  cilk return -1;
}
