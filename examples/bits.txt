#define DEBUG
#include "lvars.xh"
#include <cilk.xh>

int ARRSIZE = 15;

int eqArr(int* arr1, int* arr2) {
  if (arr1 == NULL && arr2 == NULL) {
    return 1;
  }
  if (arr1 == NULL || arr2 == NULL) {
    return 0;
  }
  for (int i = 0; i < ARRSIZE; i++) {
    if (arr1[i] != arr2[i]) {
      return 0;
    } 
  }
  return 1;
}

int leqArr(int* arr1, int* arr2) {
  if (arr2 == NULL) {
    return 1;
  }
  if (arr1 == NULL) {
    return 0;
  }
  for (int i = 0; i < ARRSIZE; i++) {
    if (arr1[i] == 1 && arr2[i] == 0) {
      return 0;
    } 
  }
  return 1;
}

string showArr(int* arr) {
  string result = str("[");
  int i = 0;
  for (; i < ARRSIZE - 1; i++) {
    result += show(arr[i]) + ", ";
  }
  return result + show(arr[i]) + "]";
}

int* lubArr(int* arr1, int* arr2) {
  if (arr1 == NULL || arr2 == NULL) {
    return NULL;
  }
  int* newArr = GC_MALLOC(ARRSIZE * sizeof(int));
  for (int i = 0; i < ARRSIZE; i++) {
    newArr[i] = 0;
  }
  for (int i = 0; i < ARRSIZE; i++) {
    if (arr1[i] == 1 || arr2[i] == 1) {
      newArr[i] = 1;
    }
  }
  return newArr;
}

cilk int putOnes(Lvar<int*>* x, int index, ThresholdSet<int*>* t);
cilk int putOnes(Lvar<int*>* x, int index, ThresholdSet<int*>* t) {
  printf("a\n");
  if (index < 0 || index >= ARRSIZE) {
    cilk return 0;
  }
  printf("b\n");
  if (get(x, t) == NULL) {
    printf("c\n");
    int* newArr = GC_MALLOC(sizeof(int)* ARRSIZE);
    printf("d\n");
    for (int i = 0; i < ARRSIZE; i++) {
      newArr[i] = 0;
    }
    printf("e\n");
    newArr[index] = 1;
    printf("f\n");
    put(x, newArr);
    printf("g\n");
    int result1, result2;
    printf("h\n");
    spawn result1 = putOnes(x, index - 2, t);
    printf("i\n");
    spawn result2 = putOnes(x, index - 1, t);
    printf("j\n");
    sync;
    printf("k\n");
    cilk return result1 && result2;
  }
  cilk return 1;
}
        

cilk int main(int argc, char **argv) {
  int* bottom = GC_MALLOC(sizeof(int) * ARRSIZE);
  for (int i = 0; i < ARRSIZE; i++){
    bottom[i] = 0;
  }

  int* top = GC_MALLOC(sizeof(int) * ARRSIZE);
  top = NULL;

  Lattice<int*>* D = lattice(bottom, top, leqArr, lubArr, eqArr, showArr);
  Lvar<int*> * x = newLvar(D);

  int* act1 = GC_MALLOC(ARRSIZE * sizeof(int));
  for (int i = 0; i < ARRSIZE; i++) {
    act1[i] = 1;
  }

  ActivationSet<int*> * a1 = activationSet(D){act1};
  ThresholdSet<int*> * t = thresholdSet(D){a1};

  int result;
  spawn result = putOnes(x, ARRSIZE - 1, t);
  sync;

  if (get(x, t) != NULL){ 
    freeze(x);
    printf("Result is: %s, act set matched: %s\n", show(x).text, show(get(x, t)).text);
  }
  else { 
    printf("Result is NULL\n");
  }
  free(D);
  free(x);
  freeSet(a1);
  freeSet(t);
  cilk return 1;
}
