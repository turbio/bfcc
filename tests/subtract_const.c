#include "stdfuck.h"

// TEST:{ "func": "main", "output": "A" }
int main() {
  int a = 0x61;
  putc(a - 0x20);
};
