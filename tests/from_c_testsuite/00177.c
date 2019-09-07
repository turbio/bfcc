// TEST:{"func":"main","output":"1\n8\n64\n1\n14\n16\n64\ntest @\n"}
#include <stdio.h>

int main()
{
   printf("%d\n", '\1');
   printf("%d\n", '\10');
   printf("%d\n", '\100');
   printf("%d\n", '\x01');
   printf("%d\n", '\x0e');
   printf("%d\n", '\x10');
   printf("%d\n", '\x40');
   printf("test \x40\n");

   return 0;
}

/* vim: set expandtab ts=4 sw=3 sts=3 tw=80 :*/
