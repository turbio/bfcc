#include "stdfuck.h"

// TEST:{ "func": "main", "output": "q" }
int main() {
  uint8_t a = 0x51;
  a += 0x20;
  putc(a);
};
