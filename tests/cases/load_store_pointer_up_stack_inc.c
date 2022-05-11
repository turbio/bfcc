#include "stdfuck.h"

void deref_int_inc(uint8_t p) {
  *(int*)p += 1;
}

void deref_int_inc2(uint8_t p) {
  *(int*)p = *(int*)p + 1;
}

void deref_int(uint8_t p) {
  putchar(*(int *)p);
}

// TODO
// void deref_pointer(uint8_t *p) {  }

// TEST:{ "name": "load store pointer up stack inc", "output": "ab" }
void main(void) {
  int a = 'a';

  deref_int(&a);
  deref_int_inc(&a); // *c += 1 // s
  deref_int(&a);
};
