#include "stdfuck.h"

// TEST:{ "func": "main", "output": "b" }
int main() {
  uint8_t a = 'b';
  if (a) {
    putc(a);
  } else {
    putc('n');
  }
};
