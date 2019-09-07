// TEST:{"func":"main","output":"1\n4\n9\n16\n25\n36\n49\n64\n81\n100\n"}
#include <stdio.h>

int main() 
{
   int Count;
   int Array[10];

   for (Count = 1; Count <= 10; Count++)
   {
      Array[Count-1] = Count * Count;
   }

   for (Count = 0; Count < 10; Count++)
   {
      printf("%d\n", Array[Count]);
   }

   return 0;
}

// vim: set expandtab ts=4 sw=3 sts=3 tw=80 :
