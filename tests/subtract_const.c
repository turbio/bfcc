#include "stdfuck.h"

// TEST:{ "func": "main", "output": "a" }
int main() {
  int a = 97;
  putc(a - 32);
};
