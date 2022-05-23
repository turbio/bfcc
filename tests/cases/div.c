#include "stdfuck.h"

// TEST:{ "name": "div", "output": "ZMIGFEDDCCCCBBBBBBBBBBBBBAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"}
void main(void) {
  for (int i = 1; i < 60; i++) {
    putchar('A' + (25 / i));
  }
};
