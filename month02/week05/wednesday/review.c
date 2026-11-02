// sergeeh 1 count_multiples
#include <stdio.h>
int count_multiples(int n, int k){
    int count = 0;
    for( int i = 1; i<=n; i++){
        if (i%k ==0){
            count++;
        }
    }
    return count;
}
// sergeeh02 toog urwuulah
int reverse_number(int n){
    int reversed =0;
    while(n > 0){
        int last_digit = n % 10;
        reversed = reversed * 10 + last_digit;
        n = n / 10;  
    }
    return reversed;
}
// sergeeh03 gurwiin ih
int max3(int a, int b,int c){
    int max =a;
    if(b > max){
        max = b;
    }
    if(c > max){
        max = c;
    }
    return max;
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
    check_int(count_multiples(10, 3), 3);
    check_int(count_multiples(12, 4), 3);
    check_int(count_multiples(5, 7), 0);
    check_int(reverse_number(1234), 4321);
    check_int(reverse_number(120), 21);
    check_int(reverse_number(7), 7);
    check_int(max3(1, 5, 3), 5);
    check_int(max3(9, 2, 9), 9);
    check_int(max3(-1, -5, -3), -1);
    return 0;
}