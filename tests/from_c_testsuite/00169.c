// TEST:{"func":"main","output":"0 0 0\n0 0 1\n0 0 2\n0 1 0\n0 1 1\n0 1 2\n0 2 0\n0 2 1\n0 2 2\n1 0 0\n1 0 1\n1 0 2\n1 1 0\n1 1 1\n1 1 2\n1 2 0\n1 2 1\n1 2 2\n"}
#include <stdio.h>

int main()
{
   int x, y, z;

   for (x = 0; x < 2; x++)
   {
      for (y = 0; y < 3; y++)
      {
         for (z = 0; z < 3; z++)
         {
            printf("%d %d %d\n", x, y, z);
         }
      }
   }

   return 0;
}

/* vim: set expandtab ts=4 sw=3 sts=3 tw=80 :*/
