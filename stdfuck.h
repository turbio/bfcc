#pragma once

#define uint8_t unsigned char

void putchar(uint8_t c);
uint8_t getchar(void);

void putstr(char *s) {
	while(s) {
		putchar(s);
		s++;
	}
}

void putdec(int n) {
  if (!n) {
    putchar('0');
    return;
  }

  int digs = 1;
  while(n / digs > 10) digs *= 10;

  while(digs) {
    putchar('0' + ((n / digs)%10));
    digs /= 10;
  }
}
