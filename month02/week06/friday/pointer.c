#include<stdio.h>
#include"check.h"
struct student{
    char name[20];
    int quiz;
    int project;
};
void simpleSwap(int a, int b)
{
    int c = a;
    a = b;
    b = c;


}
// swap
void swap(int *a, int *b){
    int c = *a;
    *a = *b;
    *b =c;
}
//add_bonus
void add_bonus(int *score, int bonus){
    *score = *score + bonus;
    if(*score > 100)
    {
        *score =100;
    }
}
// 1. min_max
void min_max(int arr[], int n, int *lo, int *hi) {
    *lo = arr[0];
    *hi = arr[0];
    for (int i = 1; i < n; i++) {
        if (arr[i] < *lo) {
            *lo = arr[i];
        }
        if (arr[i] > *hi) {
            *hi = arr[i];
        }
    }
}
//2–3. bonus_copy, bonus_in_place
struct student bonus_copy(struct student s, int bonus) {
    s.project += bonus;
    if (s.project > 100) {
        s.project = 100;
    }
    return s;
}
void bonus_in_place(struct student *s, int bonus) {
    (*s).project += bonus;
    if ((*s).project > 100) {
        (*s).project = 100;
    }
}


int main(void){
    printf("---swap---\n");
    int x = 2;
    int y = 1;
    simpleSwap(x,y);
    printf("%d\n", x);
    printf("%d\n", y);
    swap(&x, &y);
    checkInt(x,1);
    checkInt(y, 2);
    int s = 95;
    add_bonus(&s, 3);  
    checkInt(s, 98);
    add_bonus(&s, 5);  
    checkInt(s, 100);
    int scores[5] = {70, 82, 95, 63, 88};
    int lo;
    int hi;
    min_max(scores, 5, &lo, &hi);
    checkInt(lo, 63);
    checkInt(hi, 95);
    struct student aki = {"Aki", 80, 90};
    struct student copy = bonus_copy(aki, 5);
    checkInt(copy.project, 95);
    checkInt(aki.project, 90);
    bonus_in_place(&aki, 5);
    checkInt(aki.project, 95);
    bonus_in_place(&aki, 20);
    checkInt(aki.project, 100);


    return 0;
}