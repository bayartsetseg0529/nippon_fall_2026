#include <stdio.h>
int main(void) {
    int scores[5] = {70, 82, 95, 63, 88};
    int n = 5;
    printf("%d\n", scores[0]);
    printf("%d\n", scores[4]);
    scores[1] = 90;
    int sum = 0;
    for (int i = 0; i < n; i++) {
        sum = sum + scores[i];
    }
    printf("%d\n", sum);
    return 0;
}



    

