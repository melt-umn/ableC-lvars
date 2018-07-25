#define DEBUG
#include "lvars.xh"
#include <cilk.xh>

cilk int readFile(FILE* fp) {
  char buff[255];
  int result = fscanf(fp, "%s", &buff);
  while (result != EOF) {
    result = fscanf(fp, "%s", &buff);
  }
  cilk return 1;
}

cilk int main(int argc, char **argv) {
  if (argc < 2) {
    printf("Must supply a valid filename.\n");
    cilk return 0;
  }
  FILE *fp;
  fp = fopen(filename, "r");
  if (fp) {
    int result;
    spawn result = readFile(fp);
    sync;
  }
  fclose(fp);
  cilk return 1;
}
