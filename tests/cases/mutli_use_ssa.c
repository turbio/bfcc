#include "stdfuck.h"

// TEST:{ "name": "multi use ssa", "output": "C" }
void main(void) {
  // okay yea using c to get specific ir is fucky
  int a = 1;

  putchar('A' + ++a); // 'A' + 2
};
