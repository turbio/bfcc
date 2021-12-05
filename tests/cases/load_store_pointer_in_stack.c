#include "stdfuck.h"

void another_stack(void) {
  int a = 'p';

  uint8_t addr = &a;

  int *ptr = &a;

  putchar('A' + (addr > 0));

  putchar('A' + ((uint8_t)&a == addr));
  putchar('A' + (&a == (int *)addr));

  int v = *ptr;
  putchar(v);

  *ptr = 'a';

  int v2 = *ptr;
  putchar(v2);
};

// TEST:{ "name": "load store pointer in stack", "output": "BBBpaBBBpa" }
void main(void) {
  int a = 'p';

  uint8_t addr = &a;

  int *ptr = &a;

  putchar('A' + (addr > 0));

  putchar('A' + ((uint8_t)&a == addr));
  putchar('A' + (&a == (int *)addr));

  int v = *ptr;
  putchar(v);

  *ptr = 'a';

  int v2 = *ptr;
  putchar(v2);

  another_stack();
};
