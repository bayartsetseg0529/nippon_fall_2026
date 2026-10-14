;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname review) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;Сэргээх 1 ,Composition
;; Туслах функц: average3
;; average3 : Number Number Number -> Number
(define (average3 x y z)
  (/ (+ x y z) 3))

;; Үндсэн функц: curved-average
;; curved-average : Number Number Number -> Number
;; гурван онооны дундаж дээр 5 оноо нэмнэ.
(define (curved-average a b c)
  (+ (average3 a b c) 5))

(check-expect (curved-average 60 70 80) 75)
(check-expect (curved-average 0 0 0) 5)

;;Сэргээх 2 ,and-тай predicate
;; honor-student? : Number Number -> Boolean
;; дундаж 90 ба түүнээс дээш, ирц 90 ба түүнээс дээш бол #t
(define (honor-student? avg attendance)
  (and (>= avg 90) (>= attendance 90)))

(check-expect (honor-student? 90 90) #t)
(check-expect (honor-student? 89 100) #f)
(check-expect (honor-student? 100 89) #f)

;;Сэргээх 3 cond + зураг
(require 2htdp/image)

;; status-light : Number -> Image
;; оноо 80+ ногоон, 60–79 шар, бусад улаан тойрог (радиус 15).
(define (status-light score)
  (cond
    [(>= score 80) (circle 15 "solid" "green")]
    [(>= score 60) (circle 15 "solid" "yellow")]
    [else (circle 15 "solid" "red")]))

(check-expect (status-light 80) (circle 15 "solid" "green"))
(check-expect (status-light 79) (circle 15 "solid" "yellow"))
(check-expect (status-light 60) (circle 15 "solid" "yellow"))
(check-expect (status-light 59) (circle 15 "solid" "red"))