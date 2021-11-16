#include "stdfuck.h"

void a(int b, int c, int d) {
  putchar(b);
  putchar(c);
  putchar(d);
}

// TEST:{ "name": "call_args", "output": "123" }
void main(void) {
  a('1', '2', '3');
};
