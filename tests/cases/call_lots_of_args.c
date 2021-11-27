#include "stdfuck.h"

void three_args(int b, int c, int d) {
  putchar(b);
  putchar(c);
  putchar(d);
}

void five_args(int a, int b, int c, int d, int e) {
  putchar(a);
  putchar(b);
  putchar(c);
  putchar(d);
  putchar(e);
}

void twelve_args(int a, int b, int c, int d, int e, int f, int g, int h, int i,
                 int j, int k, int l) {
  three_args(a, b, c);
  five_args(d, e, f, g, h);
  putchar(i);
  putchar(j);
  putchar(k);
  putchar(l);
}

// TEST:{ "name": "call_many_args", "output": "OwO\nzaddy\nlmaomydude!?" }
void main(void) {
  three_args('O', 'w', 'O');
  putchar('\n');
  five_args('z', 'a', 'd', 'd', 'y');
  putchar('\n');
  twelve_args('l', 'm', 'a', 'o', 'm', 'y', 'd', 'u', 'd', 'e', '!', '?');
};
