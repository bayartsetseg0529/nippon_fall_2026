#include<stdio.h>
#include "check.h"
//sergeeh01 Index_of_max,Их утгын байр
int index_of_max(int arr[], int size) {
    int max_index = 0;
    for (int i = 0; i < size; i++) {
        if (arr[i] > arr[max_index]) {
            max_index = i;
        }
    }
    return max_index;
}
//sergeeh02 Count_even,Тэгш тоо
int count_even(int arr[], int size) {
    int count = 0;
    for (int i = 0; i < size; i++) {
        if (arr[i] % 2 == 0) {
            count++;
        }
    }
    return count;
}
//sergeeh03 Sum_digits_array, Цифрийн нийлбэрүүд
//digit_sum
int digit_sum(int n) {
    if(n < 0)
        n= -n;
    int sum=0;
    for(; n>0; n=n/10){
        sum= sum + n %10;
    }
    return sum;
   }

int sum_digits_array(int arr[], int size) {
    int sum = 0;
    for (int i = 0; i < size; i++) {
        int temp = digit_sum(arr[i]);
        sum = sum + temp;
    }
    return sum;
}

int main(void){
    int scores[5] = {70, 82, 95, 63, 88};
    int tie[4] = {9, 9, 1, 2};
    checkInt(index_of_max(scores, 5), 2);
    checkInt(index_of_max(tie, 4), 0);
    checkInt(count_even(scores, 5), 3);
    checkInt(count_even(tie, 4), 1);
    checkInt(sum_digits_array(scores, 5), 56);
    checkInt(sum_digits_array(tie, 4), 21);

    return 0;
}