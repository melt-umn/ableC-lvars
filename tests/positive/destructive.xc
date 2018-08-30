#define CHECK
#include "lvars.xh"

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

// **************************** lub *******************************************

void insert(char c, CharNode* cs) {
  match (cs) {
    C_Null() -> {
      cs = C_Node(c, C_Null(), C_Null());
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
  match (c2) {
    C_Empty() -> {return value c1;}
    C_Set(hd2) -> {
      match (c1) {
        C_Empty() -> {return value c2;}
        C_Set(hd1) -> {
          union_char_set(hd1, hd2);
          return value C_Set(hd1);
        }
      }
    }
  }
}

void display_char_node(CharNode* c) {
  match (c) {
    C_Node(ch, left, right) -> {
      printf("%c", ch);
      match (left) {
        C_Node(_,_,_) -> {printf(", ");}
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

int main (int argc, char **argv) {
  CharSet* c1 = C_Set(C_Node('b', C_Node('a', C_Null(), C_Null()), C_Node('d', C_Node('c', C_Null(), C_Null()), C_Node('e', C_Null(), C_Null()))));
}


