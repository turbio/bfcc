// TEST:{"func":"main","output":"0\n0\n1\n1\n2\n2\n3\n0\n"}
#include <stdio.h>

int main()
{
   int Count;

   for (Count = 0; Count < 4; Count++)
   {
      printf("%d\n", Count);
      switch (Count)
      {
         case 1:
            printf("%d\n", 1);
            break;

         case 2:
            printf("%d\n", 2);
            break;

         default:
            printf("%d\n", 0);
            break;
      }
   }

   return 0;
}

// vim: set expandtab ts=4 sw=3 sts=3 tw=80 :
