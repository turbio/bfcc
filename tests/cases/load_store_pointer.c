#include "stdfuck.h"

// TEST:{ "skip": true, "name": "load store pointer", "output": "" }
void main(void) {
  int a;

  putchar(&a);

  // int *p = &a;

  //*p = 'P';

  // putchar(a);
};
