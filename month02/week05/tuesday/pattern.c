#include<stdio.h>
void print_bar(int count) {
    for (int j = 0; j < count; j++) {
        printf("*");
    }
    printf("\n"); 
}
void print_rect(int w, int h) 
{ for (int r = 1; r <= h; r++)
     { print_bar(w); } }
void print_score_bar(int score) 
{ print_bar(score / 10); }
int main(void) {
 
    print_rect(4, 2);
    printf("\n");
    print_score_bar(73);
    
    return 0;
}