#include<stdio.h>
#include<string.h>
#include"check.h"
struct student{
    char name[20];
    int quiz;
    int project;
};

double finalScore(struct student s){
    return 0.4* s.quiz + 0.6 * s.project;
}
int count_words(char s[]) {
    if (s[0] == '\0') {
        return 0;
    }
    int c = 1;
    for (int i = 0; s[i] != '\0'; i++) {
        if (s[i] == ' ') {
            c = c + 1;
        }
    }
    return c;
}
int best_project_index(struct student s[], int size) {
    if (size <= 0) return -1;
    
    int best_idx = 0;
    int max_project = s[0].project;
    
    for (int i = 1; i < size; i++) {
        if (s[i].project > max_project) {
            max_project = s[i].project;
            best_idx = i;
        }
    }
    return best_idx;
}
void count_pass_fail(struct student s[], int size, int *pass_count, int *fail_count) {
    *pass_count = 0;
    *fail_count = 0;
    
    for (int i = 0; i < size; i++) {
        
        if (finalScore(s[i]) >= 60.0) {
            (*pass_count)++;
        } else {
            (*fail_count)++;
        }
    }
}
int longest_name_index(struct student a[], int n) {
    int best = 0;
    for (int i = 1; i < n; i++) 
    {
        if (strlen(a[i].name) > strlen(a[best].name)) 
        {
            best = i;
        }
    }
    return best;
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
    checkInt(count_words("hello world"), 2);
    checkInt(count_words("a b c"), 3);
    checkInt(count_words("one"), 1);
    checkInt(count_words(""), 0);
    checkInt(best_project_index(group, 6), 2);
    struct student two[2] = {{"Ana", 50, 80}, {"Bo", 90, 80}};
    checkInt(best_project_index(two, 2), 0);
    int pass;
    int fail;
    count_pass_fail(group, 6, &pass, &fail);
    checkInt(pass, 5);
    checkInt(fail, 1);
    checkInt(longest_name_index(group, 6), 1);
    checkInt(longest_name_index(two, 2), 0);

    return 0;

}