#include "stdfuck.h"

void print_game() {
  putchar('\n');
  putchar(' ');
  for (int i = 0; i < 16-2; i++) putchar('_');
  putchar(' ');
  putchar('\n');

  for (int i = 0; i < 16; i++) {
    putchar('|');
    for (int i = 0; i < 16-2; i++) putchar('.');
    putchar('|');
    putchar('\n');
  }

  putchar('\'');
  for (int i = 0; i < 16-2; i++) putchar('-');
  putchar('\'');
  putchar('\n');
}

// TEST:{ "skip": true, "name": "snake", "output": "abcdef" }
void main(void) {
  print_game();
};
