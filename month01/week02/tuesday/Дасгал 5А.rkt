;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Дасгал 5А|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;Дасгал 5A ;6 эвдэрсэн function засах
;1. Нөхцөлийн дараалал буруу
;Алдаа: 95 оноо авсан хүн дээрх дарааллаар эхлээд (>= score 70)-д шалгагдаад "C" болж хувирна. Илүү өндөр буюу хатуу нөхцөлийг (90) эхэнд тавих ёстой.
(define (grade-1 score)
  (cond
    [(>= score 90) "A"]
    [(>= score 80) "B"]
    [(>= score 70) "C"]
    [(>= score 60) "D"]
    [else "F"]))
(check-expect (grade-1 95) "A")
(check-expect (grade-1 85) "B")
(check-expect (grade-1 75) "C")
(check-expect (grade-1 65) "D")
(check-expect (grade-1 50) "F")
;2. else байхгүй, нэг тохиолдол дутуу
;Алдаа: 0 утга өгөхөд ямар ч салбар таарахгүй тул cond алдаа заана (cond: all question results were false). Тиймээс else эсвэл = 0 нөхцөл нэмэх шаардлагатай.
(define (number-sign-2 n)
  (cond
    [(> n 0) "positive"]
    [(< n 0) "negative"]
    [else "zero"]))
(check-expect (number-sign-2 5) "positive")
(check-expect (number-sign-2 -3) "negative")
(check-expect (number-sign-2 0) "zero")
;;3. Хаалт буруу байрлалтай
;;Алдаа: if функцийн синтакц нь (if condition true-branch false-branch) байх ёстой. Харин энд хаалт буруу байрласнаас болж алдаа гарсан.

(define (pass-or-fail-3 score)
  (if (>= score 60) "pass" "fail"))
(check-expect (pass-or-fail-3 75) "pass")
(check-expect (pass-or-fail-3 45) "fail")
;;4. Boolean хэрэгтэй газарт string буцаасан
;;Алдаа: Функцийн нэр adult-4? (асуултын тэмдэгтэй буюу boolean утга буцаах ёстойг илтгэж байна) боловч "yes" / "no" гэсэн string буцааж байна. Тест нь #t буюу boolean утга хүлээж байгаа.
(define (adult-4? age)
  (>= age 18))
(check-expect (adult-4? 20) #t)
(check-expect (adult-4? 15) #f)

;;5. Хил 59/60 буруу (>  оронд >= байх ёстой)
;;
;;Алдаа: (> score 60) гэвэл 60 оноо авсан хүн "fail" болно. Гэтэл 60 бол тэнцэх хил мөн тул >= байх шаардлагатай.
(define (pass-or-fail-5 score)
  (if (>= score 60) "pass" "fail"))

(check-expect (pass-or-fail-5 60) "pass")
(check-expect (pass-or-fail-5 59) "fail")

;;6. Хил 89/90 буруу (> оронд >= байх ёстой)
;;Алдаа: (> score 90) гэвэл яг 90 оноо авсан хүн "A" авч чадахгүй "C" рүү орчихно. 90-өөс дээш эсвэл тэнцүү байх ёстой.
(define (grade-6 score)
  (cond
    [(>= score 90) "A"]
    [(>= score 80) "B"]
    [else "C"]))
(check-expect (grade-6 90) "A")
(check-expect (grade-6 85) "B")
(check-expect (grade-6 70) "C")