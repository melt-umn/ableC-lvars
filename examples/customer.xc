#include "lvars.xh"
#include <cilk.xh>

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

// ************************ leq ***********************************************

int isInPset(int prod, ProductSet* p) {
  match (p) {
    P_Empty() -> {return 0;}
    P_Set(hd, tl) -> {
      return prod == hd || isInPset(prod, p);
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

int isInCD(Customer* c, CustomerDatabase custs) {
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
    P_Set(hd, tl) -> {return P_Set(hd, copy_products(tl));
  }
}

Customer* copy_customer(Customer* c) {
  match (c) {
    Cust(id, p) -> {return Cust(id, copy_products(p));
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
            return CD_Set(copy_customer(hd), union_customer_database(tl, c2)); 
          }
          // if customer id does exist in c2, take union of prod sets
          match (hd) {
            Cust(id1, prods1) -> {
              match (cust_in_c2) {
                Cust(id2, prods2) -> {
                  //make new cust from union of prod sets
                }
              } 
            }
          }
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

