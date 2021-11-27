#include "stdfuck.h"

// TEST:{ "name": "icmp with consts", "output": "lnL,lnL,lnL,lnL,lnL,eLG,ngG,ngG,ngG,ngG,ngG,ngG,ngG,ngG,ngG,eLG,lnL,lnL,lnL,lnL," }
void main(void) {
  for (int i = 0; i < 10; i++) {
    if (i < 5) {
      putchar('l');
    }

    if (i != 5) {
      putchar('n');
    }

    if (i == 5) {
       putchar('e');
    }

    if (i > 5) {
      putchar('g');
    }

    if (i <= 5) {
      putchar('L');
    }

    if (i >= 5) {
      putchar('G');
    }

    putchar(',');
  }

  for (int i = 0; i < 10; i++) {
    if (5 < i) {
      putchar('l');
    }

    if (5 != i) {
      putchar('n');
    }

    if (5 == i) {
       putchar('e');
    }

    if (5 > i) {
      putchar('g');
    }

    if (5 <= i) {
      putchar('L');
    }

    if (5 >= i) {
      putchar('G');
    }

    putchar(',');
  }
};
