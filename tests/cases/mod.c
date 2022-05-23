#include "stdfuck.h"

// TEST:{ "name": "mod", "output": "ABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVAACCBCFCIGECAMLKJIHGFEDCBA[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[["}
void main(void) {
  for (int i = 0; i < 100; i++) {
    putchar('A' + (i % 26));
  }

  for (int i = 1; i < 100; i++) {
    putchar('A' + (26 % i));
  }
};
