#include "stdfuck.h"

// TEST:{ "name": "pointer load", "output": "pppp" }
int main() {
  int a = 'p';
  int *b = &a;
  putchar(*b);
  int **c = &b;
  putchar(**c);
  int ***d = &c;
  putchar(***d);
  int ****e = &d;
  putchar(****e);
};
