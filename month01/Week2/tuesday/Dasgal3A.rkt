;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Dasgal3A) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; 1. even-or-odd
;; even-or-odd : Number -> String
;; тэгш бол "even", сондгой бол "odd"
(define (even-or-odd n)
  (if (= (remainder n 2) 0)
      "even"
      "odd"))
(check-expect (even-or-odd 4) "even")
(check-expect (even-or-odd 7) "odd")
(check-expect (even-or-odd 0) "even")  ; Хилийн тест (0)
(check-expect (even-or-odd -2) "even") ; Нэмэлт хилийн тест (сөрөг тэгш)

;; 2. pass-or-fail
;; pass-or-fail : Number -> String
;; score 60 ба түүнээс дээш бол "pass", үгүй бол "fail"
(define (pass-or-fail score)
  (if (>= score 60)
      "pass"
      "fail"))

(check-expect (pass-or-fail 60) "pass") ; Хилийн тест (зааг утга)
(check-expect (pass-or-fail 59) "fail") ; Хилийн тест (зааг утгаас бага)
(check-expect (pass-or-fail 100) "pass")
(check-expect (pass-or-fail 0) "fail")
; 3. shipping-fee
;; shipping-fee : Number -> Number
;; захиалгын дүн 50000 ба түүнээс их бол хүргэлт 0, үгүй бол 3000
(define (shipping-fee amount)
  (if (>= amount 50000)
      0
      3000))

(check-expect (shipping-fee 50000) 0)     ; Хилийн тест (яг 50000)
(check-expect (shipping-fee 49999) 3000)  ; Хилийн тест (50000-аас 1-ээр бага)
(check-expect (shipping-fee 100000) 0)
(check-expect (shipping-fee 0) 3000)

;; 4. free-shipping?
;; free-shipping? : Number -> Boolean
;; дүн 50000 ба түүнээс их бол #t. if ашиглахгүйгээр бич.
(define (free-shipping? amount)
  (>= amount 50000))

(check-expect (free-shipping? 50000) #t)   ; 
(check-expect (free-shipping? 50000) #t)
(check-expect (free-shipping? 49999) #f)  ; Хилийн тест
(check-expect (free-shipping? 50001) #t)  ; Хилийн тест

;; 5. larger
;; larger : Number Number -> Number
;; хоёр тооны их нь
(define (larger x y)
  (if (> x y)
      x
      y))

(check-expect (larger 3 8) 8)
(check-expect (larger 8 3) 8)
(check-expect (larger 5 5) 5)  ; Хилийн тест (хоёр тоо тэнцүү үед)
(check-expect (larger -2 -5) -2)


;; 6. absolute-value
;; absolute-value : Number -> Number
;; сөрөг бол эсрэг тэмдэгтэй болгоно, үгүй бол хэвээр
(define (absolute-value n)
  (if (< n 0)
      (- n)
      n))

(check-expect (absolute-value -4) 4)
(check-expect (absolute-value 4) 4)
(check-expect (absolute-value 0) 0)   ; Хилийн тест (тэг утга)
(check-expect (absolute-value -0.5) 0.5)




;Dasgal 3B
;; Өмнөх 2B хэсгийн scholarship? функц (заавал эхэнд байх ёстой)
(define (scholarship? score attendance)
  (and (>= score 90) (>= attendance 80)))

;; scholarship-label : Number Number -> String
;; score, attendance → тэтгэлэгт тэнцвэл "scholarship", үгүй бол "regular"
(define (scholarship-label score attendance)
  (if (scholarship? score attendance)
      "scholarship"
      "regular"))

;; Тестүүд
(check-expect (scholarship-label 95 85) "scholarship")
(check-expect (scholarship-label 90 80) "scholarship") ; Хилийн тест
(check-expect (scholarship-label 89 80) "regular")      ; Хилийн тест
(check-expect (scholarship-label 90 79) "regular")      ; Хилийн тест

; Dasgal 4A

;; 1. grade
;; grade : Number -> String
;; 90 ба түүнээс дээш "A", 80-89 "B", 70-79 "C", 60-69 "D", 60-аас доош "F"
(define (grade score)
  (cond
    [(>= score 90) "A"]
    [(>= score 80) "B"]
    [(>= score 70) "C"]
    [(>= score 60) "D"]
    [else "F"]))

(check-expect (grade 90) "A")  ; Хил (90)
(check-expect (grade 89) "B")  ; Хил (89)
(check-expect (grade 80) "B")  ; Хил (80)
(check-expect (grade 79) "C")  ; Хил (79)
(check-expect (grade 70) "C")  ; Хил (70)
(check-expect (grade 69) "D")  ; Хил (69)
(check-expect (grade 60) "D")  ; Хил (60)
(check-expect (grade 59) "F")  ; Хил (59)


;; 2. temperature-label
;; temperature-label : Number -> String
;; 0-ээс бага "freezing", 0–14 "cold", 15–24 "warm", 25 ба түүнээс дээш "hot"
(define (temperature-label temp)
  (cond
    [(< temp 0) "freezing"]
    [(<= temp 14) "cold"]
    [(<= temp 24) "warm"]
    [else "hot"]))

(check-expect (temperature-label -1) "freezing")
(check-expect (temperature-label 0) "cold")
(check-expect (temperature-label 14) "cold")
(check-expect (temperature-label 15) "warm")
(check-expect (temperature-label 24) "warm")
(check-expect (temperature-label 25) "hot")


;; 3. ticket-price
;; ticket-price : Number -> Number
;; age 13-аас бага 5000, 13–59 10000, 60 ба түүнээс дээш 6000
(define (ticket-price age)
  (cond
    [(< age 13) 5000]
    [(<= age 59) 10000]
    [else 6000]))

(check-expect (ticket-price 12) 5000)
(check-expect (ticket-price 13) 10000)
(check-expect (ticket-price 59) 10000)
(check-expect (ticket-price 60) 6000)


;; 4. number-sign
;; number-sign : Number -> String
;; "positive", "zero", "negative"
(define (number-sign n)
  (cond
    [(> n 0) "positive"]
    [(= n 0) "zero"]
    [else "negative"]))

(check-expect (number-sign 5) "positive")
(check-expect (number-sign 0) "zero")
(check-expect (number-sign -5) "negative")


;; 5. file-size-label (Нэмэлт)
;; file-size-label : Number -> String
;; MiB хэмжээ: 10-аас бага "small", 10–99 "medium", 100 ба түүнээс их "large"
(define (file-size-label size)
  (cond
    [(< size 10) "small"]
    [(<= size 99) "medium"]
    [else "large"]))

(check-expect (file-size-label 9) "small")
(check-expect (file-size-label 10) "medium")
(check-expect (file-size-label 99) "medium")
(check-expect (file-size-label 100) "large")

;; club-status : Number Number -> String
;; score, attendance:
;;   scholarship? үнэн бол                    "scholarship"
;;   score >= 60 ба attendance >= 70 бол       "member"
;;   бусад                                    "waitlist"
(define (club-status score attendance)
  (cond
    [(scholarship? score attendance) "scholarship"]
    [(and (>= score 60) (>= attendance 70)) "member"]
    [else "waitlist"]))

;; Тестүүд
(check-expect (club-status 95 90) "scholarship")
(check-expect (club-status 90 79) "member")     ; scholarship-д attendance хүрэхгүй
(check-expect (club-status 60 70) "member")     ; хоёр хил
(check-expect (club-status 59 100) "waitlist")
(check-expect (club-status 100 69) "waitlist")
