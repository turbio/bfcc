#include "stdfuck.h"

void a(void);
void b(void);
void c(void);

void c(void) {
  putchar('a');
  putchar('b');
  putchar('c');
}

void b(void) {
  for (int i = 0; i < 2; i++) {
    c();
  }
}

void a(void) {
  for (int i = 0; i < 2; i++) {
    b();
  }
}

// TEST:{ "func": "main", "output": "1 1 2 3 5 8" }
void main(void) {
  a();
};
