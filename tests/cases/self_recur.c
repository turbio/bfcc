#include "stdfuck.h"

void lol(int i) {
  putchar(i + 'a');
  // TODO this can't be too lare or we'll overflow the stack pointer
  if (i < 5) {
    lol(i + 1);
  }
}

// TEST:{ "name": "self_recur", "output": "abcdef" }
void main(void) { lol(0); };
