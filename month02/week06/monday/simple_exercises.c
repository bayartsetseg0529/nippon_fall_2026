#include <stdio.h>
#include <stdbool.h>

// Dasgal 1: checkIsDigit
bool checkIsDigit(char c) 
{
    if (c >= '0' && c <= '9') 
    {
        return true;
    } 
    else 
    {
        return false;
    }
}

// Dasgal 2: getTemperatureStatus (const char* буцаадаг болгов)
const char* getTemperatureStatus(double temp)
{
    if (temp < 0.0)
    {
        return "C"; 
    }
    else if (temp >= 0.0 && temp < 30.0)
    {
        return "N"; 
    }
    else if (temp >= 30.0)
    {
        return "H"; 
    }
    else
    {
        return "Invalid";
    }
}

// Dasgal 3: getGrade
char getGrade(int score)
{
    if (score < 0 || score > 100)
    {
        return 'X'; 
    }
    else if (score >= 90)
    {
        return 'A';
    }
    else if (score >= 80)
    {
        return 'B';
    }
    else if (score >= 70)
    {
        return 'C';
    }
    else if (score >= 60)
    {
        return 'D';
    }
    else
    {
        return 'F';
    }
}

// Dasgal 4: isLeapYear
bool isLeapYear(int year)
{
    if ((year % 4 == 0 && year % 100 != 0) || (year % 400 == 0))
    {
        return true;
    }
    else
    {
        return false;
    }
}
// dasgal5 calculateticketprice( int age, boolisWeekend)

int calculateTicketPrice(int age, bool isWeekend)
{
    int price =0;

    if (age < 6)
    {
        price = 0.0;
    }
    else if ( age <= 17)
    {
        price = 5000.0;
    }
    else if ( age <= 64)
    {
        price = 10000.0;
    }
   else 
    {
        price = 6000.0;
    }

    if (isWeekend)
    {
        price += 2000.0;
    }

    return price;
}
//dasgal 6
void printCountdown(int n)
{
    for(int i = n; i>=1; i=i-1)
    {
        printf("%d\n" , i);


    }
    printf("Start!\n");
}
//dasgal 7
int sumOfRange(int from, int to)
{
    int sum = 0;
    for (int i = from; i < to; i++)
    {
        sum = sum + i;
    }
    return sum;
}

int main(void) 
{
    printf("%s\n", checkIsDigit('5') ? "true" : "false"); 
    printf("%s\n", checkIsDigit('a') ? "true" : "false"); 
    printf("%s\n", getTemperatureStatus(-5.5)); 
    printf("%s\n", getTemperatureStatus(15.0)); 
    printf("%s\n", getTemperatureStatus(35.2)); 
    printf("%c\n", getGrade(95)); 
    printf("%c\n", getGrade(82));
    printf("%s\n", isLeapYear(2024) ? "true" : "false"); 
    printf("%s\n", isLeapYear(1900) ? "true" : "false"); 
    printf("%s\n", isLeapYear(2000) ? "true" : "false");
    printf("%s\n", isLeapYear(2023) ? "true" : "false");
    printf("%d\n", calculateTicketPrice(4, false));   
    printf("%d\n", calculateTicketPrice(12, true));   
    printf("%d\n", calculateTicketPrice(30, false));  
    printf("%d\n", calculateTicketPrice(70, true));   
    printCountdown(10);
    printf("%d",sumOfRange(10,15));
    return 0;
}