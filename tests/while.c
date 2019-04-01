#include "stdfuck.h"

// TEST:{ "func": "main", "output": "aaa" }
int main() {
  int a = 3;
  while (a) {
    putc('a');
    a -= 1;
  }
};
