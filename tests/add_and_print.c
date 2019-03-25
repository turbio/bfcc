#include "stdfuck.h"

// TEST:{ "func": "main", "output": "a" }
int main() {
  int a = 65;
  int b = 32;
  putc(a + b);
};
