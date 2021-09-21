#include "stdfuck.h"

// TEST:{ "func": "main", "output": "Z" }
int main() {
  uint8_t a = 'z';
  uint8_t b = 0x20;
  putc(a - b);
};
