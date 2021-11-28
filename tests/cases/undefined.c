#include "stdfuck.h"

void f() {
  int i;
  int j;
  int k;
  int l;
  putchar((int)&i);
  putchar((int)&j);
  putchar((int)&k);
}

// TEST:{ "skip": true, "name": "snapshot some undefined behavior", "output": "\u000c\u001c\u001d\u001e" }
int main() {
  int i;
  putchar((int)&i);
  f();
};
