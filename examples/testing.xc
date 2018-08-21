int main(int argc, char **argv) {
  int val2 = 4;
  int val1 = 3;
  match (val2) {
    1 -> {return 1;}
    _ -> {
      match (val1) {
        0 -> {return 0;}
        _ -> {return 3;}
      }
    }
  }
}
