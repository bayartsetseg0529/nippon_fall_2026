#include <stdio.h>
#include <ctype.h>
#include "check.h"

int isSorted(int a[], int n)
{
    for(int i = 0; i < n - 1; i++)
    {
        if(a[i] > a[i + 1])
        {
            return 0;
        }
    }
    return 1; 
}
int count_inversions(int a[], int n) {
    int count = 0;
    for (int i = 0; i < n - 1; i++) {
        for (int j = 0; j < n - 1 - i; j++) {
            if (a[j] > a[j + 1]) {
                int temp = a[j];
                a[j] = a[j + 1];
                a[j + 1] = temp;
                count++;
            }
        }
    }
    return count;
}
int insertion_sort(int a[], int n) {
    int s = 0;
    for (int i = 1; i < n; i++) {
        int key = a[i];
        int j;
        
        for (j = i - 1; j >= 0 && a[j] > key; j--) {
            a[j + 1] = a[j];
            s++;
        }
        a[j + 1] = key;
    }
    return s;
}
int bubbleSort(int a[], int n)
{
    int swaps = 0;
    for (int i = 0; i < n - 1; i++) {
        for (int j = 0; j < n - 1 - i; j++) {
            if (a[j] > a[j + 1]) {
                int t = a[j];
                a[j] = a[j + 1];
                a[j + 1] = t;
                swaps = swaps + 1;
            }
        }
    }
    return swaps;
}
int median(int a[], int n) {
    int temp[n];
    for (int i = 0; i < n; i++) {
        temp[i] = a[i];
    }
    bubbleSort(temp, n);
    return temp[n / 2];
}
int main (void){
    int a[6] = {5, 2, 8, 1, 9, 3};
    int s[3] = {1, 2, 3};
    checkInt(count_inversions(a, 6), 7);
    checkInt(count_inversions(s, 3), 0);
    int b[6] = {5, 2, 8, 1, 9, 3};
    checkInt(insertion_sort(b, 6), 7);
    checkInt(isSorted(b, 6), 1);
    int c[5] = {5, 2, 8, 1, 9};
    int d[3] = {7, 7, 1};
    checkInt(median(c, 5), 5);
    checkInt(median(d, 3), 7);
    return 0;

}