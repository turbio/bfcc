#include "stdfuck.h"

void deref_int_set(uint8_t p) {
  *(int*)p = 'b';
  putchar(*(int *)p);
}

void deref_int_inc(uint8_t p) {
  *(int*)p += 1;
  putchar(*(int *)p);
}

void deref_int(uint8_t p) {
  putchar(*(int *)p);
}

// TODO
// void deref_pointer(uint8_t *p) { putchar(*p); }

// TEST:{ "name": "load store pointer up stack", "output": "ptrbbtr" }
void main(void) {
  int a = 'p';
  int b = 't';
  int c = 'r';

  deref_int(&a); // p
  deref_int(&b); // t
  deref_int(&c); // r

  deref_int_set(&a); // *a = 'b' // b

  deref_int(&a); // b
  deref_int(&b); // t
  deref_int(&c); // r

  //deref_int_inc(&c); // *c += 1 // s
};
