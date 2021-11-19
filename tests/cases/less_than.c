#include "stdfuck.h"

void lt(int l, int r) {
  if (l < r) {
    putchar('l');
  } else {
    putchar('r');
  }
}

// TEST:{ "name": "less_than", "output": "lrl" }
void main(void) {
  lt(1, 2);
  lt(2, 1);
  lt(3, 4);

  // lt(4, 5);
  // lt(5, 6);
  // lt(6, 7);
  // lt(7, 8);

  //for (int i = 0; i < 10; i++) {
  //  lt(1, 2);
  //}
};
