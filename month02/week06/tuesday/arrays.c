#include<stdio.h>
int sumOddTo(int n) {
    int sum = 0;
    for (int i = 0; i < n; ++i) {
        if(i % 2 == 1){
            sum += i;
        }
    }
    return sum;
}
int main(void)
{
   int numbers[4] ={1,2,4,5};
   printf("%d \n", numbers[2]);
//scores 70,82,95,63,88
//88, 95,70 hewlej haruulna
int scores[5]= {70,82,95,63,88};
printf("%d \n", scores[4]);
printf("%d \n", scores[2]);
printf("%d \n", scores[0]);
// array value change 
//63->85
printf("Before change %d \n", scores[3]);
scores[3]= 85;
printf("After change  %d \n", scores[3]);
printf("Before change %d \n", scores[0]);
scores[0]= 95;
printf("After change %d \n", scores[0]);
  //print all value of arrays
  char englishAlphabet[26] = {'a', 'b', 'c', 'd', 'e', 
    'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p',
     'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'};
     for(int i=0; i<26; i++)
     {
        printf("%c", englishAlphabet[i]);
        printf("\n");

    char englishAlphabet[26] = {'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'};

    for(int i = 0; i < 26; i++) {
        printf("%d-st letter: %c\n", i + 1, englishAlphabet[i]);
    }

    //size of array
    int size = sizeof(englishAlphabet);
    printf("%d\n", size);
    int tenNumbers[10]= {1,2,3,4,5,6,7,8,9,10};
    printf("Before\n");
    int tenNumberSize = sizeof(tenNumbers) / sizeof(tenNumbers[0]);
    for(int i=0; i<tenNumberSize; i++)
    {
        printf("%d\n", tenNumbers[i]);
    }
    for (int i=1; i<=tenNumberSize; i++){
        tenNumbers[i-1]= i*2;
        
        printf("After\n");
    for (int i=0; i<tenNumberSize; i++){
        printf("%d\n", tenNumbers[i]);
        printf("%d\n", sumOddTo(10));
    }
    }


    // ehleed 10 iin urttai array uusgene uu
    //tegeed 1 -s 10 hurtel duurgen uu 
    // daraa ni for loop ashiglan sizeof asgiglan
    // 1-20 hurtelh zuwhun tegsh toonuudig aguulsan 
    //array bolgoj utguudig uurchluurui
    //[1,2,3,4,....]=>[2,4,6, ..]
    //ehnii utgiig hoish ni tsuwuulj haruulaad
    // daraagiin uurchilsun utguudig ni tsuwuulj hewlej haruulaad
    //zuw hiisne shalgaarai 
return 0;
}
}