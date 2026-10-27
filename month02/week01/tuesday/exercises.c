#include <stdio.h>
#include <math.h>
#include <stdbool.h>

double apply_discount(double price, double discount_percent) {
    return price * (1.0 - discount_percent);
}

//ex02
int get_hours(int total_minutes){
    return total_minutes / 60;

}
//ex03
char to_upper_case(char c)   
     {
        return c - 32; 
    }
//ex04
bool is_negative(int number) 
{
    return number < 0;
}

// ex05
bool is_positive_and_even(int number) {
    return (number > 0) && (number % 2 == 0);
}
//06
int round_down_to_ten(int n) {
    return (n / 10) * 10;
}

//ex07
bool at_least_two_positive(int a, int b, int c) {
    return (a > 0 && b > 0) || (a > 0 && c > 0) || (b > 0 && c > 0);
}

/* check_int : бүхэл тоо тэнцүү бол PASS (С-ийн check-expect) */
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
    if (fabs(diff) < 0.001) {
        printf("PASS\n");
    } else {
        printf("FAIL: %f гарсан, %f хүлээсэн\n", actual, expected);
    }
}

int main(void) {
    
    check_double(apply_discount(100.0, 0.15), 85.0);
    check_int(get_hours(135), 2);
    check_int(to_upper_case('g'), 'G');
    check_int(is_negative(-5), true);
    check_int(is_negative(4), false);
    check_int(is_positive_and_even(4), true);
    check_int(is_positive_and_even(-4), false);

    printf("round_down_to_ten(47) -> %d\n", round_down_to_ten(47));   
    printf("round_down_to_ten(129) -> %d\n", round_down_to_ten(129)); 
    printf("at_least_two_positive(2, 3, -1) -> %d\n", at_least_two_positive(2, 3, -1));   
    printf("at_least_two_positive(5, -2, -3) -> %d\n", at_least_two_positive(5, -2, -3));


  
    return 0;
}
