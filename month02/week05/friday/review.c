#include<stdio.h>
int count_passing(int a[], int n) {
    int count = 0;
    for (int i = 0; i < n; i++) {
        if (a[i] >= 60) {
            count++;
        }
    }
    return count;
}
//Sergeeh01 Hilees ih
int count_above(int l[], int size, int limit) {
    int count = 0;
    for (int i = 0; i < size; i++) {
        if (l[i] > limit) {
            count++;
        }
    }
    return count;
}
//Sergeeh02 Baga utga
int min_score(int l[], int size) {
    int min = l[0];
    for (int i = 1; i < size; i++) {
        if (l[i] < min) {
            min = l[i];
        }
    }
    return min;
}

void check_int(int actual, int expected) {
    if (actual == expected) {
        printf("PASSED\n");
    } else {
        printf("FAILED: Got %d, expected %d\n", actual, expected);
    }
}
// sergeeh03 Aguulj bnuu
int contains(int arr[], int size, int target) {
    for (int i = 0; i < size; i++) {
        if (arr[i] == target) {
            return 1; 
        }
    }
    return 0; 
}
int main(void){
    int scores[5] = {70, 82, 95, 63, 88};
    int mixed[5] = {40, 60, 72, 58, 100};
    check_int(count_above(scores, 5, 85), 2);
    check_int(count_above(mixed, 5, 100), 0);
    check_int(min_score(scores, 5), 63);
    check_int(min_score(mixed, 5), 40);
    check_int(contains(scores, 5, 63), 1);
    check_int(contains(scores, 5, 64), 0);
    return 0;

}