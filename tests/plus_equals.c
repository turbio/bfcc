#include "stdfuck.h"

// TEST:{ "func": "main", "output": "a" }
int main() {
  int a = 33;
  a += 32;
  putc(a);
};
