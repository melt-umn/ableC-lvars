#define CHECK
#include "lvars.xh"
#include "int_set.xh"

int main (int argc, char **argv) {
  IntSet* i1 = new_intset();
  intset_insert(i1, 2);
  intset_insert(i1, 3);
  intset_insert(i1, 1);

  IntSet* i2 = new_intset();
  intset_insert(i2, 2);
  intset_insert(i2, 5);
  intset_insert(i2, 1);
  intset_insert(i2, 4);
  
  Lattice<IntSet*>* lat = destr_lattice(leq_int_set, lub_int_set, display_int_set);

  Lvar<IntSet*>* l = newLvar lat;
  put (new_intset()) in l;
  printf("Putting ");
  display_int_set(i1);
  put i1 in l;
  printf("\nPutting ");
  display_int_set(i2);
  put i2 in l;
  freeze l;
  printf("\nFinal value: ");
  display l;
  printf("\n");
  IntSet* result = get l;
  delete_intset(result);
  freeLvar l;
  free(lat);

  // and again with makeLvar

  i1 = new_intset();
  intset_insert(i1, 2);
  intset_insert(i1, 3);
  intset_insert(i1, 1);

  i2 = new_intset();
  intset_insert(i2, 2);
  intset_insert(i2, 5);
  intset_insert(i2, 1);
  intset_insert(i2, 4);

  l = destr_makeLvar(leq_int_set, lub_int_set, display_int_set);
  put (new_intset()) in l;
  printf("Putting ");
  display_int_set(i1);
  put i1 in l;
  printf("\nPutting ");
  display_int_set(i2);
  put i2 in l;
  freeze l;
  printf("\nFinal value: ");
  display l;
  printf("\n");
  result = get l;
  delete_intset(result);
  lat = getLattice l;
  freeLvar l;
  free(lat);
}


