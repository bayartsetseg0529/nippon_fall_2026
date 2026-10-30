//2 kwadrat 
/* square_sum : int int -> int
   a² + b² */
int square_sum(int a, int b) {
    return a * a + b * b;
}
/* check_int : бүхэл тоо тэнцүү бол PASS (С-ийн check-expect) */
void check_int(int actual, int expected) {
    if (actual == expected) {
        printf("PASS\n");
    } else {
        printf("FAIL: %d гарсан, %d хүлээсэн\n", actual, expected);
    }
}
int main(void){
check_int(square_sum(3, 4), 25);
check_int(square_sum(0, 5), 25);
check_int(square_sum(-2, 1), 5);
}
