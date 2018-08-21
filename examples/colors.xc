#include "lvars.xh"
#include <string.h>

typedef datatype Color Color;
datatype Color {
  Red();
  Orange();
  Yellow();
  Green();
  Blue();
  Violet();
  Top();
};

int leqColor(Color* c1, Color* c2) {
  match (c2) {
    Top() -> {return 1;}
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

Color* lubColor(Color* c1, Color* c2) {
  match (c1) {
    Top() -> {return Top();}
    Red() -> {
      match (c2) {
        Red() -> {return Red();}
        Orange() -> {return Orange();}
        Yellow() -> {return Orange();}
        Green() -> {return Top();}
        Blue() -> {return Violet();}
        Violet() -> {return Violet();}
        Top() -> {return Top();}
      }
    }
    Orange() -> {
      match (c2) {
        Red() -> {return Orange();}
        Orange() -> {return Orange();}
        Yellow() -> {return Orange();}
        _ -> {return Top();}
      }
    }
    Yellow() -> {
      match (c2) {
        Red() -> {return Orange();}
        Orange() -> {return Orange();}
        Yellow() -> {return Yellow();}
        Green() -> {return Green();}
        Blue() -> {return Green();}
        _ -> {return Top();}
      }
    }
    Green() -> {
      match (c2) {
        Yellow() -> {return Green();}
        Green() -> {return Green();}
        Blue() -> {return Green();}
        _ -> {return Top();}
      }
    }
    Blue() -> {
      match (c2) {
        Red() -> {return Violet();}
        Yellow() -> {return Green();}
        Green() -> {return Green();}
        Blue() -> {return Blue();}
        Violet() -> {return Violet();}
        _ -> {return Top();}
      }
    }
    Violet() -> {
      match (c2) {
        Red() -> {return Violet();}
        Blue() -> {return Violet();}
        Violet() -> {return Violet();}
        _ -> {return Top();}
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
    Top() -> { 
      printf("Invalid Color");
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
    return Top();
  }
}

void freeColor(Color* c) {
  free(c);
}

int main(int argc, char **argv) {

  if (argc != 3) {
    printf("Must enter two color names\n");
  }

  else {
    Color* c1 = getColor(argv[1]);
    Color* c2 = getColor(argv[2]);

    Lattice<Color*> * D = lattice(Top(), leqColor, lubColor, 
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
    freeLattice D;         
  }
}

