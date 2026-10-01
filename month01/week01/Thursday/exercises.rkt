;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercises) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; Exercise 01

(+ 4 3)

;; Exercise 02
(* 6 7)

;; Exercise 03
(- 12 5)

;; Exercise 04

(/ 20 4)
;; Exercise 05
(-(+ 15 25) 10)

;; Exercise 06
(* (+ 3 4 ) 2)

;; Exercise 07

(- 20 (* 5 3))
;; Exercise 08

(/ (+ 10 2) (+ 3 1))

;; Exercise 09
(/ 16 (* 2 2))

;; Exercise 10
(+ (* 5 4) (/ 6 2))

;; Exercise 11
(+ (* 2 3) (* 4 5))

;; Exercise 12
(+ 3(* 4(+ 2 1)))

;; Exercise 13

(* 2 (- 10 (+ 1 3)))

;; Exercise 14
(/ (- 20 (* 2 3)) 2)

;; Exercise 15
(/ 100 (- 50 (+ 10 20)))

;; Exercise 16
(define price 50)
(define quantity 4)
(* price quantity)

;; Exercise 17
(define base 10)
(define height 5)
(/ (* base height) 2)

;; Exercise 18
(define subtotal 50)
(define tax-rate 0.1)
(+ subtotal (* subtotal tax-rate))
;; Exercise 19
(define radius 7)
(* 2 pi radius)

;; Exercise 20

(define item-price 12.5)
(define discount 2.5)
(- item-price discount)

;; Exercise 21
(define (double x)
  (+ x x))
(double 7)
;; Exercise 22
(define (cube n)
  (* n n n))
(cube 3)
;; Exercise 23
(define (area-of-rectangle width height)
  (* width height))
(area-of-rectangle 10 5)

;; Exercise 24
(define (area-of-triangle base height)
  (/ (* base height) 2))
(area-of-triangle 10 5)

;; Exercise 25
(define (fahrenheit->celsius f)
  (* (- f 32) (/ 5 9)))
(fahrenheit->celsius 212)

;; Exercise 26
(define (my-abs n)
  (if (< n 0)
      (- n)
      n))
(my-abs -5)
;; Exercise 27

(define (discounted-price price)
  (if (> price 100)
      (* price 0.9)
      price))
(discounted-price 120)

;; Exercise 28
(define (pass-fail score)
  (if (>= score 60)
      "Pass"
      "Fail"))
(pass-fail 75)

;; Exercise 29
(define (ticket-price age)
  (cond
    [(< age 12) 5]
    [(>= age 65) 7]
    [else 10]))
(ticket-price 70)

;; Exercise 30
(define (grade-letter score)
  (cond
    [(>= score 90) "A"]
    [(>= score 80) "B"]
    [(>= score 70) "C"]
    [(>= score 60) "D"]
    [else "F"]))
(grade-letter 85)

























