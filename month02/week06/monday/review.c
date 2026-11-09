// sergeeh 01
#include <stdio.h>
struct student {
    char name[20];
    int final_score;
    char letter_grade;
};

// Сэргээх 1: Тоолох функц
int count_grade(struct student students[], int size, char grade) {
    int count = 0;
    for (int i = 0; i < size; i++) {
        if (students[i].letter_grade == grade) {
            count++;
        }
    }
    return count;
}
// Сэргээх 2: Хоёр дахь их (L9)

int second_max(int a[], int n) {
    int max1, max2;
    if (a[1] > a[0]) 
    {
        max1 = a[1];
        max2 = a[0];
    } else 
    {
        max1 = a[0];
        max2 = a[1];
    }

    for (int i = 2; i < n; i++) 
    {
        if (a[i] > max1) 
        {
            max2 = max1;
            max1 = a[i];
        } else if (a[i] > max2) 
        {
            max2 = a[i];
        }
    }

    return max2;
}
// Сэргээх 3: Мужид орох
int count_in_range(int a[], int n, int lo, int hi) {
    int c = 0;
    for (int i = 0; i < n; i++) 
    {
        if (lo <=a[i] && a[i] <= hi) 
        {
            c = c + 1;
        }
    }
    return c;
}
void check_int(int actual, int expected) {
    if (actual == expected) {
        printf("PASS\n");
    } else {
        printf("FAIL: Expected %d, got %d\n", expected, actual);
    }
}
int main(void) {
    int scores[5] = {70, 82, 95, 63, 88};
    int b[6] = {5, 2, 7, 2, 9, 1};
    struct student group[4] = {
        {"Aki", 90, 'A'},
        {"Sora", 80, 'B'},
        {"Mina", 50, 'F'},
        {"Ren", 70, 'C'}
    };

    check_int(count_grade(group, 4, 'A'), 1);
    check_int(count_grade(group, 4, 'F'), 1);
    check_int(count_grade(group, 4, 'C'), 0); 
    check_int(second_max(scores, 5), 88);
    check_int(second_max(b, 6), 7);
    check_int(count_in_range(scores, 5, 80, 90), 2);
    check_int(count_in_range(scores, 5, 0, 100), 5);

    return 0;
}