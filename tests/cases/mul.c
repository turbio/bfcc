#include "stdfuck.h"

// TEST:{ "name": "mul", "output": "AFKPUZ"}
void main(void) {
  for (int i = 0; i <= 5; i++) {
    putchar('A' + (5*i));
  }
};
