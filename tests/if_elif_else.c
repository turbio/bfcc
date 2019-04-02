#include "stdfuck.h"

// TEST:{ "func": "main", "output": "y" }
int main() {
  int a = 'b';
  if (a == 'a') {
    putc('x');
  } else if (a == 'b') {
    putc('y');
  } else {
    putc('z');
  }
};
