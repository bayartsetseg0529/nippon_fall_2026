#include<stdio.h>
#include "check.h"
#include<string.h>

int isPalendromeStr(char word[]) 
{ 
    int n = strlen(word); 
    for (int i = 0; i < n / 2; i++) 
    { 
        if (word[i] != word[n - 1 - i]) 
        { 
            return 0;
         } 
        } 
        return 1;
     }
// 2. count_vowels
int count_vowels(char word[])
{
    int k = 0;
    for(int i = 0; word[i] !='\0'; i++)
    {
        char c = word[i];
        if(c == 'a' || c == 'e' || c == 'i' || c == 'o' || c =='u')
        {
            k = k + 1;
        }
     }
        return k;

}
// 3. caesar

void caesar(char s[], int k)
{
    for(int i = 0; s[i] != '\0'; i++)
    {
        if(s[i] >= 'a' && s[i] <= 'z')
        {
            s[i] = (s[i] - 'a' + k) % 26 + 'a';
        }
    }
}
// 4. replace_char
int replace_char(char s[], char from, char to)
{
    int k = 0; 
    for(int i = 0; s[i] !='\0'; i++)
    {
        if (s[i] == from)
        {
            s[i] = to; 
            k = k + 1;           
        }
    }
    return k;
}

int main(void){
    checkInt(isPalendromeStr("level"),1);
    checkInt(isPalendromeStr("abba"),1);
    checkInt(isPalendromeStr("abc"),0);
    checkInt(isPalendromeStr(""),1);
    checkInt(count_vowels("banana"), 3);
    checkInt(count_vowels("education"), 5);
    checkInt(count_vowels("sky"), 0);
    char s1[] = "abc"; caesar(s1, 1); checkString(s1, "bcd");
    char s2[] = "xyz"; caesar(s2, 3); checkString(s2, "abc"); 
    char s3[] = "hi there"; caesar(s3, 13);  checkString(s3, "uv gurer");
    char s4[] = "banana";   checkInt(replace_char(s4, 'a', 'o'), 3); checkString(s4, "bonono");
    char s5[] = "sky";      checkInt(replace_char(s5, 'a', 'o'), 0); checkString(s5, "sky");

    return 0;

}