#include "stdfuck.h"

// TEST:{ "name": "bitwise", "output": ",o,o,oa,"}
void main(void) {
  for (unsigned int i = 0; i <= 1; i++) {
    for (unsigned int j = 0; j <= 1; j++) {
      if (i || j) {
        putchar('o');
      }

      if (i && j) {
        putchar('a');
      }

        putchar(',');
    }
  }

  // for (unsigned int i = 0; i <= 1; i++) {
  //   for (unsigned int j = 0; j <= 1; j++) {
  //     if (i | j) {
  //       putchar('o');
  //     }

  //     if (i & j) {
  //       putchar('a');
  //     }

  //     if (i ^ j) {
  //       putchar('x');
  //     }
  //   }
  // }
};
