#include "stdfuck.h"

// TEST:{ "func": "main", "output": "q" }
int main() {
  int a = 0x51;
  a += 0x20;
  putc(a);
};
