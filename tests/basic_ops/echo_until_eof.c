#include "stdfuck.h"

// TEST:{ "func": "main", "output": "hey!", "input": "hey!" }
int main() {
  uint8_t a;

  while ((a = getc())) {
    putc(a);
  }
};
