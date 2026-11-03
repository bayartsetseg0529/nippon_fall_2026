#include <stdio.h>
int count_digits(int n)
{
    int c=1;
    while (n>=10);
    {
        n= n /10;
        c= c+1;
        

    }
}
//Dasgal 3b
// 1. count_digits
#include <stdio.h>
int count_digits(int n)
{
    int c = 1;
    while (n >=10)
    { n = n /10;
        c = c + 1;
        
    }
     return c;
}
// 2. gcd
int gcd(int a, int b){ 
    while (b != 0){
        int r = a % b;
        a = b;
        b = r; 
    }
    return a;
}
// 3. is_perfect
int is_perfect(int n){
    int s = 0;
    for(int d = 1; d < n; d++ ){
        if(n % d == 0){
            s = s + d;
        }
    }
    return s == n;
}
/* check_int : бүхэл тоо тэнцүү бол PASS (C-ийн check-expect) */
void check_int(int actual, int expected) {
    if (actual == expected) {
        printf("PASS\n");
    } else {
        printf("FAIL: %d гарсан, %d хүлээсэн\n", actual, expected);
    }
}

int main (void)
{
    check_int(count_digits(90210), 5);
    check_int(count_digits(7), 1);
    check_int(count_digits(0), 1);
    check_int(gcd(48, 18), 6);
    check_int(gcd(84, 36), 12);
    check_int(gcd(7, 5), 1);
    check_int(is_perfect(6), 1);
    check_int(is_perfect(28), 1);
    check_int(is_perfect(12), 0);
    return 0;

}
>>>>>>> edd85bb23f8e45e36b671815f8a5f63de9f51cce
