#define CHECK
#include "lvars.xh"
#include <cilk.xh>

/*
// **************** type set up ***********************************************

// set up product set type

typedef datatype ProductSet ProductSet;
datatype ProductSet {
  P_Empty();
  P_Set(int, ProductSet*);
};

// set up customer type

typedef datatype Customer Customer;
datatype Customer {
  Person (int, ProductSet*);
}

// set up bit type

typedef datatype Bit Bit;
datatype Bit {
  None();
  Zero();
  One();
}

// set up structure to hold customer entries

typedef datatype CustomerSet CustomerSet;
datatype CustomerSet {
  Top();
  Node(Bit*, CustomerSet*, CustomerSet*);
  Leaf(Bit*, Customer*);
  Bot();
};

// ********************* set up isTop for lattice ********************************

int eqBits(Bit* b1, Bit* b2) {
  match (b1) {
    None() -> {
      match (b2) {
        None() -> {return 1;}
        _ -> {return 0;}
      }
    }
    Zero() -> {
      match (b2) {
        Zero() -> {return 1;} 
        _ -> {return 0;}
      }
    }
    One() -> {
      match (b2) {
        One() -> {return 1;}
        _ -> {return 0;}
      }
    }
  }
}

int isTop(CustomerSet* c) {
  match (c) {
    Top() -> {return 1;}
    _ -> {return 0;}
  }
}

// ********************* set up leq for our lattice ***************************


int isProdSubset(ProductSet* set1, ProductSet* set2) {
  match (set1) {
    P_Empty() -> {return 1;}
    P_Set(hd1, tl1) -> {
      match (set2) {
        P_Empty() -> {return 0;}
        P_Set(hd2, tl2) -> {
          if (hd1 == hd2) {
            return isProdSubset(tl1, tl2);
          }
          return isProdSubset(P_Set(hd1, P_Empty()), tl2) &&
                 isProdSubset(tl1, set2);
        }
      }
    }
  }
}

int leqCustomer(Customer* c1, Customer* c2) {
  match (c1) {
    CustTop() -> {
      match (c2) {
        CustTop() -> {return 1;}
        _ -> {return 0;}
      }
    }
    CustBot() -> {return 1;}
    Person(name1, prods1) -> {
      match (c2) {
        CustTop() -> {return 1;}
        CustBot() -> {return 0;}
        Person(name2, prods2) -> {
          return (name1 == name2 || name1 == 0) && isProdSubset(prods1, prods2);
        }
      }
    }
  }
}

int leq(CustomerSet* c1, CustomerSet* c2) {
  match (c1) {
    Top() -> {
      match (c2) {
        Top() -> {return 1;}
        _ -> {return 0;}
      } 
    }
    Bot() -> {
      return 1;
    }
    Leaf(bit1, cust1) -> {
      match (c2) {
        Top() -> {return 1;}
        Bot() -> {return 0;}
        Leaf(bit2, cust2) -> {
          return eqBits(bit1, bit2) && leqCustomer(cust1, cust2);
        }
      }
    }
    Node(bit1, left1, right1) -> {
      match (c2) {
        Top () -> {return 1;}
        Bot() -> {return 0;}
        Leaf(bit2, cust2) -> {return 0;}
        Node(bit2, left2, right2) -> {
          return eqBits(bit1, bit2) && leq(left1, left2) && leq(right1, right2);
        }
      }
    }
  }
}

// *************** set up lub for lattice *************************************

// helper to return the set union of two product sets

ProductSet* prodSetUnion(ProductSet* prods1, ProductSet* prods2) {
  match (prods1) {
    P_Empty() -> {return prods2;}
    P_Set(hd1, tl1) -> {
      match (prods2) {
        P_Empty() -> {return prods1;}
        P_Set(hd2, tl2) -> {
          ProductSet* partial = prodSetUnion(tl1, prods2);
          if (isProdSubset(P_Set(hd1, P_Empty()), partial)) {
            return partial;
          }
          return P_Set(hd1, partial);
        }
      }
    }
  }
}

Customer* lubCustomer (Customer* c1, Customer* c2) {
  match (c1) {
    CustTop() -> {return c1;}
    CustBot() -> {return c2;}
    Person(name1, prods1) -> {
      match (c2) {
        CustTop() -> {return c2;}
        CustBot() -> {return c1;}
        Person(name2, prods2) -> {
          if (name1 != name2 && name1 != 0 && name2 != 0) {
            return CustTop();
          }
          ProductSet* totalProds = prodSetUnion(prods1, prods2);
          if (name1 == 0) {
            return Person(name2, totalProds);
          }
          return Person(name1, totalProds);  
        }
      }
    } 
  }
}

CustomerSet* lubCustomerSet(CustomerSet* c1, CustomerSet* c2) {
  match (c1) {
    Top() -> {return c1;}
    Bot() -> {return c2;}
    Leaf(bit1, cust1) -> {
      match (c2) {
        Top() -> {return c2;}
        Bot() -> {return c1;}
        Leaf(bit2, cust2) -> {
          if (eqBits(bit1, bit2)) {
            return Leaf(bit1, lubCustomer(cust1, cust2));
          }
          else {
            return Node(None(), c1, c2);
          }
        }
        Node(bit2, left, right) -> {
          if (eqBits(bit1, bit2)) {
            return lubCustomerSet
          }
        }
      }
    }
  }
}
*/
cilk int main(int argc, char **argv) {
  cilk return 1;
}


