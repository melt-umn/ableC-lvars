#define CHECK
#include "lvars.xh"
#include <cilk.xh>

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
  Leaf(Customer*);
  Bot();
};

// ********************* set up isTop for lattice ********************************

int isTop(CustomerSet* c) {
  match (c) {
    Top() -> {return 1;}
    _ -> {return 0;}
  }
}

// ********************* set up leq for our lattice ***************************

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
    Leaf(cust1) -> {
      match (c2) {
        Top() -> {return 1;}
        Bot() -> {return 0;}
        Leaf(cust2) -> {
          
        }
      }
    }
  }
}

cilk int main(int argc, char **argv) {
  cilk return 1;
}


