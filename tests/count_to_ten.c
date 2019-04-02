#include "stdfuck.h"

// TEST:{ "func": "main", "output": "aaa" }
int main() {
  for (unsigned int c = 9; c; c -= 1) {
    putc('M' + c);
    putc('.');
    putc('0');
    putc('.');
  }
};
