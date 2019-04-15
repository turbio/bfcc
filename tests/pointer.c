#include "stdfuck.h"

// TEST:{ "func": "main", "output": "pppp" }
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
