#include "stdfuck.h"

// TEST:{ "func": "main", "output": "h" }
int main() {
  int a = 'H';
  putc(a + 0x20);
};
