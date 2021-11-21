#include "stdfuck.h"

void call_me(int b, int c, int d) {
  putchar(b);
  putchar(c);
  putchar(d);
}

// TEST:{ "name": "call_args", "output": "123" }
void main(void) { call_me('1', '2', '3'); };
