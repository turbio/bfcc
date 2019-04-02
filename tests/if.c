#include "stdfuck.h"

// TEST:{ "func": "main", "output": "b" }
int main() {
  int a = 'b';
  if (a) {
    putc(a);
  } else {
    putc('n');
  }
};
