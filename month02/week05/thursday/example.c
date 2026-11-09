//1. total
#include <stdio.h>

int total(int l[], int size) {
    int sum = 0;
    for (int i = 0; i < size; i++) {
        sum = sum + l[i];
    }
    return sum;
}
// 2. count_passing
int count_passing(int a[], int n) 
{ 
    int c = 0; 
    for (int i = 0; i < n; i++) 
    { 
        if (a[i] >= 60) 
        { c = c + 1; }
     } 
     return c; 
    }
// 3.  max_score
int max_score(int a[], int n) 
{ 
    int m = a[0]; 
    for (int i = 1; i < n; i++) 
    { 
        if (a[i] > m) 
        { m = a[i]; 
        } 
    } 
    return m;
 }
// 4. average
double average(int a[], int n) 
{ 
    return (double) total(a, n) / n; 
}
//Dasgal 4a 1. find_index
int find_index(int a[], int n, int key) 
{ 
    for (int i = 0; i < n; i++) 
    { 
        if (a[i] == key) 
        { return i; 
        } 
    } 
    return -1; 
}
// 2-r alham 1. count_failing
int count_failing(int a[], int n)
 { 
    return n - count_passing(a, n); 
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
int main(void) {
    int scores[5] = {70, 82, 95, 63, 88};
    int mixed[5] = {40, 60, 72, 58, 100};
    
    check_int(total(scores, 5), 398);
    check_int(total(mixed, 5), 330);
    check_int(count_passing(scores, 5), 5);
    check_int(count_passing(mixed, 5), 3);
    check_int(max_score(scores, 5), 95);
    check_int(max_score(mixed, 5), 100);
    check_double(average(scores, 5), 79.6);
    check_double(average(mixed, 5), 66.0);
    check_int(find_index(scores, 5, 95), 2);
    check_int(find_index(scores, 5, 50), -1);
    int dup[3] = {7, 3, 7};
    check_int(find_index(dup, 3, 7), 0);
    check_int(count_failing(scores, 5), 0);
    check_int(count_failing(mixed, 5), 2);
    
    return 0;
}