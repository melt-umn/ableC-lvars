#define CHECK
#include "lvars.xh"

// Caution: this test has memory leaks, since freeing is not handled in put as 
// in non-destructive lattice

// ************************** type ********************************************

typedef datatype CharNode CharNode;
datatype CharNode {
  C_Node(char, CharNode*, CharNode*);
  C_Null();
}

typedef datatype CharSet CharSet;
datatype CharSet {
  C_Set(CharNode*);
  C_Empty();
} 

// ******************* free ***************************************************

void free_char_node(CharNode* c) {
  match (c) {
    C_Null() -> {free(c);}
    C_Node(ch, left, right) -> {
      free_char_node(left);
      free_char_node(right);
      free(c);
    }
  }
}  

void free_char_set(CharSet* c) {
  match (c) {
    C_Empty() -> {free(c);}
    C_Set(hd) -> {
      free_char_node(hd);
      free(c);
    }
  }
}

// ******************* leq ****************************************************

int isInSet(char c, CharNode* cs) {
  match (cs) {
    C_Null() -> {return 0;}
    C_Node(ch, left, right) -> {
      if (c == ch) {
        return 1;
      }
      if (c > ch) {
        return isInSet(c, right);
      }
      return isInSet(c, left);
    }
  }
}

int subset_char(CharNode* c1, CharNode* c2) {
  match (c1) {
    C_Null() -> {return 1;}
    C_Node(ch1, left, right) -> {
      if (isInSet(ch1, c2)) {
        return subset_char(left, c2) && subset_char(right, c2);
      }
      return 0;
    }
  }
}

int leq_char_set(CharSet* c1, CharSet* c2) {
  match (c1) {
    C_Empty() -> {return 1;}
    C_Set(hd1) -> {
      match (c2) {
        C_Empty() -> {return 0;}
        C_Set(hd2) -> {return subset_char(hd1, hd2);}
      }
    }
  }
}

// ******************************* display ************************************

void display_char_node(CharNode* c) {
  match (c) {
    C_Node(ch, left, right) -> {
      match (left) { 
        C_Null() -> {
          printf("%c", ch);
          match (right) {
            C_Node(_,_,_) -> {
              printf(", ");
              display_char_node(right);
            }
          }
        }
        C_Node(_,_,_) -> {
          display_char_node(left);
          printf(", ");
          printf("%c", ch);
          match (right) {
            C_Node(_,_,_) -> {
              printf(", ");
              display_char_node(right);
            }
          }
        }
      }
    }
  }
}

void display_char_set(CharSet* c) {
  match (c) {
    C_Empty() -> {printf("{}");}
    C_Set(hd) -> {
      printf("{");
      display_char_node(hd);
      printf("}");
    }
  }
}

// **************************** lub *******************************************

void insert(char c, CharNode* cs) {
  match (cs) {
    C_Null() -> {
      *cs = *C_Node(c, C_Null(), C_Null());
    }
    C_Node(ch, left, right) -> {
      if (ch == c) {
        return;
      }
      if (c < ch) {
        insert(c, left);
      }
      else {
        insert(c, right);
      }
    }
  }
}

void union_char_set(CharNode* c1, CharNode* c2) {
  match (c2) {
    C_Node(ch1, left1, right1) -> {
      insert(ch1, c1);
      union_char_set(c1, left1);
      union_char_set(c1, right1);
    }
  }
}

Value<CharSet*>* lub_char_set(CharSet* c1, CharSet* c2) {
  match (c1) {
    C_Empty() -> {
      *c1 = *c2;
      free(c2);
      return value c1;
    }
    C_Set(hd1) -> {
      match (c2) {
        C_Empty() -> {
          free_char_set(c2);
          return value c1;
        }
        C_Set(hd2) -> {
          union_char_set(hd1, hd2);
          free_char_set(c2);
          return value c1;
        }
      }
    }
  }
}

int main (int argc, char **argv) {
  CharSet* c1 = C_Set(C_Node('b', C_Node('a', C_Null(), C_Null()), 
                  C_Node('d', C_Node('c', C_Null(), C_Null()), 
                  C_Node('e', C_Null(), C_Null()))));
  CharSet* c2 = C_Set(C_Node('b', C_Node('a', C_Null(), C_Null()), 
                  C_Node('l', C_Node('c', C_Null(), C_Null()), C_Null()))); 
  CharSet* c3 = C_Set(C_Node('m', C_Node('l', C_Null(), C_Null()), 
                C_Node('o', C_Node('n', C_Null(), C_Null()),C_Null()))); 
  Lattice<CharSet*>* lat = destr_lattice(leq_char_set, lub_char_set, 
                                         display_char_set);
  Lvar<CharSet*>* l = newLvar lat;
  put (C_Empty()) in l;
  printf("Putting ");
  display_char_set(c1);
  put c1 in l;
  printf("\nPutting ");
  display_char_set(c2);
  put c2 in l;
  printf("\nPutting ");
  display_char_set(c3);
  put c3 in l;
  freeze l;
  printf("\nFinal value: ");
  display l;
  printf("\n");
  CharSet* result = get l;
  free_char_set(result);
  freeLvar l;
  free(lat);

  l = destr_makeLvar(leq_char_set, lub_char_set, display_char_set);
  c1 = C_Set(C_Node('b', C_Node('a', C_Null(), C_Null()), C_Node('d', 
         C_Node('c', C_Null(), C_Null()), C_Node('e', C_Null(), C_Null())))); 
  c2 = C_Set(C_Node('b', C_Node('a', C_Null(), C_Null()), C_Node('l', 
         C_Node('c', C_Null(), C_Null()),C_Null()))); 
  c3 = C_Set(C_Node('m', C_Node('l', C_Null(), C_Null()), C_Node('o', 
         C_Node('n', C_Null(), C_Null()),C_Null()))); 
  put (C_Empty()) in l;
  printf("Putting ");
  display_char_set(c1);
  put c1 in l;
  printf("\nPutting ");
  display_char_set(c2);
  put c2 in l;
  printf("\nPutting ");
  display_char_set(c3);
  put c3 in l;
  freeze l;
  printf("\nFinal value: ");
  display l;
  printf("\n");
  result = get l;
  free_char_set(result);
  freeLvar l;
  free(lat);
}


