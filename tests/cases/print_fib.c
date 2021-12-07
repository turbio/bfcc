#include "stdfuck.h"

void printi(int n) {
  // not working with a lot of ops here
  int d;
  do {
    d = 0;
    while (n > 10) {
      n -= 10;
      d++;
    }

    putchar('0' + n);
    n = d;
  } while (d);
}

// yep they're reversed lol
// TEST:{ "name": "print fib loop", "output": "1 1 2 3 5 8 31 12 43 55" }
int main() {
  uint8_t at = 1;
  uint8_t last = 0;

  int n = 10;

  for (uint8_t i = 0; i < n; i++) {
    printi(at);

    if (i < n-1 ) {
      putchar(' ');
    }

    uint8_t tmp = last;
    last = at;
    at += tmp;
  }
};
