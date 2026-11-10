#include <stdio.h>
#include <math.h>

struct student {
    char name[20];
    int quiz;
    int project;
};

double final_score(struct student s) {
    return 0.4 * s.quiz + 0.6 * s.project;
}

void print_bar(int n) {
    for (int i = 0; i < n; i++) {
        printf("*");
    }
    printf("\n");
}
/* 4 */
void print_bars(int a[], int n) {
    for (int i = 0; i < n; i++) {
        printf("%3d ", a[i]);
        print_bar(a[i] / 10); 
    }
}

// 2. best_index 
int best_index(struct student a[], int n) {
    int best = 0;
    for (int i = 1; i < n; i++) {
        if (final_score(a[i]) > final_score(a[best])) {
            best = i;
        }
    }
    return best;
}

// 3. average_final
double average_final(struct student a[], int n) {
    double sum = 0;
    for (int i = 0; i < n; i++) {
        sum = sum + final_score(a[i]);
    }
    return sum / n;
}

void check_double(double actual, double expected) {
    double diff = actual - expected;
    if (diff < 0.0001 && diff > -0.0001) {
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
    struct student aki = {"Aki", 80, 90};
    check_double(final_score(aki), 86.0);
    struct student pair[2] = {{"Ana", 100, 50}, {"Bat", 70, 90}};
    check_int(best_index(pair, 2), 1);
    struct student group[4] = {
        {"Aki", 80, 90}, 
        {"Sora", 60, 60}, 
        {"Mina", 95, 91}, 
        {"Ren", 45, 55}
    };
    check_double(average_final(group, 4), 72.4);
    int scores[5] = {70, 82, 95, 63, 88};
    print_bars(scores, 5);

    return 0;
}