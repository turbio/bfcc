#include <stdint.h>
#include <stdio.h>
#include <time.h>

#define PROG_LEN 12
#define MEM_LEN 20
#define STEP_MAX 1000

#define INC 1
#define DEC 2
#define RIT 3
#define LEF 4
#define BEG 5
#define END 6

static int exec(uint8_t *mem, int *code);
static void pprnt(int *prog);

static int exec(uint8_t mem[], int code[]) {
  int mp = 0;
  int pc = 0;
  int step = 0;

  int jmptab[PROG_LEN] = {0};

  int bal = 0;

  for (int i = 0; i < PROG_LEN; i++) {
    if (code[i] == BEG) {
      bal++;
      int depth = 0;
      int p = i;
      while (depth > 0 || code[p] != END) {
        if (pc >= PROG_LEN - 1) {
          return -1;
        }
        pc++;

        if (code[pc] == BEG) {
          depth++;
        } else if (code[pc] == END) {
          depth--;
        }
      }

      jmptab[i] = p;
      jmptab[p] = i;
    } else if (code[i] == END) {
      bal--;
    }
  }

  if (bal) {
    return -1;
  }

  while (pc < PROG_LEN && step++ < STEP_MAX) {
    switch (code[pc]) {
    case INC: {
      if (mem[mp] == 255)
        return -1;
      mem[mp]++;
      break;
    }

    case DEC: {
      if (mem[mp] == 0)
        return -1;
      mem[mp]--;
      break;
    }

    case RIT: {
      if (mp == MEM_LEN - 1)
        return -1;
      mp++;
      break;
    }

    case LEF: {
      if (mp == 0)
        return -1;

      mp--;
      break;
    }

    case BEG: {
      if (!mem[mp])
        pc = jmptab[pc];
      break;
    }

    case END: {
      if (mem[mp])
        pc = jmptab[pc];
      break;
    }
    }

    pc++;
  }

  return 0;
}

static void pprnt(int *prog) {
  for (int i = 0; i < PROG_LEN; i++) {
    switch (prog[i]) {
    case INC:
      putchar('+');
      break;
    case DEC:
      putchar('-');
      break;
    case LEF:
      putchar('<');
      break;
    case RIT:
      putchar('>');
      break;
    case BEG:
      putchar('[');
      break;
    case END:
      putchar(']');
      break;
    default:
      putchar(' ');
      break;
    }
  }

  putchar('\n');
}

void dorange(uint64_t from, uint64_t to) {
  long s = time(NULL);

  int code[PROG_LEN] = {0};
  while (from < to) {

    for (int i = 0; i < PROG_LEN; i++) {
      code[i] = (from >> (3 * i)) & 0b111;
    }

    if (from % 100000000 == 0) {
      long elap = time(NULL) - s;
      double opps = ((double)from / (double)elap);
      printf("%lds %0.2lf mops/s %0.2lfs estotl %ld/%ld: ", elap,
             opps / 1000000.0, (double)(to - from) / opps, from, to);
      pprnt(code);
    }

    uint8_t failedslots[MEM_LEN] = {0};

    for (uint8_t l = 0; l < 2; l++) {
      for (uint8_t r = 0; r < 2; r++) {
        uint8_t mem[MEM_LEN] = {0};
        mem[0] = (uint8_t)l;
        mem[1] = (uint8_t)r;

        int res = exec(mem, code);

        if (res < 0)
          goto skippo;

        int ok = 0;
        for (int i = 0; i < MEM_LEN; i++) {
          if (!failedslots[i]) {
            if (!!mem[i] == (r < l)) {
              ok = 1;
            } else {
              failedslots[i] = 1;
            }
          }
        }

        if (!ok) {
          goto skippo;
        }
      }
    }

    printf("found em #%ld: ", from);
    pprnt(code);
    printf("failedslots: ");

    for (int i = 0; i < MEM_LEN; i++) {
      failedslots[i] ? putchar('.') : putchar('x');
    }
    printf("\n");

  skippo:
    from++;
  }
}

int main() {
  uint64_t max = 0;

  for (uint64_t i = 0; i < PROG_LEN; i++) {
    max |= (uint64_t)0b111 << (3 * i);
  }

  dorange(0, max);

  return 0;
}
