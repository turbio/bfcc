#include "stdfuck.h"

// TEST:{ "func": "main", "output": "A" }
int main() {
  uint8_t a = 0x61;
  putc(a - 0x20);
};
