#include "lvars.xh"
#include "single_write_int.xh"

int main (int argc, char **argv) {
  Value<int>* v1 = lub_single_write_int(5, 6);
  printf("Expected isTop result: 1, Actual: %d\n", isTop (v1));
  Value<int>* v2 = lub_single_write_int(5, 5);
  printf("Expected isTop result: 0, Actual: %d\n", isTop (v2));
  free(v1);
  free(v2);
}
