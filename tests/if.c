#include "stdfuck.h"

// TEST:{ "func": "main", "output": "b" }
int main() {
  int a = 0x62;
  if (a) {
    putc(a);
  } else {
    putc('n');
  }
};
