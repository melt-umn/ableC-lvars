#include "lvars.xh"
#include <cilk.xh>
#include "max_int.xh"

// Example showing how observable results remain consistent even when puts 
// and gets are scheduled in different orders

cilk int putCilk(Lvar<int>* x, int val, int count);
cilk int putCilk(Lvar<int>* x, int val, int count) { 
  if (count < 1000) {
    int result;
    spawn result = putCilk(x, val, count + 1);
    sync;
    cilk return result;
  }
  put val in x;
  printf("putting %d\n", val);
  cilk return 1;
}

cilk ActivationSet<int> * getCilk(Lvar<int>* x, ThresholdSet<int>* t, int count);
cilk ActivationSet<int> * getCilk(Lvar<int>* x, ThresholdSet<int>* t, int count) {
  if (count < 1000) {
    ActivationSet<int> * result;
    spawn result = getCilk(x, t, count + 1);
    sync;
    cilk return result;
  }
  else {
    printf("getting\n");
    cilk return get x with t;
  }
}

cilk ActivationSet<int> * runPutGet(Lvar<int> *x, ThresholdSet<int>* t) {
  ActivationSet<int> * y;
  int result1, result2;
  spawn y = getCilk(x, t, 0);
  spawn result1 = putCilk(x, 3, 0);
  spawn result2 = putCilk(x, 7, 0);
  sync;
  cilk return y;
}

cilk int main(int argc, char **argv) {

  Lattice<int> * D = lattice_max_int();
  Lvar<int> *x = newLvar D;
  ActivationSet<int> * a1 = activationSet(D){6};
  ThresholdSet<int> * t = thresholdSet(D){a1};
  ActivationSet<int> * result;
  spawn result = runPutGet(x, t);
  sync;
  freeze x;
  printf("Value of x: ");
  display(x);
  printf("\n");
  printf("Result of get(): ");
  display(result);
  printf("\n");

  freeLvar x;
  freeSet a1;
  freeSet t;
  free(D);
  cilk return 1;

}

