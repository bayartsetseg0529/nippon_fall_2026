#include<stdio.h>
/* 1 */
int total(int a[], int n) {
    int sum = 0;
    for (int i = 0; i < n; i++) // i = 1 гэснийг i = 0 болгож өөрчилнө
    {
        sum = sum + a[i];
    }
    return sum;
}
/* 2 */
double average(int a[], int n) {
    return (double)total(a, n) / n; // (double) гэж нэмнэ
}
/* 3 */
int max_score(int a[], int n) {
    int m = a[0]; // m = 0 гэсний оронд a[0] болгоно
    for (int i = 0; i < n; i++) {
        if (a[i] > m) {
            m = a[i];
        }
    }
    return m;
}
/* 4 */
int find_index(int a[], int n, int key) {
    for (int i = 0; i < n; i++) {
        if (a[i] == key) {
            return i;
        }
    }
    return -1; // 0 гэсний оронд -1 буцаана
}
void check_int(int actual, int expected) {
    if (actual == expected) {
        printf("PASS\n");
    } else {
        printf("FAIL (expected %d, got %d)\n", expected, actual);
    }
}

void check_double(double actual, double expected) {
    double diff = actual - expected;
    if (diff < 0.001 && diff > -0.001) {
        printf("PASS\n");
    } else {
        printf("FAIL: %f гарсан, %f хүлээсэн\n", actual, expected);
    }
}
int main(void){
    int scores[5] = {70, 82, 95, 63, 88};
    check_int(total(scores, 5), 398); 
    check_double(average(scores, 5), 79.6); 
    int temps[3] = {-5, -2, -9};  
    check_int(max_score(temps, 3), -2);
    check_int(find_index(scores, 5, 50), -1);
    return 0;

}