#include "stdfuck.h"

void lt(int l, int r) {
  if (l < r) {
    putchar('l');
  } else {
    putchar('r');
  }
}

// TEST:{ "name": "less_than", "output": "lrlrllll\nrlllllllllllllllllllrrllllllllllllllllllrrrlllllllllllllllllrrrrllllllllllllllllrrrrrlllllllllllllllrrrrrrllllllllllllllrrrrrrrlllllllllllllrrrrrrrrllllllllllllrrrrrrrrrlllllllllllrrrrrrrrrrllllllllllrrrrrrrrrrrlllllllllrrrrrrrrrrrrllllllllrrrrrrrrrrrrrlllllllrrrrrrrrrrrrrrllllllrrrrrrrrrrrrrrrlllllrrrrrrrrrrrrrrrrllllrrrrrrrrrrrrrrrrrlllrrrrrrrrrrrrrrrrrrllrrrrrrrrrrrrrrrrrrrlrrrrrrrrrrrrrrrrrrrr" }
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

  for (int i = 0; i < 20; i++) {
    for (int j = 0; j < 20; j++) {
      lt(i, j);
    }
  }
};
