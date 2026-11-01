#include<stdio.h>

/* 1 */
int is_sixty(int s) {
    if (s == 60) { //Ижил эсэхийг шалгах == биш, утга олгох = хэрэглэсэн
        return 1;
    }
    return 0;
}
/* 2 */
int sum_to(int n) {
    int sum = 0;
    for (int i = 1; i <= n; i++) {// i <= n байх ёстой
        sum = sum + i;
    }
    return sum;
}
/* 3 */
double average2(int a, int b) {
    return (a + b) / 2.0; //Бүхэл тоог бүхэл тоонд хувааж байна
}
/* 4 */
int digit_sum(int n) {
    int s = 0;
    while (n > 0) {
       s = s + n % 10;
       n = n / 10; //тоогоо багасгах мөр дутуу!
    }
    return s;
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
int main(void){
    check_int(is_sixty(50), 0);
    check_int(sum_to(4), 10);
    check_double(average2(7, 8), 7.5); 
    check_int(digit_sum(12), 3); 


    return 0;

}
//1.  Үр дүн: FAIL (компилятор дээр warning: using the result of an assignment as a condition without parentheses, gcc анхааруулна).
//2.  Үр дүн: FAIL (FAIL: 6 гарсан, 4-ийг алгасна)
//3.  Үр дүн: FAIL (FAIL: 7 гарсан, 7.5 хүлээсэн)
//4.  Үр дүн: Зогсохгүй гацна (Infinite Loop)
