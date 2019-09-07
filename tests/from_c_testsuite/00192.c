// TEST:{"func":"main","output":"1\n2\n3\n4\n5\n6\n7\n8\n9\n10\n"}
#include <stdio.h>

int main()
{
   int Count = 0;

   for (;;)
   {
      Count++;
      printf("%d\n", Count);
      if (Count >= 10)
         break;
   }

   return 0;
}

/* vim: set expandtab ts=4 sw=3 sts=3 tw=80 :*/
