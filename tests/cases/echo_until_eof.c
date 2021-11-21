#include "stdfuck.h"

// TEST:{ "skip": true, "name": "echo until eof", "output": "hey!", "input": "hey!" }
int main() {
  uint8_t a;

  while ((a = getchar())) {
    putchar(a);
  }
};
