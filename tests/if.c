#include "stdfuck.h"

// TEST:{ "func": "main", "output": "a" }
int main() {
  int a = 15;
  if (a) {
    putc(a);
  }
};
