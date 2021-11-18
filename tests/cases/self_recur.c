#include "stdfuck.h"

void lol(int i) {
  putchar('.');
  if (i < 10) {
    lol(i + 1);
  }
}

// TEST:{ "name": "self_recur", "output": "..........." }
void main(void) {
  lol(0);
};
