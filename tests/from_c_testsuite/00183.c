// TEST:{"func":"main","output":"0\n1\n4\n9\n16\n15\n18\n21\n24\n27\n"}
#include <stdio.h>

int main()
{
   int Count;

   for (Count = 0; Count < 10; Count++)
   {
      printf("%d\n", (Count < 5) ? (Count*Count) : (Count * 3));
   }

   return 0;
}

/* vim: set expandtab ts=4 sw=3 sts=3 tw=80 :*/
