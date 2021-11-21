#include "stdfuck.h"

// TEST:{ "name": "count from 9", "output": "9, 8, 7, 6, 5, 4, 3, 2, 1" }
int main() {
  for (uint8_t i = 9; i; i -= 1) {
    putchar('0' + i);

    if (i != 1) {
      putchar(',');
      putchar(' ');
    }
  }
};
