#include "stdfuck.h"

// TEST:{ "name": "if", "output": "b" }
int main() {
  uint8_t a = 'b';
  if (a) {
    putchar(a);
  } else {
    putchar('n');
  }
};
