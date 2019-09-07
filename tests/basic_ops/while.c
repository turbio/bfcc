#include "stdfuck.h"

// TEST:{ "func": "main", "output": "aaa" }
int main() {
  uint8_t a = 3;
  while (a) {
    putc('a');
    a -= 1;
  }
};
