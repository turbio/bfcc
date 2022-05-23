#include "stdfuck.h"

// TEST:{ "name": "bitwise or", "output": "cccef:A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,B,B,D,D,F,F,H,H,J,J,L,L,N,N,P,P,R,R,T,T,C,D,C,D,G,H,G,H,K,L,K,L,O,P,O,P,S,T,S,T,D,D,D,D,H,H,H,H,L,L,L,L,P,P,P,P,T,T,T,T,E,F,G,H,E,F,G,H,M,N,O,P,M,N,O,P,U,V,W,X,F,F,H,H,F,F,H,H,N,N,P,P,N,N,P,P,V,V,X,X,G,H,G,H,G,H,G,H,O,P,O,P,O,P,O,P,W,X,W,X,H,H,H,H,H,H,H,H,P,P,P,P,P,P,P,P,X,X,X,X,I,J,K,L,M,N,O,P,I,J,K,L,M,N,O,P,Y,Z,[,\\,J,J,L,L,N,N,P,P,J,J,L,L,N,N,P,P,Z,Z,\\,\\,K,L,K,L,O,P,O,P,K,L,K,L,O,P,O,P,[,\\,[,\\,L,L,L,L,P,P,P,P,L,L,L,L,P,P,P,P,\\,\\,\\,\\,M,N,O,P,M,N,O,P,M,N,O,P,M,N,O,P,],^,_,`,N,N,P,P,N,N,P,P,N,N,P,P,N,N,P,P,^,^,`,`,O,P,O,P,O,P,O,P,O,P,O,P,O,P,O,P,_,`,_,`,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,`,`,`,`,Q,R,S,T,U,V,W,X,Y,Z,[,\\,],^,_,`,Q,R,S,T,R,R,T,T,V,V,X,X,Z,Z,\\,\\,^,^,`,`,R,R,T,T,S,T,S,T,W,X,W,X,[,\\,[,\\,_,`,_,`,S,T,S,T,T,T,T,T,X,X,X,X,\\,\\,\\,\\,`,`,`,`,T,T,T,T," }
int main() {
  putchar('a' | 'b');
  putchar('c' | 'a');
  putchar('c' | 'b');
  putchar('a' | 'd');
  putchar('b' | 'd');

  putchar(':');

  for (unsigned int i = 0; i < 20; i++) {
    for (unsigned int j = 0; j < 20; j++) {
      putchar('A' + (i|j));

      putchar(',');
    }
  }
};
