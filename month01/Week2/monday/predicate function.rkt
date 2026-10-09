;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |predicate function|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; Дасгал 5A: Predicate Functions

;; 1. passing-score? : Number -> Boolean
;; оноо 60 ба түүнээс дээш бол #t
(define (passing-score? score)
  (>= score 60))
(passing-score? 60)
(passing-score? 59)
(passing-score? 85)
;; 2. fits-in-byte? : Number -> Boolean
;; сөрөг биш бүхэл n нэг byte (0–255)-д багтах эсэх
(define (fits-in-byte? n)
  (and (>= n 0) (<= n 255)))
(fits-in-byte? 255)
(fits-in-byte? 0)
(fits-in-byte? 256)
;; 3. large-file-mib? : Number -> Boolean
;; файлын хэмжээ (MiB) 100 ба түүнээс их бол #t
(define (large-file-mib? size)
  (>= size 100))
(large-file-mib? 100)
(large-file-mib? 99)
(large-file-mib? 150)
;; 4. same-total? : Number Number Number Number -> Boolean
;; хоёр барааны item-total тэнцүү эсэх (үнэ1 тоо1 үнэ2 тоо2)
;; 4. same-total? : Number Number Number Number -> Boolean
;; хоёр барааны item-total тэнцуү эсэх (үнэ1 тоо1 үнэ2 тоо2)
(define (item-total price quantity)
  (* price quantity))
(define (same-total? p1 q1 p2 q2)
  (= (item-total p1 q1) (item-total p2 q2)))
(same-total? 5000 3 3000 5)
(same-total? 5000 3 5000 2)
(same-total? 1000 0 500  0)

;; 5. passing-average? : Number Number Number -> Boolean
;; average3 60 ба түүнээс дээш бол #t (average3 функцийг ашиглана)
;; 5. passing-average? : Number Number Number -> Boolean
;; average3 60 ба түүнээс дээш бол #t (average3 функцийг ашиглана)
(define (average3 a b c)
  (/ (+ a b c) 3))
(define (passing-average? a b c)
  (>= (average3 a b c) 60))
(passing-average? 60 60 60)
(passing-average? 59 60 60)
(passing-average? 80 90 100)
;; 6. discount-eligible? : Number Number Number -> Boolean
;; final-price 50000 ба түүнээс их бол #t (нэгж үнэ, тоо, хувь)
;; 6. discount-eligible? : Number Number Number -> Boolean
;; final-price 50000 ба түүнээс их бол #t (нэгж үнэ, тоо, хувь)
(define (final-price price qty percent)
  (- (* price qty) (* (* price qty) (/ percent 100))))

(define (discount-eligible? price qty percent)
  (>= (final-price price qty percent) 50000))

(discount-eligible? 5000 10 0)
(discount-eligible? 5000 10 10)
(discount-eligible? 10000 6 0)