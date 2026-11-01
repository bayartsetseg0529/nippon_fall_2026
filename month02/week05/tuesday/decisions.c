// 1. is_passing
#include<stdio.h>
int is_passing(double score) {
    if (score >= 60.0) {
        return 1;
    } else {
        return 0;
    }
}
// 2. letter_grade
char letter_grade(double score) {
    if (score >= 90.0) {
        return 'A';
    } else if (score >= 80.0) {
        return 'B';
    } else if (score >= 70.0) { // Хэрэв C үнэлгээ байвал
        return 'C';
    } else if (score >= 60.0) {
        return 'D';
    } else {
        return 'F';
    }
}
// 3. in_range
int in_range(int x, int lo, int hi) {
    if (x >= lo && x <= hi) {
        return 1;
    } else {
        return 0;
    }
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
    check_int(is_passing(60.0), 1);
    check_int(is_passing(59.8), 0);
    check_int(letter_grade(92.6), 'A');
    check_int(letter_grade(86.0), 'B');
    check_int(letter_grade(90.0), 'A');
    check_int(letter_grade(60.0), 'D');
    check_int(letter_grade(51.0), 'F');
    check_int(in_range(5, 1, 10), 1);
    check_int(in_range(10, 1, 10), 1);
    check_int(in_range(11, 1, 10), 0);
    return 0;

}