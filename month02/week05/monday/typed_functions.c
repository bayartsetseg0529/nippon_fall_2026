#include <stdio.h>
#include <stdbool.h>
#include <math.h>

void check_int(int actual, int expected) {
    if (actual == expected) {
        printf("PASS\n");
    } else {
        printf("FAIL (expected %d, got %d)\n", expected, actual);
    }
}

void check_double(double actual, double expected) {
    if (fabs(actual - expected) < 0.005) {
        printf("PASS\n");
    } else {
        printf("FAIL (expected %.3f, got %.3f)\n", expected, actual);
    }
}

/* 1. to_fahrenheit : double -> double   (F = C * 9 / 5 + 32) */
double to_fahrenheit(double c) {
    return c * 9.0 / 5.0 + 32.0;
}

/* 2. average3 : int int int -> double */
double average3(int a, int b, int c) {
    return (a + b + c) / 3.0;
}

/* 3. hours : int -> int   (minutes -> whole hours) */
int hours(int minutes) {
    return minutes / 60;
}

/* 4. rest_minutes : int -> int   (minutes left after whole hours) */
int rest_minutes(int minutes) {
    return minutes % 60;
}

/* 5. digit_sum3 : int -> int   (3-digit number: 472 -> 4+7+2) */
int digit_sum3(int n) {
    return n / 100 + (n / 10) % 10 + n % 10;
}

/* 6. is_even : int -> bool */
bool is_even(int n) {
    return n % 2 == 0;
}

/* 7. next_letter : char -> char */
char next_letter(char c) {
    return c + 1;
}

/* 8. to_upper : char -> char   (lowercase letter only) */
char to_upper(char c) {
    return c - 'a' + 'A';
}

/* 9. digit_value : char -> int   ('7' -> 7) */
int digit_value(char c) {
    return c - '0';
}

/* 10. circle_area : double -> double */
double circle_area(double r) {
    return 3.14159 * r * r;
}

int main(void) {
    check_double(to_fahrenheit(0), 32.0);
    check_double(to_fahrenheit(100), 212.0);
    check_double(to_fahrenheit(37.5), 99.5);
    check_double(average3(80, 90, 75), 81.667);
    check_double(average3(1, 2, 2), 1.667);
    check_int(hours(135), 2);
    check_int(hours(59), 0);
    check_int(rest_minutes(135), 15);
    check_int(rest_minutes(120), 0);
    check_int(digit_sum3(472), 13);
    check_int(digit_sum3(100), 1);
    check_int(is_even(10), true);
    check_int(is_even(7), false);
    check_int(next_letter('A'), 'B');
    check_int(next_letter('y'), 'z');
    check_int(to_upper('a'), 'A');
    check_int(to_upper('m'), 'M');
    check_int(digit_value('7'), 7);
    check_int(digit_value('0'), 0);
    check_double(circle_area(2), 12.566);
    check_double(circle_area(0), 0.0);
    return 0;
}
