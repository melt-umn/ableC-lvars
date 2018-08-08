#define DEBUG
#include "lvars.xh"
#include <string.h>

typedef datatype Color Color;
datatype Color {
  Bottom();
  Red();
  RedOrange();
  Orange();
  YellowOrange();
  Yellow();
  YellowGreen();
  Green();
  BlueGreen();
  Blue();
  BlueViolet();
  Violet();
  RedViolet();
  Top();
};

int leqColor(Color* c1, Color* c2) {
  match (c1) {
    Bottom() -> { 
      return 1;
    }
    Red() -> { 
      match (c2) {
        Red() -> {return 1;}
        RedOrange() -> {return 1;}
        RedViolet() -> {return 1;}
        Top() -> {return 1;}
        _ -> {return 0;}
      }
    }
    RedOrange() -> { 
      match (c2) {
        RedOrange() -> {return 1;}
        Top() -> {return 1;}
        _ -> {return 0;}
      }
    }
    Orange() -> { 
      match (c2) {
        Orange() -> {return 1;}
        RedOrange() -> {return 1;}
        YellowOrange() -> {return 1;}
        Top() -> {return 1;}
        _ -> {return 0;}
      }
    }
    YellowOrange() -> { 
      match (c2) {
        YellowOrange() -> {return 1;}
        Top() -> {return 1;}
        _ -> {return 0;}
      }
    }
    Yellow() -> { 
      match (c2) {
        Yellow() -> {return 1;}
        YellowGreen() -> {return 1;}
        YellowOrange() -> {return 1;}
        Top() -> {return 1;}
        _ -> {return 0;}
      }
    }
    YellowGreen() -> { 
      match (c2) {
        YellowGreen() -> {return 1;}
        Top() -> {return 1;}
        _ -> {return 0;}
      }
    }
    Green() -> { 
      match (c2) {
        Green() -> {return 1;}
        BlueGreen() -> {return 1;}
        YellowGreen() -> {return 1;}
        Top() -> {return 1;}
        _ -> {return 0;}
      }
    }
    BlueGreen() -> { 
      match (c2) {
        BlueGreen() -> {return 1;}
        Top() -> {return 1;}
        _ -> {return 0;}
      }
    }
    Blue() -> { 
      match (c2) {
        Blue() -> {return 1;}
        BlueGreen() -> {return 1;}
        BlueViolet() -> {return 1;}
        Top() -> {return 1;}
        _ -> {return 0;}
      }
    }
    BlueViolet() -> { 
      match (c2) {
        BlueViolet() -> {return 1;}
        Top() -> {return 1;}
        _ -> {return 0;}
      }
    }
    Violet() -> { 
      match (c2) {
        Violet() -> {return 1;} 
        BlueViolet() -> {return 1;}
        RedViolet() -> {return 1;}
        Top() -> {return 1;}
        _ -> {return 0;}
      }
    }
    RedViolet() -> { 
      match (c2) {
        RedViolet() -> {return 1;}
        Top() -> {return 1;}
        _ -> {return 0;}
      }
    }
    Top() -> { 
      match (c2) {
        Top() -> {return 1;}
        _ -> {return 0;}
      }
    }
  }
}

Color* lubColor(Color* c1, Color* c2) {
  match (c1) {
    Bottom() -> { 
      return c2;
    }
    Red() -> { 
      match (c2) {
        Bottom() -> {return c1;}
        Red() -> {return c1;}
        RedOrange() -> {return RedOrange();}
        Orange() -> {return RedOrange();}
        Yellow() -> {return Orange();}
        Blue() -> {return Violet();}
        Violet() -> {return RedViolet();}
        RedViolet() -> {return RedViolet();}
        _ -> {return Top();}
      }
    }
    RedOrange() -> { 
      match (c2) {
        RedOrange() -> {return c1;}
        Red() -> {return c1;}
        Orange() -> {return c1;}
        _ -> {return Top();}
      }
    }
    Orange() -> { 
      match (c2) {
        Bottom() -> {return c1;}
        Red() -> {return RedOrange();}
        RedOrange() -> {return RedOrange();}
        Orange() -> {return Orange();}
        YellowOrange() -> {return YellowOrange();}
        Yellow() -> {return YellowOrange();}
        _ -> {return Top();}
      }
    }
    YellowOrange() -> { 
      match (c2) {
        YellowOrange() -> {return c1;}
        Yellow() -> {return c1;}
        Orange() -> {return c1;}
        _ -> {return Top();}
      }
    }
    Yellow() -> { 
      match (c2) {
        Bottom() -> {return c1;}
        Red() -> {return Orange();}
        Orange() -> {return YellowOrange();}
        YellowOrange() -> {return YellowOrange();}
        Yellow() -> {return Yellow();}
        YellowGreen() -> {return YellowGreen();}
        Green() -> {return YellowGreen();}
        Blue() -> {return Green();}
        _ -> {return Top();}
      }
    }
    YellowGreen() -> { 
      match (c2) {
        YellowGreen() -> {return c1;}
        Yellow() -> {return c1;}
        Green() -> {return c1;}
        _ -> {return Top();}
      }
    }
    Green() -> { 
      match (c2) {
        Bottom() -> {return c1;}
        Yellow() -> {return YellowGreen();}
        YellowGreen() -> {return YellowGreen();}
        Green() -> {return Green();}
        BlueGreen() -> {return BlueGreen();}
        Blue() -> {return BlueGreen();}
        _ -> {return Top();}
      }
    }
    BlueGreen() -> { 
      match (c2) {
        BlueGreen() -> {return c1;}
        Blue() -> {return c1;}
        Green() -> {return c1;}
        _ -> {return Top();}
      }
    }
    Blue() -> { 
      match (c2) {
        Bottom() -> {return c1;}
        Red() -> {return Violet();}
        Yellow() -> {return Green();}
        Green() -> {return BlueGreen();}
        BlueGreen() -> {return BlueGreen();}
        Blue() -> {return Blue();}
        BlueViolet() -> {return BlueViolet();}
        Violet() -> {return BlueViolet();}
        _ -> {return Top();}
      }
    }
    BlueViolet() -> { 
      match (c2) {
        BlueViolet() -> {return c1;}
        Blue() -> {return c1;}
        Violet() -> {return c1;}
        _ -> {return Top();}
      }
    }
    Violet() -> { 
      match (c2) {
        Bottom() -> {return c1;}
        Red() -> {return RedViolet();}
        RedViolet() -> {return RedViolet();}
        Blue() -> {return BlueViolet();}
        BlueViolet() -> {return BlueViolet();}
        Violet() -> {return Violet();}
        _ -> {return Top();}
      }
    }
    RedViolet() -> { 
      match (c2) {
        RedViolet() -> {return c1;}
        Red() -> {return c1;}
        Violet() -> {return c1;}
        _ -> {return Top();}
      }
    }
    Top() -> { 
      return Top();
    }
  }
}

void showColor(Color* c) {
  match (c) {
    Bottom() -> { 
      printf("Uncolored");
    }
    Red() -> { 
      printf("Red");
    }
    RedOrange() -> { 
      printf("Red-Orange");
    }
    Orange() -> { 
      printf("Orange");
    }
    YellowOrange() -> { 
      printf("Yellow-Orange");
    }
    Yellow() -> { 
      printf("Yellow");
    }
    YellowGreen() -> { 
      printf("Yellow-Green");
    }
    Green() -> { 
      printf("Green");
    }
    BlueGreen() -> { 
      printf("Blue-Green");
    }
    Blue() -> { 
      printf("Blue");
    }
    BlueViolet() -> { 
      printf("Blue-Violet");
    }
    Violet() -> { 
      printf("Violet");
    }
    RedViolet() -> { 
      printf("Red-Violet");
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

int main(int argc, char **argv) {
  if (argc != 3) {
    printf("Must enter two color names\n");
  }
  else {
    Lattice<Color*> * D = lattice(Bottom(), Top(), leqColor, lubColor, showColor);
    Color* c1 = getColor(argv[1]);
    Color* c2 = getColor(argv[2]);
    Lvar<Color*>* x = newLvar(D);
    put(x, c1);
    put(x, c2);
    ActivationSet<Color*> * orange = activationSet(D){Orange()};     
    ActivationSet<Color*> * green = activationSet(D){Green()};
    ActivationSet<Color*> * violet = activationSet(D){Violet()};
    ThresholdSet<Color*> * t = thresholdSet(D){orange, green, violet};
    ActivationSet<Color*> * result = get(x, t);  
    if (result == NULL) {
      printf("Invalid get.\n");
    }
    else {
      printf("Activation Set Matched: ");
      show(result);
      printf("\n");
      freeze(x);
      printf("Actual value: ");
      show(x);
      printf("\n");
    }
    free(D);
    free(c1);
    free(c2);
    freeSet(orange);
    freeSet(green);
    freeSet(violet); 
    freeSet(t);         
  }
}
