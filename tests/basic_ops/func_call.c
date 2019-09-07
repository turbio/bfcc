#include "stdfuck.h"

void print_something() {
  putc('h');
  putc('e');
  putc('l');
  putc('l');
  putc('o');
}

// TEST:{ "func": "main", "output": "hello", "input": "" }
int main() { print_something(); };
