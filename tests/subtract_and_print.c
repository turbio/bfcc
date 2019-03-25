#include "stdfuck.h"

// TEST:{ "func": "main", "output": "a" }
int main() {
  int a = 97;
  int b = 32;
  putc(a - b);
};
