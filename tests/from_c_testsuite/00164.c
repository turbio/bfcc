// TEST:{"func":"main","output":"134\n134\n0\n1\n1\n1\n1\n46\n1, 0\n0, 1\n1\n1916\n1916\n64\n4\n"}
#include <stdio.h>

int main()
{
   int a;
   int b;
   int c;
   int d;
   int e;
   int f;
   int x;
   int y;

   a = 12;
   b = 34;
   c = 56;
   d = 78;
   e = 0;
   f = 1;

   printf("%d\n", c + d);
   printf("%d\n", (y = c + d));
   printf("%d\n", e || e && f);
   printf("%d\n", e || f && f);
   printf("%d\n", e && e || f);
   printf("%d\n", e && f || f);
   printf("%d\n", a && f | f);
   printf("%d\n", a | b ^ c & d);
   printf("%d, %d\n", a == a, a == b);
   printf("%d, %d\n", a != a, a != b);
   printf("%d\n", a != b && c != d);
   printf("%d\n", a + b * c / f);
   printf("%d\n", a + b * c / f);
   printf("%d\n", (4 << 4));
   printf("%d\n", (64 >> 4));

   return 0;
}

// vim: set expandtab ts=4 sw=3 sts=3 tw=80 :
