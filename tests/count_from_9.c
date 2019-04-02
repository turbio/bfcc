#include "stdfuck.h"

// TEST:{ "func": "main", "output": "9, 8, 7, 6, 5, 4, 3, 2, 1" }
int main() {
  for (int i = 9; i; i -= 1) {
    putc('0' + i);

    if (i != 1) {
      putc(',');
      putc(' ');
    }
  }
};
