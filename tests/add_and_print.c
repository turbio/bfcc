#include "stdfuck.h"

// TEST:{ "func": "main", "output": "a" }
int main() {
  int a = 0x41; // 'A'
  int b = 0x20; // + 32 = 'a'
  putc(a + b);
};
