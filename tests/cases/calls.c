#include "stdfuck.h"

void a(void);
void b(void);
void c(void);

void c(void) { putchar('.'); }

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

// TEST:{ "name": "calls", "output": "...." }
void main(void) { a(); };
