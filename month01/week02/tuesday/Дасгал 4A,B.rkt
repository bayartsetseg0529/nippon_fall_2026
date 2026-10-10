;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Дасгал 4A,B|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; Дасгал 4А 
;; 1. grade : Number -> String
;; Онооноос хамааран үсгэн үнэлгээ өгөх
(define (grade score)
  (cond
    [(>= score 90) "A"]
    [(>= score 80) "B"]
    [(>= score 70) "C"]
    [(>= score 60) "D"]
    [else "F"]))

;; Хилийн утгуудаар бичсэн 8 тест
(check-expect (grade 90) "A")
(check-expect (grade 89) "B")
(check-expect (grade 80) "B")
(check-expect (grade 79) "C")
(check-expect (grade 70) "C")
(check-expect (grade 69) "D")
(check-expect (grade 60) "D")
(check-expect (grade 59) "F")
;; 2. temperature-label
;; temperature-label : Number -> String
;; 0-ээс бага "freezing", 0–14 "cold", 15–24 "warm", 25 ба түүнээс дээш "hot"
(define (temperature-label temp)
  (cond
    [(< temp 0) "freezing"]
    [(<= temp 14) "cold"]
    [(<= temp 24) "warm"]
    [else "hot"]))

;; Хилийн утгууд болон муж тус бүрийг шалгах 8 тест
(check-expect (temperature-label -2) "freezing")
(check-expect (temperature-label -1) "freezing")
(check-expect (temperature-label 0) "cold")
(check-expect (temperature-label 14) "cold")
(check-expect (temperature-label 15) "warm")
(check-expect (temperature-label 24) "warm")
(check-expect (temperature-label 25) "hot")
(check-expect (temperature-label 30) "hot")


;; 3. ticket-price

;; ticket-price : Number -> Number
;; age 13-аас бага 5000, 13–59 10000, 60 ба түүнээс дээш 6000
(define (ticket-price age)
  (cond
    [(< age 13) 5000]
    [(<= age 59) 10000]
    [else 6000]))

;; 8 check-expect тест
(check-expect (ticket-price 0) 5000)
(check-expect (ticket-price 5) 5000)
(check-expect (ticket-price 12) 5000)
(check-expect (ticket-price 13) 10000)
(check-expect (ticket-price 30) 10000)
(check-expect (ticket-price 59) 10000)
(check-expect (ticket-price 60) 6000)
(check-expect (ticket-price 75) 6000)

;;4. number-sign
;; number-sign : Number -> String
;; "positive", "zero", "negative"
(define (number-sign n)
  (cond
    [(> n 0) "positive"]
    [(= n 0) "zero"]
    [else "negative"]))

;; 8 check-expect тест (хилийн утгууд болон эерэг/сөрөг мужууд)
(check-expect (number-sign 100) "positive")
(check-expect (number-sign 5) "positive")
(check-expect (number-sign 1) "positive")
(check-expect (number-sign 0) "zero")
(check-expect (number-sign -1) "negative")
(check-expect (number-sign -5) "negative")
(check-expect (number-sign -100) "negative")
(check-expect (number-sign 0.001) "positive")

;;5. file-size-label (Нэмэлт)

;; file-size-label : Number -> String
;; MiB хэмжээ: 10-аас бага "small", 10–99 "medium", 100 ба түүнээс их "large"
(define (file-size-label size)
  (cond
    [(< size 10) "small"]
    [(<= size 99) "medium"]
    [else "large"]))

;; 8 check-expect тест
(check-expect (file-size-label 0) "small")
(check-expect (file-size-label 5) "small")
(check-expect (file-size-label 9) "small")
(check-expect (file-size-label 10) "medium")
(check-expect (file-size-label 50) "medium")
(check-expect (file-size-label 99) "medium")
(check-expect (file-size-label 100) "large")
(check-expect (file-size-label 500) "large")



;;Дасгал 4B ;Олон нөхцөлтэй cond
;; club-status : Number Number -> String
;; score, attendance:
;;   scholarship? үнэн бол                    "scholarship"
;;   score >= 60 ба attendance >= 70 бол       "member"
;;   бусад                                    "waitlist"
(define (club-status score attendance)
  (cond
    [(and (>= score 90) (>= attendance 90)) "scholarship"]
    [(and (>= score 60) (>= attendance 70)) "member"]
    [else "waitlist"]))

;; Өгөгдсөн тестүүд
(check-expect (club-status 95 90) "scholarship")
(check-expect (club-status 90 79) "member")     ; scholarship-д attendance хүрэхгүй
(check-expect (club-status 60 70) "member")     ; хоёр хил
(check-expect (club-status 59 100) "waitlist")
(check-expect (club-status 100 69) "waitlist")
