#include "stdfuck.h"

// TEST:{ "func": "main", "output": "a" }
int main() {
  uint8_t a = 0x41; // 'A'
  uint8_t b = 0x20; // + 32 = 'a'
  putc(a + b);
};
