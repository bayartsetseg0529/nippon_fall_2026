тестэд буруу хариулсан асуултын дугаар:19
power_rec(2, 3)-ийн Tекст:
Stack Call Trace:
power_rec(2, 0) -> returns 1
power_rec(2, 1) -> returns 2 * 1 = 2
power_rec(2, 2)  -> returns 2 * 2 = 4
power_rec(2, 3)  -> returns 2 * 4 = 8
5 compile алдааны эхний мөр:
1. Алдаа 1 (Цэг таслал дутуу):practice.c:3:13: error: expected ';' at end of declaration
2. Алдаа 2 (Үсгийн алдаа / Зарлаагүй хувьсагч):practice.c:4:12: error: use of undeclared identifier 'totl'
3. Алдаа 3 (Буруу байрлагч / Format specifier mismatch):practice.c:4:20: warning: format specifies type 'int' but the argument has type 'double'
4. Алдаа 4 (return мартсан):practice.c:4:1: warning: non-void function does not return a value
5. Алдаа 5 (include мартсан):practice.c:3:5: warning: implicitly declaring library function 'printf'