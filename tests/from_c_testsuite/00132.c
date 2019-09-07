// TEST:{"func":"main","output":"Hello world\nCount = -5\nCount = -4\nCount = -3\nCount = -2\nCount = -1\nCount = 0\nCount = 1\nCount = 2\nCount = 3\nCount = 4\nCount = 5\nString 'hello', 'there' is 'hello', 'there'\nCharacter 'A' is 'A'\nCharacter 'a' is 'a'\n"}
#include <stdio.h>

int main() 
{
   printf("Hello world\n");

   int Count;
   for (Count = -5; Count <= 5; Count++)
      printf("Count = %d\n", Count);

   printf("String 'hello', 'there' is '%s', '%s'\n", "hello", "there");
   printf("Character 'A' is '%c'\n", 65);
   printf("Character 'a' is '%c'\n", 'a');

   return 0;
}

// vim: set expandtab ts=4 sw=3 sts=3 tw=80 :
