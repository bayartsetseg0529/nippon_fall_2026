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
    // 1. isPalendromeStr шалгалт
    printf("isPalendromeStr(\"level\") = %d\n", isPalendromeStr("level"));
    printf("isPalendromeStr(\"abba\")  = %d\n", isPalendromeStr("abba"));
    printf("isPalendromeStr(\"abc\")   = %d\n", isPalendromeStr("abc"));
    printf("isPalendromeStr(\"\")      = %d\n\n", isPalendromeStr(""));

    // 2. count_vowels шалгалт
    printf("count_vowels(\"banana\")   = %d\n", count_vowels("banana"));
    printf("count_vowels(\"education\")= %d\n", count_vowels("education"));
    printf("count_vowels(\"sky\")      = %d\n\n", count_vowels("sky"));

    // 3. caesar шалгалт
    char s1[] = "abc"; caesar(s1, 1);
    printf("caesar(\"abc\", 1)        = %s\n", s1);

    char s2[] = "xyz"; caesar(s2, 3);
    printf("caesar(\"xyz\", 3)        = %s\n", s2);

    char s3[] = "hi there"; caesar(s3, 13);
    printf("caesar(\"hi there\", 13)   = %s\n\n", s3);

    // 4. replace_char шалгалт
    char s4[] = "banana";
    int count4 = replace_char(s4, 'a', 'o');
    printf("replace_char(\"banana\")   = %s (соригдсон: %d)\n", s4, count4);

    char s5[] = "sky";
    int count5 = replace_char(s5, 'a', 'o');
    printf("replace_char(\"sky\")      = %s (соригдсон: %d)\n", s5, count5);

    return 0;
}