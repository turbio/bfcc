#include "stdfuck.h"

// TEST:{ "name": "bitwise", "output": "AAA,BAB,CAC,DAD,EAE,BAB,BBA,DAD,DBC,FAF,CAC,DAD,CCA,DCB,GAG,DAD,DBC,DCB,DDA,HAH,EAE,FAF,GAG,HAH,EEA,"}
void main(void) {
  for (unsigned int i = 0; i < 5; i++) {
    for (unsigned int j = 0; j < 5; j++) {
      putdec(i|j);
      putstr("/");
      putdec(i&j);
      putstr("/");
      putdec(i^j);

      putchar(',');
    }
  }
};
