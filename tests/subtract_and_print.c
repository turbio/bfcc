#include "stdfuck.h"

// TEST:{ "func": "main", "output": "Z" }
int main() {
  int a = 'z';
  int b = 0x20;
  putc(a - b);
};
