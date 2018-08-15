#define DEBUG
#include "lvars.xh"
#include <cilk.xh>

// ******************** leq function for our lattice ************************

int leqInt(int n1, int n2) {
  if (n1 > 100 || n2 > 100 || n1 < 0 || n2 < 0) {
    exit(0);
  }
  return n1 <= n2;
}

// ******************** lub function for our lattice **************************

int lubInt(int n1, int n2) {
  if (n1 > 100 || n2 > 100 || n1 < 0 || n2 < 0) {
    exit(0);
  }
  if (n1 >= n2) {
    return n1;
  }
  return n2;
}

// ************************* display function for our lattice *****************

void displayInteger(int n) {
  printf("%d", n);
}

cilk int putCilk(Lvar<int>* x, int val, int count);
cilk int putCilk(Lvar<int>* x, int val, int count) { 
  if (count < 1000) {
    int result;
    spawn result = putCilk(x, val, count+1);
    sync;
    cilk return result;
  }
  printf("put\n");
  cilk return put (val) in x;
}

cilk ActivationSet<int> * getCilk(Lvar<int>* x, ThresholdSet<int>* t, int count);
cilk ActivationSet<int> * getCilk(Lvar<int>* x, ThresholdSet<int>* t, int count) {
  if (count < 1000) {
    ActivationSet<int> * result;
    spawn result = getCilk(x, t, count+1);
    sync;
    cilk return result;
  }
  else {
    printf("get\n");
    cilk return get (x) with t;
  }
}
cilk ActivationSet<int> * putGetEx(Lvar<int> *x, ThresholdSet<int>* t) {
  ActivationSet<int> * y;
  int result1, result2;
  for (int i = 0; i < 50; i++) {
    spawn result1 = putCilk(x, 3, 0);
    spawn result2 = putCilk(x, 7, 0);
    spawn y = getCilk(x, t, 0); 
  }
  sync;
  cilk return y;
}

cilk int main(int argc, char **argv) {

  Lattice<int> * D = lattice(100, leqInt, lubInt, displayInteger);
  Lvar<int> *x = newLvar(D);
  ActivationSet<int> * a1 = activationSet(D){6};
  ThresholdSet<int> * t = thresholdSet(D){a1};
  ActivationSet<int> * result;
  spawn result = putGetEx(x, t);
  sync;
  freeze(x);
  printf("Value of x: ");
  display(x);
  printf("\n");
  if (result != NULL) {
    printf("Result of get(): ");
    display(result);
    printf("\n");
  }
  else {
    printf("Result of get(): NULL\n");
  }
  free(D);
  free(x);
  freeSet(a1);
  freeSet(t);
  cilk return 1;

}
