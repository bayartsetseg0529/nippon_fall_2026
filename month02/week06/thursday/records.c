#include <stdio.h>
#include <string.h>
#include "check.h"

struct student {
    char name[20];
    int quiz;
    int project;
};

int find_by_name(struct student a[], int n, char name[]){
    for(int i = 0; i < n; i++){
        if(strcmp(a[i].name, name) == 0){
            return i;
        }
    }
    return -1;
}
double final_score(struct student s) {
    return 0.4 * s.quiz + 0.6 * s.project;
}

char letter_grade(double score) {
    if (score >= 90) {
        return 'A';
    } else if (score >= 80) {
        return 'B';
    } else if (score >= 70) {
        return 'C';
    } else if (score >= 60) {
        return 'D';
    } else {
        return 'F';
    }
}
int count_grade(struct student a[], int n, char grade)
 { 
    int c = 0; 
    for (int i = 0; i < n; i++) 
    { 
        if (letter_grade(final_score(a[i])) == grade)
         {
             c = c + 1;
             } 
            }
             return c; 
            }
double class_average(struct student a[], int n) 
{
     double sum = 0;
      for (int i = 0; i < n; i++)
       {
         sum = sum + final_score(a[i]);
         }
          return sum / n;
         }
int sort_by_final(struct student a[], int n)
 {
     int swaps = 0;
      for (int i = 0; i < n - 1; i++)
      { 
        for (int j = 0; j < n - 1 - i; j++)
         {
             if (final_score(a[j]) < final_score(a[j + 1])) 
             {
                 struct student t = a[j]; 
                 a[j] = a[j + 1];
                  a[j + 1] = t;
                   swaps = swaps + 1;
                 }
                 }
                 }
                  return swaps;
                 }
void print_report(struct student a[], int n) 
{
     for (int i = 0; i < n; i++)
      {
         double f = final_score(a[i]);
          printf("%2d %-6s %5.1f %c\n", i + 1, a[i].name, f, letter_grade(f)); 
        }
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
    checkInt(find_by_name(group, 6, "Zaya"), -1);
    checkInt(count_grade(group, 6, 'D'), 2);
    checkInt(count_grade(group, 6, 'A'), 1);
    checkDouble(class_average(group, 6), 70.5);
    checkInt(sort_by_final(group, 6), 6);
    checkInt(find_by_name(group, 6, "Mina"), 0);
    checkInt(find_by_name(group, 6, "Ren"), 5);
    print_report(group, 6);

    return 0;
}