#include "stdfuck.h"

// TEST:{ "name": "icmp_lt_eq_gt_ne", "output": "eLG,lnL,lnL,lnL,lnL,lnL,lnL,lnL,lnL,lnL,lnL,lnL,lnL,lnL,lnL,lnL,lnL,lnL,lnL,lnL,ngG,eLG,lnL,lnL,lnL,lnL,lnL,lnL,lnL,lnL,lnL,lnL,lnL,lnL,lnL,lnL,lnL,lnL,lnL,lnL,ngG,ngG,eLG,lnL,lnL,lnL,lnL,lnL,lnL,lnL,lnL,lnL,lnL,lnL,lnL,lnL,lnL,lnL,lnL,lnL,ngG,ngG,ngG,eLG,lnL,lnL,lnL,lnL,lnL,lnL,lnL,lnL,lnL,lnL,lnL,lnL,lnL,lnL,lnL,lnL,ngG,ngG,ngG,ngG,eLG,lnL,lnL,lnL,lnL,lnL,lnL,lnL,lnL,lnL,lnL,lnL,lnL,lnL,lnL,lnL,ngG,ngG,ngG,ngG,ngG,eLG,lnL,lnL,lnL,lnL,lnL,lnL,lnL,lnL,lnL,lnL,lnL,lnL,lnL,lnL,ngG,ngG,ngG,ngG,ngG,ngG,eLG,lnL,lnL,lnL,lnL,lnL,lnL,lnL,lnL,lnL,lnL,lnL,lnL,lnL,ngG,ngG,ngG,ngG,ngG,ngG,ngG,eLG,lnL,lnL,lnL,lnL,lnL,lnL,lnL,lnL,lnL,lnL,lnL,lnL,ngG,ngG,ngG,ngG,ngG,ngG,ngG,ngG,eLG,lnL,lnL,lnL,lnL,lnL,lnL,lnL,lnL,lnL,lnL,lnL,ngG,ngG,ngG,ngG,ngG,ngG,ngG,ngG,ngG,eLG,lnL,lnL,lnL,lnL,lnL,lnL,lnL,lnL,lnL,lnL,ngG,ngG,ngG,ngG,ngG,ngG,ngG,ngG,ngG,ngG,eLG,lnL,lnL,lnL,lnL,lnL,lnL,lnL,lnL,lnL,ngG,ngG,ngG,ngG,ngG,ngG,ngG,ngG,ngG,ngG,ngG,eLG,lnL,lnL,lnL,lnL,lnL,lnL,lnL,lnL,ngG,ngG,ngG,ngG,ngG,ngG,ngG,ngG,ngG,ngG,ngG,ngG,eLG,lnL,lnL,lnL,lnL,lnL,lnL,lnL,ngG,ngG,ngG,ngG,ngG,ngG,ngG,ngG,ngG,ngG,ngG,ngG,ngG,eLG,lnL,lnL,lnL,lnL,lnL,lnL,ngG,ngG,ngG,ngG,ngG,ngG,ngG,ngG,ngG,ngG,ngG,ngG,ngG,ngG,eLG,lnL,lnL,lnL,lnL,lnL,ngG,ngG,ngG,ngG,ngG,ngG,ngG,ngG,ngG,ngG,ngG,ngG,ngG,ngG,ngG,eLG,lnL,lnL,lnL,lnL,ngG,ngG,ngG,ngG,ngG,ngG,ngG,ngG,ngG,ngG,ngG,ngG,ngG,ngG,ngG,ngG,eLG,lnL,lnL,lnL,ngG,ngG,ngG,ngG,ngG,ngG,ngG,ngG,ngG,ngG,ngG,ngG,ngG,ngG,ngG,ngG,ngG,eLG,lnL,lnL,ngG,ngG,ngG,ngG,ngG,ngG,ngG,ngG,ngG,ngG,ngG,ngG,ngG,ngG,ngG,ngG,ngG,ngG,eLG,lnL,ngG,ngG,ngG,ngG,ngG,ngG,ngG,ngG,ngG,ngG,ngG,ngG,ngG,ngG,ngG,ngG,ngG,ngG,ngG,eLG," }
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

      if (i <= j) {
        putchar('L');
      }

      if (i >= j) {
        putchar('G');
      }

      putchar(',');
    }
  }
};
