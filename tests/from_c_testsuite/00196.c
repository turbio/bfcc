// TEST:{"func":"main","output":"fred\n0\nfred\njoe\n1\njoe\nfred\n0\njoe\n1\nfred\n0\nfred\njoe\n1\njoe\nfred\n0\njoe\n1\n"}
#include <stdio.h>

int fred()
{
   printf("fred\n");
   return 0;
}

int joe()
{
   printf("joe\n");
   return 1;
}

int main()
{
   printf("%d\n", fred() && joe());
   printf("%d\n", fred() || joe());
   printf("%d\n", joe() && fred());
   printf("%d\n", joe() || fred());
   printf("%d\n", fred() && (1 + joe()));
   printf("%d\n", fred() || (0 + joe()));
   printf("%d\n", joe() && (0 + fred()));
   printf("%d\n", joe() || (1 + fred()));

   return 0;
}

/* vim: set expandtab ts=4 sw=3 sts=3 tw=80 :*/
