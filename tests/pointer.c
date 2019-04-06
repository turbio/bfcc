#include "stdfuck.h"

// TEST:{ "func": "main", "output": "p" }
int main() {
  int a = 12;
  int *b = &a;
  putc(*b);
  /*int **c = &b;*/
  /*int ***d = &c;*/
  /*int ****e = &d;*/
  /*putc(****e);*/
};
