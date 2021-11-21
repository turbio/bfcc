#include "stdfuck.h"

// TEST:{ "skip": true, "name": "plus equals", "output": "q" }
int main() {
  uint8_t a = 0x51;
  a += 0x20;
  putchar(a);
};
