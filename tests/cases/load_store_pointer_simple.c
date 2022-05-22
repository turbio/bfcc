#include "stdfuck.h"

// TEST:{ "name": "load store pointer simple", "output": "p" }
void main(void) {
  int a = 'p';

  int ptr = (int)&a;

  putchar(*(int*)ptr);
};
