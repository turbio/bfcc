// TEST:{"func":"main","output":"->01<-\n->02<-\n->03<-\n->04<-\n->05<-\n->06<-\n->07<-\n->08<-\n->09<-\n->10<-\n->11<-\n->12<-\n->13<-\n->14<-\n->15<-\n->16<-\n->17<-\n->18<-\n->19<-\n->20<-\n"}
#include <stdio.h>

int main()
{
   char Buf[100];
   int Count;

   for (Count = 1; Count <= 20; Count++)
   {
      sprintf(Buf, "->%02d<-\n", Count);
      printf("%s", Buf);
   }

   return 0;
}

/* vim: set expandtab ts=4 sw=3 sts=3 tw=80 :*/
