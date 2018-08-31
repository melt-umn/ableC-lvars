#include "lvars.xh"
#include <string.h>

// Somewhat contrived example of using LVars to represent mixing paint colors
// Lattices don't have to be made up of simple integers

typedef datatype Color Color;
datatype Color {
  Red();
  Orange();
  Yellow();
  Green();
  Blue();
  Violet();
};

int leqColor(Color* c1, Color* c2) {
  match (c2) {
    Red() -> {
      match (c1) {
        Red() -> {return 1;}
        _ -> {return 0;}
      }
    }
    Blue() -> {
      match (c1) {
        Blue() -> {return 1;}
        _ -> {return 0;}
      }
    }
    Yellow() -> {
      match (c1) {
        Yellow() -> {return 1;}
        _ -> {return 0;}
      }
    }
    Orange() -> {
      match (c1) {
        Red() -> {return 1;}
        Yellow() -> {return 1;}
        Orange() -> {return 1;}
        _ -> {return 0;}
      }
    }
    Green() -> {
      match (c1) {
        Yellow() -> {return 1;}
        Blue() -> {return 1;}
        Green() -> {return 1;}
        _ -> {return 0;}
      }
    }
    Violet() -> {
      match (c1) {
        Red() -> {return 1;}
        Blue() -> {return 1;}
        Violet() -> {return 1;}
        _ -> {return 0;}
      }
    }
  }
}

Value<Color*>* lubColor(Color* c1, Color* c2) {
  match (c1) {
    Red() -> {
      match (c2) {
        Red() -> {return value(Red());}
        Orange() -> {return value(Orange());}
        Yellow() -> {return value(Orange());}
        Green() -> {return Top<Color*>;}
        Blue() -> {return value(Violet());}
        Violet() -> {return value(Violet());}
      }
    }
    Orange() -> {
      match (c2) {
        Red() -> {return value(Orange());}
        Orange() -> {return value(Orange());}
        Yellow() -> {return value(Orange());}
        _ -> {return Top<Color*>;}
      }
    }
    Yellow() -> {
      match (c2) {
        Red() -> {return value(Orange());}
        Orange() -> {return value(Orange());}
        Yellow() -> {return value(Yellow());}
        Green() -> {return value(Green());}
        Blue() -> {return value(Green());}
        _ -> {return Top<Color*>;}
      }
    }
    Green() -> {
      match (c2) {
        Yellow() -> {return value(Green());}
        Green() -> {return value(Green());}
        Blue() -> {return value(Green());}
        _ -> {return Top<Color*>;}
      }
    }
    Blue() -> {
      match (c2) {
        Red() -> {return value(Violet());}
        Yellow() -> {return value(Green());}
        Green() -> {return value(Green());}
        Blue() -> {return value(Blue());}
        Violet() -> {return value(Violet());}
        _ -> {return Top<Color*>;}
      }
    }
    Violet() -> {
      match (c2) {
        Red() -> {return value(Violet());}
        Blue() -> {return value(Violet());}
        Violet() -> {return value(Violet());}
        _ -> {return Top<Color*>;}
      }
    }
  }
}

void displayColor(Color* c) {
  match (c) {
    Red() -> { 
      printf("Red");
    }
    Orange() -> { 
      printf("Orange");
    }
    Yellow() -> { 
      printf("Yellow");
    }
    Green() -> { 
      printf("Green");
    }
    Blue() -> { 
      printf("Blue");
    }
    Violet() -> { 
      printf("Violet");
    }
  }
}

Color* getColor(char* c) {
  if (strcmp("red\0", c) == 0) {
    return Red();
  }
  if (strcmp("orange\0", c) == 0) {
    return Orange();
  }
  if (strcmp("yellow\0", c) == 0) {
    return Yellow();
  }
  if (strcmp("green\0", c) == 0) {
    return Green();
  }
  if (strcmp("blue\0", c) == 0) {
    return Blue();
  }
  if (strcmp("violet\0", c) == 0) {
    return Violet();
  }
  else {
    return NULL;
  }
}

void freeColor(Color* c) {
  free(c);
}

int main(int argc, char **argv) {
  if (argc < 3) {
    printf("Must enter two color names\n"); 
    exit(0);
  }

  else {
    Color* c1 = getColor(argv[1]);
    Color* c2 = getColor(argv[2]);

    if (c1 == NULL || c2 == NULL) {
      exit(0);
    }

    Lattice<Color*> * D = lattice(leqColor, lubColor, 
                                  displayColor, freeColor);
    Lvar<Color*>* x = newLvar D;
    put c1 in x;
    put c2 in x;
    
    ActivationSet<Color*> * a1 = activationSet(D){Red()};
    ActivationSet<Color*> * a2 = activationSet(D){Green()};

    ThresholdSet<Color*> * t = thresholdSet(D){a1, a2};

    ActivationSet<Color*> * result = get x with t;  
    printf("Activation Set Matched: ");
    display(result);
    printf("\n");
    freeze(x);
    printf("Actual value: ");
    displayColor(get x);
    printf("\n");

    freeLvar x;
    freeActSets t;
    freeSet t;
    free(D);  
       
  }
}

