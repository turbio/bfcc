#include "stdfuck.h"

// TEST:{ "func": "main", "output": "hey!", "input": "hey!" }
int main() {
  int a;

  while ((a = getc())) {
    putc(a);
  }
};
