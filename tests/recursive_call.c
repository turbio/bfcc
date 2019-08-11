#include "stdfuck.h"

void nth_char(int i) {
  putc('a' + i);
  if (i < 10) {
    nth_char(i + 1);
  }
}

// TEST:{ "func": "main", "output": "hello", "input": "" }
int main() { nth_char(0); };
