// TEST:{"func":"main","output":"0: 12\n1: 34\n2: 56\n3: 78\n4: 90\n5: 123\n6: 456\n7: 789\n8: 8642\n9: 9753\n0: 12\n1: 34\n2: 56\n3: 78\n4: 90\n5: 123\n6: 456\n7: 789\n8: 8642\n9: 9753\n"}
#include <stdio.h>

int main()
{
   int Count;

   int Array[10] = { 12, 34, 56, 78, 90, 123, 456, 789, 8642, 9753 };

   for (Count = 0; Count < 10; Count++)
      printf("%d: %d\n", Count, Array[Count]);

   int Array2[10] = { 12, 34, 56, 78, 90, 123, 456, 789, 8642, 9753, };

   for (Count = 0; Count < 10; Count++)
      printf("%d: %d\n", Count, Array2[Count]);


   return 0;
}

/* vim: set expandtab ts=4 sw=3 sts=3 tw=80 :*/
