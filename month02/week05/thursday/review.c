//Sergeeh 01 Sondgoi toonuudiin nillber
#include<stdio.h>
int sum_odd_to(int n){
    int sum=0;
    for(int i=1; i <=n; i +=2){
        sum +=i;
    }
    return sum;
}
//sergeeh02 Palindrom too 
/* Тоог урвуулах функц (reverse_number) */
int reverse_number(int n) {
    int rev = 0;
    while (n > 0) {
        rev = rev * 10 + (n % 10);
        n /= 10;
    }
    return rev;
}
int is_palindrome_number(int n){
    if(n<0) return 0;
    if(n ==reverse_number(n)){
        return 1;
    }
    else{
        return 0;
    }
    
}
//sergeeh 03 Hamgiin baga erunhii huwaagch
int gcd(int a, int b) {
    while (b != 0) {
        int temp = b;
        b = a % b;
        a = temp;
    }
    return a;
}
int lcm(int a, int b) {
    if (a == 0 || b == 0) return 0;
    return (a * b) / gcd(a, b);
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
check_int(sum_odd_to(5), 9);
check_int(sum_odd_to(6), 9);
check_int(sum_odd_to(1), 1);
check_int(is_palindrome_number(121), 1);
check_int(is_palindrome_number(123), 0);
check_int(is_palindrome_number(7), 1);
check_int(lcm(4, 6), 12);
check_int(lcm(5, 7), 35);
check_int(lcm(6, 6), 6);
return 0;

}