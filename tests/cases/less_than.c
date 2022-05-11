#include "stdfuck.h"

void lt(int l, int r) {
  if (l < r) {
    putchar('l');
  } else {
    putchar('r');
  }
}

// infinite loop at step 27531
// TEST:{ "name": "less_than", "output": "lrlrllll\nrlllllllllllllllllllllllllllllrrllllllllllllllllllllllllllllrrrlllllllllllllllllllllllllllrrrrllllllllllllllllllllllllllrrrrrlllllllllllllllllllllllllrrrrrrllllllllllllllllllllllllrrrrrrrlllllllllllllllllllllllrrrrrrrrllllllllllllllllllllllrrrrrrrrrlllllllllllllllllllllrrrrrrrrrrllllllllllllllllllllrrrrrrrrrrrlllllllllllllllllllrrrrrrrrrrrrllllllllllllllllllrrrrrrrrrrrrrlllllllllllllllllrrrrrrrrrrrrrrllllllllllllllllrrrrrrrrrrrrrrrlllllllllllllllrrrrrrrrrrrrrrrrllllllllllllllrrrrrrrrrrrrrrrrrlllllllllllllrrrrrrrrrrrrrrrrrrllllllllllllrrrrrrrrrrrrrrrrrrrlllllllllllrrrrrrrrrrrrrrrrrrrrllllllllllrrrrrrrrrrrrrrrrrrrrrlllllllllrrrrrrrrrrrrrrrrrrrrrrllllllllrrrrrrrrrrrrrrrrrrrrrrrlllllllrrrrrrrrrrrrrrrrrrrrrrrrllllllrrrrrrrrrrrrrrrrrrrrrrrrrlllllrrrrrrrrrrrrrrrrrrrrrrrrrrllllrrrrrrrrrrrrrrrrrrrrrrrrrrrlllrrrrrrrrrrrrrrrrrrrrrrrrrrrrllrrrrrrrrrrrrrrrrrrrrrrrrrrrrrlrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr" }
void main(void) {
  lt(1, 2); // l
  lt(2, 1); // r
  lt(3, 4); // l
  lt(3, 3); // r

  lt(4, 5); // l
  lt(5, 6); // l
  lt(6, 7); // l
  lt(7, 8); // l

  putchar('\n');

  for (int i = 0; i < 30; i++) {
    for (int j = 0; j < 30; j++) {
      lt(i, j);
    }
  }
};
