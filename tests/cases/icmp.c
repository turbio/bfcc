#include "stdfuck.h"

// TEST:{ "name": "icmp_lt_eq_gt_ne", "output": "e,ln,ln,ln,ln,ln,ln,ln,ln,ln,ln,ln,ln,ln,ln,ln,ln,ln,ln,ln,ng,e,ln,ln,ln,ln,ln,ln,ln,ln,ln,ln,ln,ln,ln,ln,ln,ln,ln,ln,ng,ng,e,ln,ln,ln,ln,ln,ln,ln,ln,ln,ln,ln,ln,ln,ln,ln,ln,ln,ng,ng,ng,e,ln,ln,ln,ln,ln,ln,ln,ln,ln,ln,ln,ln,ln,ln,ln,ln,ng,ng,ng,ng,e,ln,ln,ln,ln,ln,ln,ln,ln,ln,ln,ln,ln,ln,ln,ln,ng,ng,ng,ng,ng,e,ln,ln,ln,ln,ln,ln,ln,ln,ln,ln,ln,ln,ln,ln,ng,ng,ng,ng,ng,ng,e,ln,ln,ln,ln,ln,ln,ln,ln,ln,ln,ln,ln,ln,ng,ng,ng,ng,ng,ng,ng,e,ln,ln,ln,ln,ln,ln,ln,ln,ln,ln,ln,ln,ng,ng,ng,ng,ng,ng,ng,ng,e,ln,ln,ln,ln,ln,ln,ln,ln,ln,ln,ln,ng,ng,ng,ng,ng,ng,ng,ng,ng,e,ln,ln,ln,ln,ln,ln,ln,ln,ln,ln,ng,ng,ng,ng,ng,ng,ng,ng,ng,ng,e,ln,ln,ln,ln,ln,ln,ln,ln,ln,ng,ng,ng,ng,ng,ng,ng,ng,ng,ng,ng,e,ln,ln,ln,ln,ln,ln,ln,ln,ng,ng,ng,ng,ng,ng,ng,ng,ng,ng,ng,ng,e,ln,ln,ln,ln,ln,ln,ln,ng,ng,ng,ng,ng,ng,ng,ng,ng,ng,ng,ng,ng,e,ln,ln,ln,ln,ln,ln,ng,ng,ng,ng,ng,ng,ng,ng,ng,ng,ng,ng,ng,ng,e,ln,ln,ln,ln,ln,ng,ng,ng,ng,ng,ng,ng,ng,ng,ng,ng,ng,ng,ng,ng,e,ln,ln,ln,ln,ng,ng,ng,ng,ng,ng,ng,ng,ng,ng,ng,ng,ng,ng,ng,ng,e,ln,ln,ln,ng,ng,ng,ng,ng,ng,ng,ng,ng,ng,ng,ng,ng,ng,ng,ng,ng,e,ln,ln,ng,ng,ng,ng,ng,ng,ng,ng,ng,ng,ng,ng,ng,ng,ng,ng,ng,ng,e,ln,ng,ng,ng,ng,ng,ng,ng,ng,ng,ng,ng,ng,ng,ng,ng,ng,ng,ng,ng,e," }
void main(void) {
  for (int i = 0; i < 20; i++) {
    for (int j = 0; j < 20; j++) {
      if (i < j) {
        putchar('l');
      }

      if (i != j) {
        putchar('n');
      }

      if (i == j) {
         putchar('e');
      }

      if (i > j) {
        putchar('g');
      }

      putchar(',');
    }
  }
};
