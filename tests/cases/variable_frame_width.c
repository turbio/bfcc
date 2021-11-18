#include "stdfuck.h"

// void really_thinn(int n);
// void really_thicc(int n);
// 
// void really_thinn(int n) {
//   putchar('n');
//   if (n) {
//     really_thicc(n - 1);
//   }
// 
// }
// 
// void really_thicc(int n) {
//   putchar('c');
//   if (n) {
//     really_thinn(n - 1);
//   }
// }


// TEST:{ "name": "variable_frame_width", "output": "." }
// assuming you compile with -O0 lol
void main(void) {
  //really_thicc(3);
  putchar('.');
};
