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

int selectionSort(int a[], int n) 
{ 
    int swaps = 0; 
    for (int i = 0; i < n - 1; i++) 
    { 
        int m = i; 
        for (int j = i + 1; j < n; j++) 
        { 
            if (a[j] < a[m]) 
            { 
                m = j;
            } 
        } 
        if (m != i) 
        { 
            int t = a[i]; 
            a[i] = a[m]; 
            a[m] = t; 
            swaps = swaps + 1;
        } 
    } 
    return swaps;
}
void printBars(int a[], int n) {
    for (int i = 0; i < n; i++) {
        printf("%3d ", a[i]);
        
        int stars = a[i] / 10; 
        for (int j = 0; j < stars; j++) 
        {
            printf("*");
        }
        printf("\n");
    }
}
int main(void) {
    printf("---isSorted---\n");
    int s[3] = {1, 2, 2};
    int u[3] = {3, 1, 2};
    checkInt(isSorted(s, 3), 1);
    checkInt(isSorted(u, 3), 0);
    
    printf("---bubbleSort---\n");
    int a[6] = {5, 2, 8, 1, 9, 3};
    checkInt(bubbleSort(a, 6), 7); 
    checkInt(isSorted(a, 6), 1);   
    checkInt(a[0], 1);
    checkInt(a[5], 9);
    
    printf("---selectionSort---\n");
    int b[6] = {5, 2, 8, 1, 9, 3};
    checkInt(selectionSort(b, 6), 3);
    checkInt(isSorted(b, 6), 1);    
    int r[4] = {4, 3, 2, 1};
    checkInt(selectionSort(r, 4), 2);
    
    printf("--- 3B: scores ---\n");
    int scores[5] = {70,82, 95, 63, 88};
    bubbleSort(scores, 5);
    printBars(scores,5);
    return 0;




}