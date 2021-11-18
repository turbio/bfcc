#include "stdfuck.h"

void lt(int l, int r) {
  if (l < r) {
    putchar('l');
  } else {
    putchar('g');
  }
}

// TEST:{ "name": "less_than", "output": "l" }
void main(void) {
  lt(1, 2);

  //for (int i = 0; i < 10; i++) {
  //  lt(1, 2);
  //}
};
