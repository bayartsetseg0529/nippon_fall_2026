// 3-r alham baganan diagram, 4 alham print_report
#include <stdio.h>
int total(int a[], int n) {
    int sum = 0;
    for (int i = 0; i < n; i++) {
        sum = sum + a[i];
    }
    return sum;
}

double average(int a[], int n) {
    return (double)total(a, n) / n;
}

int max_score(int a[], int n) {
    int m = a[0];
    for (int i = 0; i < n; i++) {
        if (a[i] > m) {
            m = a[i];
        }
    }
    return m;
}

int count_passing(int a[], int n) {
    int count = 0;
    for (int i = 0; i < n; i++) {
        if (a[i] >= 60) {
            count++;
        }
    }
    return count;
}

void print_bar(int n) {
    for (int i = 1; i <= n; i++) {
        printf("*");
    }
    printf("\n");
}
void print_bars(int a[], int n) {
    for (int i = 0; i < n; i++) {
        printf("%3d ", a[i]);
        print_bar(a[i] / 10);
    }
}

void print_report(int a[], int n) {
     printf("total: %d\n", total(a, n)); 
     printf("average: %.1f\n", average(a, n));
     printf("max: %d\n", max_score(a, n)); 
     printf("passing: %d\n", count_passing(a, n)); 
}

int main(void) {
    int scores[5] = {70, 82, 95, 63, 88};
    
    printf("--- Diagram ---\n");
    print_bars(scores, 5);
    
    printf("\n--- Report ---\n");
    print_report(scores, 5);
    
    return 0;
}