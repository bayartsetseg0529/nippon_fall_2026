#include <stdio.h>
#include <string.h>
#include "check.h"
struct student{
    char name[20];
    int quiz;
    int project;
};
double final_score(struct student s){
    return 0.4 * s.quiz + 0.6 * s.project;
}
/* 1. find_by_name : олдоогүй бол -1 */
int find_by_name(struct student a[], int n, char name[]) 
{
    for (int i = 0; i < n; i++) {
        if (strcmp(a[i].name, name) == 0)
         {
            return i;
        }
    }
    return -1;
}

/* 2. class_average */
double class_average(struct student a[], int n) {
    double sum = 0;
    for (int i = 0; i < n; i++) {
        sum = sum + final_score(a[i]);
    }
    return (double) sum / n;
}

/* 3. sort_by_final : их → бага */
int sort_by_final(struct student a[], int n) {
    int swaps = 0;
    for (int i = 0; i < n - 1; i++) {
        for (int j = 0; j < n - 1 - i; j++) {
            if (final_score(a[j]) < final_score(a[j + 1])) {
                struct student t = a[j];
                a[j] = a[j + 1];
                a[j+1] = t;
                swaps = swaps + 1;
            }
        }
    }
    return swaps;
}

/* 4. count_passing : эцсийн оноо 60 ба түүнээс дээш */
int count_passing(struct student a[], int n) {
    int c = 0;
    for (int i = 0; i < n; i++) {
        if (final_score(a[i]) >= 60) {
            c = c + 1;
        }
    }
    return c;
}
int main(void){
    struct student group[6] = {
        {"Aki", 80, 90}, 
        {"Sora", 60, 60}, 
        {"Mina", 95, 91},
        {"Ren", 45, 55}, 
        {"Bat", 70, 75}, 
        {"Uka", 100, 34}
    };
    checkInt(find_by_name(group, 6, "Mina"), 2);
    checkDouble(class_average(group, 6), 70.5);
    checkInt(count_passing(group, 6), 5);
    checkInt(sort_by_final(group, 6), 6);
    checkString(group[0].name, "Mina");
    return 0;

}