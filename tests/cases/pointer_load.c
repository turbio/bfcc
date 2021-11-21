#include "stdfuck.h"

// TEST:{ "skip": true, "name": "pointer load", "output": "pppp" }
int main() {
  int a = 'p';
  int *b = &a;
  putc(*b);
  int **c = &b;
  putc(**c);
  int ***d = &c;
  putc(***d);
  int ****e = &d;
  putc(****e);
};
