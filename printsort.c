#include <stdio.h>

void print_sorted();

int main() {

    while (0 == 0) {


        char word_array[20];
        char letter;
        int index = 0;
        int minimum = 256;


        printf("Enter word: ");  /* Reads the string using getchar and while loop */
        letter = getchar();
        while (letter != '\n') {
            word_array[index] = letter;
            index++;
            letter = getchar();
        }
        word_array[index] = '\0';  /* Sets last value as null to know that we are done */


        printf("Original word: %s\n", word_array);
        printf("Alphabetized word: ");

        index = 0;
        while (word_array[index] != '\0') {
            if (word_array[index] < minimum) {
                minimum = word_array[index];
            }
            index++;
        }
        print_sorted(word_array, minimum);
    }
    return 0;

}

void print_sorted(char array[], int min) {

    int i1 = 0;
    int i2 = 0;
    int i3 = 0;
    int ascii;
    int min_ascii = min;
    while (array[i1] != '\0') {
        ascii = 256;
        while (array[i2] != '\0') {
            if (array[i2] < ascii && array[i2] > min_ascii) {
                ascii = array[i2];
            }
            i2++;
        }
        while (array[i3] != '\0') {
            if (array[i3] == min_ascii) {
                printf("%c", array[i3]);
            }
            i3++;
        }
        min_ascii = ascii;
        i1++;
        i2 = 0;
        i3 = 0;
    }
    printf("\n");

}
