#include<stdio.h>
int power_loop(int b, int e) 
{ int r = 1; 
    for (int i = 1; i <= e; i++) 
    { r = r * b; } 
    return r;
 }
int power_rec(int b, int e) { if (e == 0)
     { return 1; } 
     else
      { return b * power_rec(b, e - 1); }
     }
/* check_int : бүхэл тоо тэнцүү бол PASS (C-ийн check-expect) */
void check_int(int actual, int expected) {
    if (actual == expected) {
        printf("PASS\n");
    } else {
        printf("FAIL: %d гарсан, %d хүлээсэн\n", actual, expected);
    }
}       
int main (void){
    check_int(power_loop(2, 10), 1024);
    check_int(power_loop(3, 0), 1);
    check_int(power_rec(2, 10), 1024);
    check_int(power_rec(5, 3), 125);
    return 0;

}
    
