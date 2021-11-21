#include "stdfuck.h"

// TEST:{ "name": "add const", "output": "h" }
int main() {
  uint8_t a = 'H';
  putchar(a + 0x20);
};
