;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname practice) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;dasgal1
( +(* 4 5 )3)

( /(+ 8 4 )3)

;dasgal2
(define (rectangle-area width height)
  (* width height))
(rectangle-area 4 5)
(rectangle-area 0 5)

;Параметр (Parameter):
;Функцийг анх тодорхойлох буюу үүсгэх үед (define хэсэгт) бичигддэг хувьсагч юм.

;Аргумент (Argument):
;Функцийг дуудаж ажиллуулах үед дамжуулж буй бодит утга эсвэл өгөгдөл юм.

;dasgal3
;; Өргөн, өндөр болон нэгж талбайн үнийг ашиглан нийт үнийг тооцоолно.
(define (rectangle-cost width height unit-price)
  (* (rectangle-area width height) unit-price))

(rectangle-cost 4 5 300)
(rectangle-cost 2 3 100)

;Dasgal3A
;; ==========================================
;; A. Хэмжээний нэгж
;; ==========================================

;; bytes-to-bits : Number -> Number
;; byte-ийн тоог bit болгоно (1 byte = 8 bit)
(define (bytes-to-bits bytes)
  (* bytes 8))
(bytes-to-bits 1)
(bytes-to-bits 3)

;; kib-to-bytes : Number -> Number
;; KiB-ийн тоог byte болгоно (1 KiB = 1024 byte)
(define (kib-to-bytes kib)
  (* kib 1024))
(kib-to-bytes 1)
(kib-to-bytes 2)

;; kib-to-bits : Number -> Number
;; KiB-г bit болгоно. kib-to-bytes, bytes-to-bits-г дуудна.
(define (kib-to-bits kib)
  (bytes-to-bits (kib-to-bytes kib)))
(kib-to-bits 1)
(kib-to-bits 2)

;; B. Үнийн тооцоо

;; item-total : Number Number -> Number
;; нэгж үнэ ба тоо ширхэгээс нийт үнэ
(define (item-total unit-price qty)
  (* unit-price qty))
(item-total 5000 3)
(item-total 1200 0)
;; discount-amount : Number Number -> Number
;; нийт үнэ ба хувиас хөнгөлөлтийн хэмжээ.
(define (discount-amount total percent)
  (/ (* total percent) 100))
(discount-amount 15000 10)
(discount-amount 15000 0)

;; final-price : Number Number Number -> Number
;; нэгж үнэ, тоо ширхэг, хувь -> хөнгөлөлт хассан үнэ.
(define (final-price unit-price qty percent)
  (- (item-total unit-price qty)
     (discount-amount (item-total unit-price qty) percent)))
(final-price 5000 3 10)
(final-price 5000 3 0)
;; C. Дундаж
;; sum3 : Number Number Number -> Number
;; гурван тооны нийлбэр
(define (sum3 a b c)
  (+ a b c))
(sum3 10 20 30)
;; average3 : Number Number Number -> Number
;; гурван тооны дундаж. sum3-г дуудна.
(define (average3 a b c)
  (/ (sum3 a b c) 3))

(average3 60 80 100)
(average3  0 0 90)

;Dasgal4A

;1
(> 8 3)
;2
(< 8 3)
;3
(= (* 3 4) 12)
;4
(>= 60 60)
;5
(<= 59 60)
;6
(even? 17) ;Tegsh eseh shalgah
;7
(odd? 17); Sondgoi eseh shalgah
;8
(positive? 0)
;9
(zero? 0)
;10
(define (square x) (* x x))
(> (square 5) 20)
;11
(= (sum3 10 20 30) 60)
;12
(> (average3 60 80 100) 75)
