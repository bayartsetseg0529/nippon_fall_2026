#include <stdio.h>

int main(void) {
    int a = 7;
    int b = 2;
    double x = a / b;
    double y = (double) a / b;
    int z = (int) 9.99;
    int sum = 80 + 90 + 75;

    printf("1. %f\n", x);
    printf("2. %f\n", y);
    printf("3. %d\n", z);
    printf("4. %d\n", sum / 3);
    printf("5. %.2f\n", sum / 3.0);
    printf("6. %d\n", 5 > 3);
    printf("7. %d\n", 10 % 3 == 1);
    printf("8. %d\n", -7 / 2);
    printf("9. %d\n", -7 % 2);
    return 0;
}