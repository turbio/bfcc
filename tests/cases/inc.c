#include "stdfuck.h"

// TEST:{ "name": "inc", "output": "b" }
void main(void) {
  uint8_t a = 'a';

  if (1) {
    a++;
  }

  putchar(a);
};
