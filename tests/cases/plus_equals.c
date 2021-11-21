#include "stdfuck.h"

// TEST:{ "name": "plus equals", "output": "q" }
int main() {
  uint8_t a = 0x51;
  a += 0x20;
  putchar(a);
};
