#include "stdfuck.h"

// TEST:{ "func": "main", "output": "h" }
int main() {
  uint8_t a = 'H';
  putc(a + 0x20);
};
