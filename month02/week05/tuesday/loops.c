// 1. count_divisors
#include<stdio.h>
int count_divisors(int n){
    int c = 0;
    for(int d = 1; d <= n; d++){
        if(n % d == 0){
            c = c + 1 ;
        }
    }
    return c;
}
// 2. digit sum
int digit_sum(int n){
    int s=0;
    while (n>0)
   {
    s = s + n % 10;
    n = n / 10;
   } 
return s;
}
// is_prime 
int is_prime(int n) 
{ if (n < 2) 
    { return 0; } 
    int d = 2; 
    while (d * d <= n) 
    { if (n % d == 0) 
        { return 0; } 
        d = d + 1; }
         return 1; 
        }
/* check_int : бүхэл тоо тэнцүү бол PASS (C-ийн check-expect) */
void check_int(int actual, int expected) {
    if (actual == expected) {
        printf("PASS\n");
    } else {
        printf("FAIL: %d гарсан, %d хүлээсэн\n", actual, expected);
    }
}
int main(void){
    check_int(count_divisors(12), 6);
    check_int(count_divisors(28), 6);
    check_int(count_divisors(1), 1);
    check_int(digit_sum(9075), 21);
    check_int(digit_sum(7), 7);
    check_int(digit_sum(0), 0);
    check_int(is_prime(1), 0);
    check_int(is_prime(2), 1);
    check_int(is_prime(21), 0);
    check_int(is_prime(23), 1);
    return 0;

}