#include "stdfuck.h"

// void deref_pointer(uint8_t *p) { putchar(*p); }

// TEST:{ "name": "load store pointer", "output": "\u0001\u0001\u0001pa" }
void main(void) {
  int a = 'p';

  uint8_t addr = &a;

  int *ptr = &a;

  putchar(addr > 0);

  putchar((uint8_t)&a == addr);
  putchar(&a == (int *)addr);

  int v = *ptr;
  putchar(v);

  *ptr = 'a';

  int v2 = *ptr;
  putchar(v2);
};
