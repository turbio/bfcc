#include "stdfuck.h"

// TEST:{ "name": "subtract const", "output": "A" }
int main() {
  uint8_t a = 0x61;
  putchar(a - 0x20);
};
