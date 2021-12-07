
#include "stdfuck.h"

void add(int a, int b) {
  putchar('A' + a + b);
}

void sub(int a, int b) {
  putchar('A' + a - b);
}

// TEST:{ "name": "icmp_lt_eq_gt_ne", "output": "ABCDEFGHIJKLMNOPBCDEFGHIJKLMNOPQCDEFGHIJKLMNOPQRDEFGHIJKLMNOPQRSEFGHIJKLMNOPQRSTFGHIJKLMNOPQRSTUGHIJKLMNOPQRSTUVHIJKLMNOPQRSTUVWIJKLMNOPQRSTUVWXJKLMNOPQRSTUVWXYKLMNOPQRSTUVWXYZLMNOPQRSTUVWXYZ[MNOPQRSTUVWXYZ[\\NOPQRSTUVWXYZ[\\]OPQRSTUVWXYZ[\\]^PQRSTUVWXYZ[\\]^_A@?>=<;:98765432BA@?>=<;:9876543CBA@?>=<;:987654DCBA@?>=<;:98765EDCBA@?>=<;:9876FEDCBA@?>=<;:987GFEDCBA@?>=<;:98HGFEDCBA@?>=<;:9IHGFEDCBA@?>=<;:JIHGFEDCBA@?>=<;KJIHGFEDCBA@?>=<LKJIHGFEDCBA@?>=MLKJIHGFEDCBA@?>NMLKJIHGFEDCBA@?ONMLKJIHGFEDCBA@PONMLKJIHGFEDCBA" }
void main(void) {
  for (int i = 0; i < 16; i++) {
    for (int j = 0; j < 16; j++) {
      add(i, j);
    }
  }

  for (int i = 0; i < 16; i++) {
    for (int j = 0; j < 16; j++) {
      sub(i, j);
    }
  }
};
