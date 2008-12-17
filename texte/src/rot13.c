#include <stdlib.h>
#include <stdio.h>
/* Pour la fonction strlen */
#include <string.h> 

char rot13(char c) {
    int i;
    /* On ne code que les lettres 
       (minuscules ou majuscules) 
       Les lettres majuscules sont entre 65 et 90, 
       les minuscules entre 97 et 122 */
    if (((c >= 65) && (c <= 90)) ||
        ((c >= 97) && (c <= 122))) {
        /* Si on depasse la lettre Z en additionnant,
           on soustrait pour arriver a la bonne lettre */
        c = (((c >= 65 && c <= 90) && c+13 <= 90) ||
             ((c >= 97 && c <= 122) && c+13 <= 122))
            ? c+13 : c-13; 
    }
    return c;
}

int main(int argc, char **argv) {
    char c;
    /* On lit sur l'entrée standard 
       (caractere par caractere) */
    while ((c = fgetc(stdin)) != EOF) {
        printf("%c", rot13(c));
    }
}

