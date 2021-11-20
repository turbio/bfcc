#include "stdfuck.h"

void lol(int i) {
  putchar(i+'a');
  if (i < 20) {
    lol(i + 1);
  }
}

// TEST:{ "name": "self_recur", "output": "abcdefghijklmnopqrstu" }
void main(void) {
  lol(0);
};
