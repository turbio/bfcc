#include "stdfuck.h"

// TEST:{ "func": "main", "output": "1 1 2 3 5 8" }
int main() {
  uint8_t at = 1;
  uint8_t last = 0;

  for (uint8_t i = 6; i; i -= 1) {
    putc('0' + at);

    if (i != 1) {
      putc(' ');
    }

    uint8_t tmp = last;
    last = at;
    at += tmp;
  }
};
