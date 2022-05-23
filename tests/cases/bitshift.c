#include "stdfuck.h"

// TEST:{ "name": "bitshift", "output": "1,2,4,8,16,32,64,128,128,64,32,16,8,4,2,1,"}
void main(void) {
  for (unsigned int i = 0; i < 8; i++) {
    putdec(1 << i);
    putchar(',');
  }

  for (unsigned int i = 0; i < 8; i++) {
    putdec(128 >> i);
    putchar(',');
  }
};
