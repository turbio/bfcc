#include "stdfuck.h"

// TEST:{ "name": "icmp_lt_eq_gt_ne", "output": "lnlnlnlnlnlnlnlnlnlnlnlnlnlnlnlnlnlnlnnlnlnlnlnlnlnlnlnlnlnlnlnlnlnlnlnlnlnnnlnlnlnlnlnlnlnlnlnlnlnlnlnlnlnlnlnnnnlnlnlnlnlnlnlnlnlnlnlnlnlnlnlnlnnnnnlnlnlnlnlnlnlnlnlnlnlnlnlnlnlnnnnnnlnlnlnlnlnlnlnlnlnlnlnlnlnlnnnnnnnlnlnlnlnlnlnlnlnlnlnlnlnlnnnnnnnnlnlnlnlnlnlnlnlnlnlnlnlnnnnnnnnnlnlnlnlnlnlnlnlnlnlnlnnnnnnnnnnlnlnlnlnlnlnlnlnlnlnnnnnnnnnnnlnlnlnlnlnlnlnlnlnnnnnnnnnnnnlnlnlnlnlnlnlnlnnnnnnnnnnnnnlnlnlnlnlnlnlnnnnnnnnnnnnnnlnlnlnlnlnlnnnnnnnnnnnnnnnlnlnlnlnlnnnnnnnnnnnnnnnnlnlnlnlnnnnnnnnnnnnnnnnnlnlnlnnnnnnnnnnnnnnnnnnlnlnnnnnnnnnnnnnnnnnnnlnnnnnnnnnnnnnnnnnnnn" }
void main(void) {
  for (int i = 0; i < 20; i++) {
    for (int j = 0; j < 20; j++) {
      if (i < j) {
        putchar('l');
      }

      if (i != j) {
        putchar('n');
      }

      // if (i == j) {
      //   putchar('e');
      // }

      // if (i > j) {
      //   putchar('g');
      // }
    }
  }
};
