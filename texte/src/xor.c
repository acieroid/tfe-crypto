#include <stdlib.h>
#include <stdio.h>

int main(int argc, char **argv) {
  char c, k;
  FILE *f, *kf;

  if (argc != 3) {
    printf("Usage : \n\txor <file> <keyfile>\n");
    return 0;
  }

  f = fopen(argv[1], "rb");
  kf = fopen(argv[2], "rb");
  if (f == NULL || kf == NULL) {
    perror("Error when opening a file");
    return 1;
  }
  while ((c = fgetc(f)) != EOF && (k = fgetc(kf))) {
    if (k == EOF) {
      fseek(kf, 0, SEEK_SET);
      k = fgetc(kf);
    }
    printf("%c", c^k);
  }
  fclose(f);
  fclose(kf);
  return 0;
}

