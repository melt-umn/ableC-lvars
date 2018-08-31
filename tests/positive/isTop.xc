#include "lvars.xh"
#include "single_write_int.xh"

int main (int argc, char **argv) {
  printf("Expected isTop result: 1, Actual: %d\n", isTop (lub_single_write_int(5, 6)));
  printf("Expected isTop result: 0, Actual: %d\n", isTop (lub_single_write_int(5, 5)));
}
