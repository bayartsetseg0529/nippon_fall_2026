#include<stdio.h>
#include<ctype.h>
#include "check.h"
int countUpper(char s[] )
{
    int count =0;
    for(int i=0; s[i] != '\0'; i++)
    {
        if(s[i]>= 'A' && s[i] <= 'Z')
        {
            count ++;
        }
    }
    return count;
}
int index0fChar(char s[], char c)
{
{
    for(int i=0; s[i] != '\0'; i++)
    {
        if(s[i] ==c)
        {
            return i;
        }
    }
    return -1;
}
}
void toLower(char s[]){
    for (int i = 0; s[i] != '\0'; i++) 
    {
        
        s[i] = tolower(s[i]);
    }
}

int main(void){
    printf("---countUpper---\n");
    checkInt(countUpper("Hello World"), 2);
    checkInt(countUpper("abc"), 0);
    checkInt(countUpper("ABC"), 3);

    printf("---Index0fchar---\n");
    checkInt(index0fChar("banana", 'n'), 2);
    checkInt(index0fChar("abc", 'z'), -1);
    checkInt(index0fChar("", 'a'), -1);

    printf("---toLower---\n");
    char a[]= "Hello";
    toLower(a);
    checkString(a, "hello");
    char b[]= "ABC";
    toLower(b);
    checkString(b, "abc");
    return 0;



}