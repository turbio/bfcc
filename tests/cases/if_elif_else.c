#include "stdfuck.h"

// TEST:{ "name": "if elif else", "output": "y" }
int main() {
  uint8_t a = 'b';
  if (a == 'a') {
    putchar('x');
  } else if (a == 'b') {
    putchar('y');
  } else {
    putchar('z');
  }
};
