#include "lvars.xh"
#include <cilk.xh>
#include <string.h>

// Example of LVar representing a database of customers, each with an associated 
// id number and set of product id numbers

// *************** data types set-up ******************************************

typedef datatype ProductSet ProductSet;
datatype ProductSet {
  P_Empty();
  P_Set(int, ProductSet*);
};

typedef datatype Customer Customer;
datatype Customer {
  Cust(int, ProductSet*);
};

typedef datatype CustomerDatabase CustomerDatabase;
datatype CustomerDatabase {
  CD_Empty();
  CD_Set(Customer*, CustomerDatabase*);
};


// ********************************** free ************************************

void free_products(ProductSet* p) {
  match (p) {
    P_Empty() -> {free(p);}
    P_Set(hd, tl) -> {
      free_products(tl);
      free(p);
    }
  }
}

void free_customer(Customer* c) {
  match (c) {
    Cust(id, prods) -> {
      free_products(prods);
      free(c);
    }
  }
}

void free_customer_database(CustomerDatabase* c) {
  match (c) {
    CD_Empty() -> {free(c);}
    CD_Set(hd, tl) -> {
      free_customer(hd);
      free_customer_database(tl);
      free(c);
    }
  }
}

// ************************ leq ***********************************************

int isInPset(int prod, ProductSet* p) {
  match (p) {
    P_Empty() -> {return 0;}
    P_Set(hd, tl) -> {
      return prod == hd || isInPset(prod, tl);
    }
  }
}

int leq_product_set(ProductSet* p1, ProductSet* p2) {
  match (p1) {
    P_Empty() -> {return 1;}
    P_Set(hd, tl) -> {
      match (p2) {
        P_Empty() -> {return 0;}
        _ -> {
          return isInPset(hd, p2) && leq_product_set(tl, p2);
        }
      }
    }
  }
}

int leq_customer(Customer* c1, Customer* c2) {
  match (c1) {
    Cust(id1, p1) -> {
      match (c2) {
        Cust(id2, p2) -> {
          return id1 == id2 && leq_product_set(p1, p2);
        }
      }
    }
  }
}

int isInCD(Customer* c, CustomerDatabase* custs) {
  match (custs) {
    CD_Empty() -> {return 0;}
    CD_Set(hd, tl) -> {
      return leq_customer(c, hd) || isInCD(c, tl);
    }
  }
}

int leq_customer_database(CustomerDatabase* c1, CustomerDatabase* c2) {
  match (c1) {
    CD_Empty() -> {return 1;}
    CD_Set(hd1, tl1) -> {
      match (c2) {
        CD_Empty() -> {return 0;}
        _ -> {
          return isInCD(hd1, c2) && leq_customer_database(tl1, c2);
        }
      }
    }
  }
}

// ************************** lub *********************************************

ProductSet* copy_products(ProductSet* p) {
  match (p) {
    P_Empty() -> {return P_Empty();}
    P_Set(hd, tl) -> {return P_Set(hd, copy_products(tl));}
  }
}

Customer* copy_customer(Customer* c) {
  match (c) {
    Cust(id, p) -> {return Cust(id, copy_products(p));}
  }
}

CustomerDatabase* copy_customer_database(CustomerDatabase* c) {
  match (c) {
    CD_Empty() -> {return CD_Empty();}
    CD_Set(hd, tl) -> {return CD_Set(copy_customer(hd), 
                              copy_customer_database(tl));}
  }
}

Customer* find_customer(Customer* c, CustomerDatabase* cs) {
  match (cs) {
    CD_Empty() -> {return NULL;}
    CD_Set(hd, tl) -> {
      match (c) {
        Cust(id1, _) -> {
          match (hd) {
            Cust(id2, _) -> {
              if (id1 == id2) {
                return hd;
              }
              return find_customer(c, tl);
            }
          }
        }
      }
    }
  }
}

ProductSet* union_prods(ProductSet* p1, ProductSet* p2) {
  match (p1) {
    P_Empty() -> {return copy_products(p2);}
    P_Set(hd1, tl1) -> {
      if (isInPset(hd1, p2)) {
        return union_prods(tl1, p2);
      }
      return P_Set(hd1, union_prods(tl1, p2));
    }
  }
}

// note that the customers are assumed to have equal ids at this point

Customer* union_customer(Customer* c1, Customer* c2) {
  match (c1) {
    Cust(id1, prods1) -> {
      match (c2) {
        Cust(_, prods2) -> {
          return Cust(id1, union_prods(prods1, prods2));
        }
      }
    }
  }
}

CustomerDatabase* remove_customer(Customer* c, CustomerDatabase* cs) {
  match (cs) {
    CD_Empty() -> {return cs;}
    CD_Set(hd, tl) -> {
      match (c) {
        Cust(id1, prods1) -> {
          match (hd) {
            Cust(id2, prods2) -> {
              if (id1 == id2) {
                return tl;
              }
              return CD_Set(hd, remove_customer(c, tl));
            }
          }
        }
      }
    }
  }
}

CustomerDatabase* union_customer_database(CustomerDatabase* c1, 
                                          CustomerDatabase* c2) {
  match (c1) {
    CD_Empty() -> {return copy_customer_database(c2);}
    CD_Set(hd, tl) -> {
      match (c2) {
        CD_Empty() -> {return copy_customer_database(c1);}
        _ -> {
          CustomerDatabase* result = union_customer_database(tl, c2);
          if (result == NULL) {
            return NULL;
          }
          Customer* cust_in_c2 = find_customer(hd, c2);
          // if customer id doesn't exist in c2
          if (cust_in_c2 == NULL) {
            return CD_Set(copy_customer(hd), result); 
          }
          // if customer id does exist in c2, take union of prod sets
          Customer* newCust = union_customer(hd, cust_in_c2);
          free_customer_database(result);
          CustomerDatabase* res = CD_Set(newCust, 
                 union_customer_database(tl, 
                 remove_customer(cust_in_c2, c2)));
          return res; 
        }
      }
    }
  }
}

Value<CustomerDatabase*>* lub_customer_database(CustomerDatabase* c1, 
                                                CustomerDatabase* c2) {
  CustomerDatabase* result = union_customer_database(c1, c2);
  if (result == NULL) {
    return Top<CustomerDatabase*>;
  }
  return value result;
}

// ********************************* display **********************************

void display_inner_products(ProductSet* p) {
  match (p) {
    P_Set(hd, tl) -> {
      printf("%d", hd);
      match (tl) {
        P_Set(_, _) -> {
          printf(", ");
          display_inner_products(tl);
        }
      }
    }
  }
}

void display_products(ProductSet* p) {
  printf("{");
  display_inner_products(p);
  printf("}");
}

void display_customer(Customer* c) {
  match (c) {
    Cust(id, prods) -> {
      printf("<id = %d, ", id);
      display_products(prods);
      printf(">");
    }
  }
}

void display_inner_customer_database(CustomerDatabase* c) {
  match (c) {
    CD_Set(hd, tl) -> {
      display_customer(hd);
      match (tl) {
        CD_Set(_, _) -> {
          printf(", ");
          display_inner_customer_database(tl);
        }
      }
    }
  }
}

void display_customer_database(CustomerDatabase* c) {
  printf("{");
  display_inner_customer_database(c);
  printf("}");
}

// **************************** constructor ***********************************

Lattice<CustomerDatabase*>* lattice_customer_database() {
  return lattice(leq_customer_database, lub_customer_database, 
                 display_customer_database, free_customer_database);
}

Lvar<CustomerDatabase*>* data;

// *************************** processing data ********************************

// to read customer-product entries from a file into an array of integer arrays

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

cilk int cilkPut(Lvar<CustomerDatabase*>* l, CustomerDatabase* c) {
  put c in l;
  cilk return 1;
}

cilk int add_data(int** store, int len) {
  Customer* next;
  int result;
  for (int i = 0; i < len; i++) {
    next = Cust(store[i][0], P_Set(store[i][1], P_Empty()));
    spawn result = cilkPut(data, CD_Set(next, CD_Empty()));
  }
  sync;
  cilk return 1;
}

// **************************** user interaction ******************************

int lookupCustomer(int id) {
  Customer* cust_to_find = Cust(id, P_Empty());
  Customer* result = find_customer(cust_to_find, get data);
  if (result == NULL) {
    free_customer(cust_to_find);
    return 0;
  }
  display_customer(result);
  printf("\n");
  free_customer(cust_to_find);
  return 1;
}

int lookupProdSetHelper(ProductSet* p, CustomerDatabase* d) {
  match (d) {
    CD_Empty() -> {return 0;}
    CD_Set(hd, tl) -> {
      match (hd) {
        Cust(id, prods) -> {
          if (leq_product_set(p, prods)) {
            printf("Customer #%d\n", id);
            lookupProdSetHelper(p, tl);
            return 1;
          }
          return lookupProdSetHelper(p, tl);
        }
      }
    }
  }
}

int lookupProdSet(ProductSet* p) {
  return lookupProdSetHelper(p, get data);
}

int userInteraction() {

  // print guide

  printf("Commands:\n");
  printf("  print:          display all customer entries\n");
  printf("  exit:           exit the program\n");
  printf("  display customer <id>:  display the products purchased by a customer \
                                                           with a given id\n");
  printf("  display products <number of products>: <prod 1> <prod 2> ... <prod n>\
     : display the customer ids of those who purchased all listed products\n");
  
  char cmd[128];
  int success;

  while (1) {
    printf(">>> ");                 
    success = fscanf(stdin, "%s", cmd); 

    if (success == EOF) {               
      printf("\n");                  
      break;                         
    }

    if (strcmp("exit", cmd) == 0){     
      printf("\n");
      break;                          
    }

    else if (strcmp("print", cmd) == 0){  
      display data;
    }

    else if (strcmp("display", cmd) == 0){
      fscanf(stdin, " %s", cmd);

      if (strcmp("customer", cmd) == 0) {
        int custID;
        fscanf(stdin, " %d", &custID);
        success = lookupCustomer(custID);
 
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

        success = lookupProdSet(result);

        if (!success) {
          printf("Product Set ");
          display_products(result);
          printf(" not found.\n");
        }
        free_products(result);
      }
    }

    else {                             
      printf("Unknown command. %s\n",cmd);
    }
  }  
  // end main while loop
  return 0;
}

cilk int main(int argc, char **argv) {

  Lattice<CustomerDatabase*>* lat = lattice_customer_database();
  data = newLvar lat;

  int numStore1 = 1000;
  int numStore2 = 1000;
  int numStore3 = 1000;

  int** store1_cs = readStoreData("store1.csv", numStore1);
  int** store2_cs = readStoreData("store2.csv", numStore1);
  int** store3_cs = readStoreData("store3.csv", numStore1);

  int result1, result2, result3;
  spawn result1 = add_data(store1_cs, numStore1);
  spawn result2 = add_data(store2_cs, numStore2);
  spawn result3 = add_data(store3_cs, numStore3);
  sync;

  freeze data;

  userInteraction();

  freeLvar(data);
  free(lat);
  for (int i = 0; i < numStore1; i++) {
    free(store1_cs[i]);
  }
  for (int i = 0; i < numStore2; i++) {
    free(store2_cs[i]);
  }
  for (int i = 0; i < numStore3; i++) {
    free(store3_cs[i]);
  }
  free(store1_cs);
  free(store2_cs);
  free(store3_cs);
  cilk return 1;
}

