#define CHECK
#include "lvars.xh"

// Example demonstrating that lvars can be used even without
// fancy user-created data types

// ******************** eq function for our int lattice ***********************

int eqD(double d1, double d2) {
  return d1 < d2 + 0.0001 && d1 > d2 - 0.0001;
}

// ******************** leq function for our lattice ************************

int leq(int n1, int n2) {
  match (n1) {
    0 -> {return 1;}
    100 -> {
      match (n2) {
        100 -> {return 1;}
        _ -> {return 0;}
      }
    }
    v1 -> {
      match (n2) {
        0 -> {return 0;}
        100 -> {return 1;}
        v2 -> {return v1 == v2;}
      }
    }
  }
  return 0;
}

int leqD(double n1, double n2) {
  if (eqD(n1, 0.0)) {
    return 1;
  }
  if (eqD(n1, 100.0)) {
    if (eqD(n2, 100.0)) {
      return 1;
    }
    return 0;
  }
  if (eqD(n2, 0.0)) {
    return 0;
  }
  if (eqD(n2, 100.0)) {
    return 1;
  }
  if (eqD(n1, n2)) {
    return 1;
  }
  return 0;
}

// note that leq is defined as 0 <= d <= d <= 100 (for integer d)

// ******************** lub function for our lattice **************************

int lub(int n1, int n2) {
  match (n1) {
    100 -> {return 100;}
    0 -> {return n2;}
    other1 -> {
      match (n2) {
        100 -> {return 100;}
        0 -> {return n1;}
        other2 -> {
          if (other1 == other2) {
            return other1;
          }
          else {
            return 100;
          }
        }
      }
    }
  }
  return 100;
}


double lubD(double n1, double n2) {
  if (eqD(n1, 0.0)) {
    return n2;
  }
  if (eqD(n1, 100.0)) {
    return 100.0;
  }
  if (eqD(n2, 0.0)) {
    return n1;
  }
  if (eqD(n2, 100.0)) {
    return 100.0;
  }
  if (eqD(n1, n2)) {
    return n1;
  }
  return 100.0;
}

// ************************* display function for our lattice *****************

// note that we still need to include these, since we can't directly pass in
// show() to our lattice constructor

void showInteger(int n) {
  printf("%d", n);
}

void showDouble(double n) {
  printf("%f", n);
}

int main(int argc, char **argv) {

  // *************** Step 1. Set up lattice ***********************************

  Lattice<int> * D = lattice(0, 100, leq, lub, showInteger);
  Lattice<double> * D2 = lattice(0.0, 100.0, leqD, lubD, showDouble);

  // *************** Step 2. Make some lvars **********************************

  Lvar<int> *x = newLvar(D);
  Lvar<double> *y = newLvar(D2);

  // *************** Step 3. Try putting some things in the lvars *************

  int success1 = put(x, 7);
  if (!success1) {
    printf("Int put failed!\n");
    free(x);
    free(y);
    free(D);
    free(D2);
    return 0;
  }

  int success2 = put(y, 1.2345);
  if (!success2) {
    printf("Double put failed!\n");
    free(x);
    free(y);
    free(D);
    free(D2);
    return 0;
  }

  // *************** Step 4. Set up the threshold set(s) **********************

  ActivationSet<int> * a1 = activationSet(D, 2){7};
  ActivationSet<int> * a2 = activationSet(D){8};
  ActivationSet<int> * a3 = activationSet(D){9};// note that this is compatible 
                                                // with a2, so will be rejected
  ThresholdSet<int> *t = thresholdSet(D, 2);
  add(t, a1);
  add(t, a2);
  add(t, a3); // can add to threshold set with add() or
              // {} notation

  // try to add activation set from another lattice to a threshold set
  ActivationSet<double> * a4 = activationSet(D2){8.5};
  ThresholdSet<double> *t2 = thresholdSet(D2, 1){a4};
  printf("Showing a threshold set: ");
  show(t2);
  printf("\nShowing an activation set: ");
  show(a4);
  printf("\n");

  // ****************** Step 5. Attempt to get value(s) of lvar(s) ************

  ActivationSet<int>*  result = get(x, t);

  if (result == a1) {;
    printf("Result: 7\n");
  }
  else if (result == a2) {
    printf("Result: 8\n");
  }
  else if (result == a3) {
    printf("Result: 9\n");
  }
  else {
    printf("Error!\n");
  }

  show(t);
  
  // *********** Step 6. Clean up *********************************************

  free(x);
  free(y);
  freeSet(a1);
  freeSet(a2);
  freeSet(a3);
  freeSet(a4);
  freeSet(t);
  freeSet(t2);
  free(D);
  free(D2);

  return 1;
}
