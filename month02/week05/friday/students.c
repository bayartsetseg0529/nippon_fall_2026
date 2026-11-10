#include <stdio.h>

struct student {
    char name[20];
    int quiz;
    int project;
};

struct student group[4] = {
    {"Aki", 80, 90}, 
    {"Sora", 60, 60}, 
    {"Mina", 95, 91}, 
    {"Ren", 45, 55}
};

double final_score(struct student s) {
    return 0.4 * s.quiz + 0.6 * s.project;
}

int count_passing_students(struct student students[], int size) {
    int c = 0;
    for (int i = 0; i < size; i++) {
        if (final_score (students[i]) >= 60) {
            c = c + 1;
        }
    }
    return c; 
}

int best_index(struct student students[], int size) 
{ int best = 0;
     for (int i = 1; i < size; i++) 
     { 
        if (final_score(students[i]) > final_score(students[best])) 
        { 
            best = i; 
        }
     } 
     return best;
     }
     double average_final(struct student students[], int size)
     { 
    double sum = 0; 
    for (int i = 0; i < size; i++) 
    { 
        sum = sum + final_score(students[i]); 
    } 
    return sum / size;
 }

char letter_grade(double n)
    {
    if (n >= 90) 
    {
        return 'A';
    } 
    else if (n >= 80) 
    {
        return 'B';
    } 
    else if (n >= 70) {
        return 'C';
    } 
    else if (n >= 60) {
        return 'D';
    } 
    else 
    {
        return 'F';
    }
}
     void print_student(struct student s)
      { 
        printf("%s %.1f %c\n", s.name, final_score(s), letter_grade(final_score(s))); 
    }

void check_double(double actual, double expected) {
    double diff = actual - expected;
    if (diff < 0.0001 && diff > -0.001) {
        printf("Pass\n");
    } else {
        printf("Fail: %f гарсан, %f хүлээсэн\n", actual, expected);
    }
}


void check_int(int actual, int expected) {
    if (actual == expected) {
        printf("Pass\n");
    } else {
        printf("Fail: %d гарсан, %d хүлээсэн\n", actual, expected);
    }
}

int main(void) {
    check_double(final_score(group[0]), 86.0);
    check_double(final_score(group[2]), 92.6);
    check_int(count_passing_students(group, 4), 3);
    check_int(best_index(group, 4), 2);
    check_double(average_final(group, 4), 72.4);
    for(int i=0; i < 4; i++)
    {
        print_student(group[i]);
    }
   

    return 0;
}