#define DEBUG
#include "lvars.xh"
#include <cilk.xh>

// ******************** eq function for our int lattice ***********************

int eqInt(int n1, int n2) {
  if (n1 > 100 || n2 > 100 || n1 < 0 || n2 < 0) {
    exit(0);
  }
  return n1 == n2;
}

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

string showInteger(int n) {
  return show(n);
}

struct putStruct {
  Lvar<int>* x;
  int val;
};

void * putVoid(void* valStruct) {
  struct putStruct * p = (struct putStruct*) valStruct;
  put(p->x, p->val);
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
  cilk return put(x, val);
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
    cilk return get(x, t);
  }
}
cilk ActivationSet<int> * putGetEx(Lvar<int> *x, ThresholdSet<int>* t) {
  ActivationSet<int> * y;
  int result1, result2;
  spawn y = getCilk(x, t, 0);
  spawn result1 = putCilk(x, 3, 0);
  spawn result2 = putCilk(x, 7, 0);
  sync;
  cilk return y;
}

cilk int main(int argc, char **argv) {

  Lattice<int> * D = lattice(0, 100, leqInt, lubInt, eqInt, showInteger);
  Lvar<int> *x = newLvar(D);
  ActivationSet<int> * a1 = activationSet(D){6};
  ThresholdSet<int> * t = thresholdSet(D){a1};
  ActivationSet<int> * result;
  spawn result = putGetEx(x, t);
  sync;
  freeze(x);
  printf("Value of x: %s\n", show(x).text);
  if (result != NULL) {
    printf("Result of get(): %s\n", show(result).text);
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
