// sergeeh 01 Хоёр квадрат 
#include <stdio.h>
int square_sum(int a, int b) {
    return a * a + b * b;
}
// sergeeh 02 Аравтын цифр
int tens_digit(int n){
    return (n / 10) % 10;
}
// sergeeh 03 Хоёр тооны дундаж
double average2(int a, int b){
    return (a+b) / 2.0;
}
/* check_int : бүхэл тоо тэнцүү бол PASS (C-ийн check-expect) */
void check_int(int actual, int expected) {
    if (actual == expected) {
        printf("PASS\n");
    } else {
        printf("FAIL: %d гарсан, %d хүлээсэн\n", actual, expected);
    }
}
/* check_double : зөрүү 0.001-ээс бага бол PASS (L8: double яг биш) */
void check_double(double actual, double expected) {
    double diff = actual - expected;
    if (diff < 0.001 && diff > -0.001) {
        printf("PASS\n");
    } else {
        printf("FAIL: %f гарсан, %f хүлээсэн\n", actual, expected);
    }
}
int main (void){
    check_int(square_sum(3, 4), 25);
    check_int(square_sum(0, 5), 25);
    check_int(square_sum(-2, 1), 5);
    check_int(tens_digit(1234), 3);
    check_int(tens_digit(57), 5);
    check_int(tens_digit(7), 0);
    check_double(average2(7, 8), 7.5);
    check_double(average2(60, 60), 60.0);
    return 0;

}

