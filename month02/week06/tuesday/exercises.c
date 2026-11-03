#include <stdio.h>
//1
void printGreeting(int times)
{
    for(int i=0; i< times; i++)
    {
          printf("Сайн уу!\n");
    }
    
}
//2
void printEvenNumbers(int limit)
{
    for (int i = 2; i <= limit; i += 2) {
        printf("%d ", i);
    }
    printf("\n");
}
//3
void printLetters(char from, char to)
{
    for (char c = from; c <= to; c++) {
        printf("%c ", c);
    }
    printf("\n");
}
//4
void printStarLine(int n){
    for (int i = 0; i < n; i++) {
        printf("*");
    }
    printf("\n");
}
//5
void countdownBy(int from, int step)
{
    for (int i = from; i >0 ; i -= step) {
        printf("%d ", i);
    }
    printf("\n");
}
//6
void printTriangle(int height)
{
for (int row = 1; row <= height; row++) {
        printStarLine(row);
    }
}
//7
void printFizzBuzz(int n) {
    for (int i = 1; i <= n; i++) {
        if (i % 3 == 0 && i % 5 == 0) {
            printf("FizzBuzz\n");
        } else if (i % 3 == 0) {
            printf("Fizz\n");
        } else if (i % 5 == 0) {
            printf("Buzz\n");
        } else {
            printf("%d\n", i);
        }
    }
}
//8
void printClockHours(int startHour, int count) {
    for (int i = 0; i < count; i++) {
        int currentHour = (startHour + i) % 24;
        printf("%d \n", currentHour);
    }
}
//9
void printSpaces(int n) {
    for (int i = 0; i < n; i++) {
        printf(" ");
    }
}

void printPyramid(int height) {
    for (int row = 1; row <= height; row++) {
        printSpaces(height - row);
        printStarLine(2 * row - 1);
    }
}
//10
void printMonthCalendar(int firstWeekday, int daysInMonth) {
    printf("Su Mo Tu We Th Fr Sa\n");
    
    printSpaces(firstWeekday * 3);
    
    for (int day = 1; day <= daysInMonth; day++) {
        printf("%2d ", day);
    
        if ((firstWeekday + day) % 7 == 0) {
            printf("\n");
        }
    }
    if ((firstWeekday + daysInMonth) % 7 != 0) {
        printf("\n");
    }
}
int main()
{
   
    printGreeting(3);
    printEvenNumbers(10);
    printLetters('a', 'f');
    printStarLine(5);
    countdownBy(20, 5);
    countdownBy(10, 3);
    printTriangle(4);
    printTriangle(1);
    printFizzBuzz(15);
    printClockHours(22,5);
    printClockHours(23,2);
    printPyramid(4);
    printMonthCalendar(6,30);
    printMonthCalendar(0,28);
    printMonthCalendar(5,31);
    return 0;
}
