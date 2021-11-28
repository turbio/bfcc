#include "stdfuck.h"

// void deref_pointer(uint8_t *p) { putchar(*p); }

// TEST:{ "name": "load store pointer", "output": "\u0001\u0001\u0001" }
void main(void) {
  int a;

  uint8_t addr = &a;

  int *ptr = &a;

  putchar(addr > 0);

  putchar((uint8_t)&a == addr);
  putchar(&a == (int *)addr);

  int *ptr2 = (int*)addr;

  // *ptr = 'P';

  // putchar(a);
  // deref_pointer(&a);
  // deref_pointer(ptr);
};
