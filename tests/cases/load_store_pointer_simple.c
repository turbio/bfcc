#include "stdfuck.h"

// TEST:{ "name": "load store pointer simple", "output": "L" }
void main(void) {
  int a = 'p';

  putchar('A' + (int)(&a));

  //int *ptr = &a;

  //putchar(*ptr);
};
