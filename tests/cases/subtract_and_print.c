#include "stdfuck.h"

// TEST:{ "name": "subtract and print", "output": "Z" }
int main() {
  uint8_t a = 'z';
  uint8_t b = 0x20;
  putchar(a - b);
};
