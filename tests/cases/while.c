#include "stdfuck.h"

// TEST:{ "name": "while", "output": "aaaaaaaaaa" }
void main() {
  uint8_t a = 10;
  while (a) {
    putchar('a');
    a -= 1;
  }
};
