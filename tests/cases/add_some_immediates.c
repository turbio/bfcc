#include "stdfuck.h"

// TEST:{ "name": "add some immediates", "output": "ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz" }
void main(void) {
  for (uint8_t i = 0; i < 'z' - 'A' + 1; i++) {
    uint8_t b = i + 'A';
    putchar(b);
  }
};
