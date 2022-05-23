#include <stdio.h>

const char *preamble =
"#include <stdio.h>\n"
"#include <stdint.h>\n"
"int main(){\n"
"uint8_t mem[1024*10] = {0};\n"
"uint64_t ptr = 0;\n"
"\n";

const char *postamble =
"return 0;\n"
"}\n"
"\n";

int main(int argc, char **argv) {
	puts(preamble);

	int c;
	while((c = getchar()) != EOF) {
		switch(c) {
			case '+':
				puts("mem[ptr]++;");
				break;
			case '-':
				puts("mem[ptr]--;");
				break;
			case '<':
				puts("if(ptr==0) {fputs(\"pointer underflow\", stderr); return 1;}");
				puts("ptr--;");
				break;
			case '>':
				puts("ptr++;");
				break;
			case '.':
				puts("putchar(mem[ptr]);");
				break;
			case ',':
				puts("mem[ptr] = getchar();");
				break;
			case '[':
				puts("while(mem[ptr]){");
				break;
			case ']':
				puts("}");
				break;
		}
	}

	puts(postamble);
}
