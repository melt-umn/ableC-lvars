#define CHECK
#include "lvars.xh"
#include <cilk.xh>

// ****************** type set up *********************************************

// set up product set type

typedef datatype ProductSet ProductSet;
datatype ProductSet {
  P_Empty();
  P_Set(int, ProductSet*);
};

// set up customer type

typedef datatype Customer Customer;
datatype Customer {
  CustTop();
  // customer id, set of product ids, total product score
  // id of 0 is customer of unknown id
  Person (int, ProductSet*);
  CustBot();
}

// ****************** set up eq for lattice ***********************************

// helper that checks if set1 is a subset of set2

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

// helper that checks if two sets of products are equivalent

int eqProdSets(ProductSet* set1, ProductSet* set2) {
  return isProdSubset(set1, set2) && isProdSubset(set2, set1);
}

// set up eq for customer lattice

int eqCustomer(Customer* c1, Customer* c2) {
  match (c1) {
    CustTop() -> {
      match (c2) {
        CustTop() -> {return 1;}
        _ -> {return 0;}
      }
    }
    CustBot() -> {
      match (c2) {
        CustBot() -> {return 1;}
        _ -> {return 0;}
      }
    }
    Person(name1, prods1) -> {
      match (c2) {
        Person(name2, prods2) -> {
          return name1 == name2 && eqProdSets(prods1, prods2);
        }
        _ -> {return 0;}
      }
    }
  }   
}

// **************** set up leq for lattice ************************************

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

// ************* set up show for customer lattice *****************************

// helper to generate string for product set

string showProducts(ProductSet* p) {
  match (p) {
    P_Empty() -> {return str("");}
    P_Set(hd, tl) -> {
      string result = show(hd);
      match (tl) {
        P_Empty() -> {return result;}
        P_Set(_, _) -> {return result + ", " + showProducts(tl);}
      }
    }
  }
}

string showCustomer(Customer* c) {
  match (c) {
    CustTop() -> {return str("Top()");}
    CustBot() -> {return str("Bot()");}
    Person(name, prods) -> {
      string result = str("Person(") + show(name) + str(", {") +
                      showProducts(prods) + str("})");
      return result;
    }
  }
}

string showCustomerID(Customer* c) {
  match(c) {
    CustTop() -> {return str("Top()");}
    CustBot() -> {return str("Bot()");}
    Person(name, prods) -> {return show(name);}
  }
}

// generate a bunch of customers
// try to sort the customers at the same time as adding products in?
// so only get each customer once they have reached a certain threshold (e.g., certain number of products)
// might want a function to generate a threshold for given customer based on their name? 
// Might have min score for each product, so reached threshold when total score is at or above some amount?

Lattice<Customer*>* lat;

// initialize an array of empty customer lvars

Lvar<Customer*>** initCustomers(int num) {
  Lvar<Customer*>** customers = malloc(num * sizeof(Lvar<Customer*>*));
  for (int i = 0; i < num; i++) {
    customers[i] = newLvar(lat);
  }
  return customers;
}

// read customer-product entries from a file into an array

int** readStoreData(char* filename, int num) {
  FILE *fp = fopen(filename, "r");
  if (fp == NULL) {
    printf("Error reading file!\n");
    exit(0);
  }
  int** customers = malloc(num * sizeof(int*));
  for (int i = 0; i < num; i++) {
    int* data = malloc(2 * sizeof(int));
    fscanf(fp, "%d,%d\n", &data[0], &data[1]);
    customers[i] = data;
  }
  fclose(fp);
  return customers;
}

cilk int cilkPut(Lvar<Customer*>* l, Customer* c) {
  cilk return put(l, c);
} 

// take data from array read in from file and put it into lvars

cilk int addCustData(Lvar<Customer*>** customers, int** store, int custLen, int storeLen) {
  for (int i = 0; i < storeLen; i++) {
    int matchFound = 0;
    for (int j = 0; j < custLen && !matchFound; j++) {
      spawn matchFound = cilkPut(customers[j], Person(store[i][0], P_Set(store[i][1], P_Empty())));
      sync;
    }
    if (!matchFound) {
      printf("No matching customer!\n");
      cilk return 0;
    }
  }
  cilk return 1;
}

// go through and freeze each customer lvar once finished writing

int freezeCustomers(Lvar<Customer*>** customers, int custLen) {
  for (int i = 0; i < custLen; i++) {
    freeze(customers[i]);
  }
  return 1;
}

// intended to be used *after* freezing of all customers, but if not, will simply block

int lookupCustomer(Lvar<Customer*>** customers, int custLen, int cid) {
  ActivationSet<Customer*>* a = activationSet(lat, 1){Person(cid, P_Empty())};
  ThresholdSet<Customer*>* t = thresholdSet(lat, 1){a};
  for (int i = 0; i < custLen; i++) {
    ActivationSet<Customer*>* result = get(customers[i], t);
    if (result != NULL) {
      printf("%s\n", show(customers[i]).text);
      return 1;
    }
  }  
  return 0;
}

int printCustomers(Lvar<Customer*>** customers, int custLen) {
  for (int i = 0; i < custLen; i++) {
    printf("%s\n", showCustomer(freeze(customers[i])).text);
  }
  return 1;
}

// intended to be used *after* freezing of all customers, but if not, will simply block

int lookupProdSet(Lvar<Customer*>** customers, int custLen, ProductSet* prods) {
  ActivationSet<Customer*>* a = activationSet(lat, 1){Person(0, prods)};
  ThresholdSet<Customer*>* t = thresholdSet(lat, 1){a};
  int ret = 0;
  for (int i = 0; i < custLen; i++) {
    ActivationSet<Customer*>* result = get(customers[i], t);
    if (result != NULL) {
      printf("Customer #%s\n", showCustomerID(freeze(customers[i])).text);
      ret = 1;
    }
  } 
  freeSet(a);
  freeSet(t);
  return ret;
}

int userInteraction(Lvar<Customer*>** customers, int custLen) {
  printf("Commands:\n");
  printf("  print:          display all customer entries\n");
  printf("  exit:           exit the program\n");
  printf("  show customer <id>:  display the products purchased by a customer with a given id\n");
  printf("  show products <number of products>: <prod 1> <prod 2> ... <prod n>: display the customer ids of those who purchased all listed products\n");
  
  char cmd[128];
  int success;

  while (1) {

    printf(">>> ");                 // print prompt
    success = fscanf(stdin, "%s", cmd); // read a command
    if (success == EOF) {                 // check for end of input
      printf("\n");                   // found end of input
      break;                          // break from loop
    }

    if (strcmp("exit", cmd) == 0){     // check for exit command
      printf("\n");
      break;                          // break from loop
    }

    else if (strcmp("print", cmd) == 0){   // print command
      printCustomers(customers, custLen);
    }

    else if (strcmp("show", cmd) == 0){
      fscanf(stdin, " %s", cmd);
      if (strcmp("customer", cmd) == 0) {
        int custID;
        fscanf(stdin, " %d", &custID);
        success = lookupCustomer(customers, custLen, custID);
        if (!success) {
          printf("Customer %d not found.\n", custID);
        } 
      }
      else if (strcmp("products", cmd) == 0) {
        int numProds;
        int nextProd;
        ProductSet* result = P_Empty();
        success = fscanf(stdin, " %d:", &numProds);
        for (int i = 0; i < numProds; i++) {
          success = fscanf(stdin, " %d", &nextProd);
          result = P_Set(nextProd, result);
        }
        printf("Looking for matching customers...\n");
        success = lookupProdSet(customers, custLen, result);
        if (!success) {
          printf("Product Set {%s} not found.\n", showProducts(result).text);
        }
      }
    }

    else {                                 // unknown command
      printf("Unknown command. %s\n",cmd);
    }
  }  
  // end main while loop
  return 0;
}

cilk int main(int argc, char **argv) {
  lat = lattice(CustBot(), CustTop(), leqCustomer, lubCustomer, eqCustomer, showCustomer);
  int numCustomers = 50;
  int numStore1 = 2500;
  int numStore2 = 2500;
  int numStore3 = 2500;

  Lvar<Customer*>** customers = initCustomers(numCustomers);
  int** store1_cs = readStoreData("store1.csv", numStore1);
  int** store2_cs = readStoreData("store2.csv", numStore2);
  int** store3_cs = readStoreData("store3.csv", numStore3);

  int result1, result2, result3, result4;

  spawn result1 = addCustData(customers, store1_cs, numCustomers, numStore1);
  spawn result2 = addCustData(customers, store2_cs, numCustomers, numStore2);
  spawn result3 = addCustData(customers, store3_cs, numCustomers, numStore3);
  sync;

  freezeCustomers(customers, numCustomers);

  // loop that allows user to look up a customer, or a customer and a set of products

  userInteraction(customers, numCustomers);

  for (int i = 0; i < numCustomers; i++) {
    free(customers[i]);
  }
  free(customers);

  cilk return 1;
}
