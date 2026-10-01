;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Lesson) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Thursday (2026-10-01) -- comment (Setgegdel)
; values -- utga
5
-6
1.6
;utga
"Hello World"


; arithmetic operation
(+ 3 4)
(- 10 6)
(* 5 8)
(/ 20 4)
(+ 100 50)
(- 30 12)
(* 7 6)
(/ 81 9)
; many numbers
( + 1 2 3)
(+ 10 20 30)
; nested expression dawhardsan too
( +(* 2 3 )4)

;(* 2 3 -> syntax error
(* 2 3)
;(* 4)
; (sign operator operand)
(+ 2 3)

; define todorhoiloh -> keyword buyu tulhuur ug
(define age 40)
age ; variable huwisagch, utgani ner
; Example
(define name "bayartsetseg")
name; call/usage 
(define job "It")
job

;ex 01 width hight gedeg todorhoilood  4 5 utguud onoonuu
(define width 4)
width
(define hight 5)
hight
(+ width hight) 
(* width hight)
;ex02 
(define price 100)
(define quantity 3)
(* price quantity)

;ex03 salary, bonus 1500, 30 utguudig onoogood sariin etsest hedii ih tsalin awah be 
(define salary 1500)
(define bonus 300)
(+ salary bonus)

; 4 * 4 =16/
; functions
; square gedeg punkts todorhoiloh
; x -g punktsiin paramitr
; input - x
; function process -> (* x x) 
(define (square x)
  (* x x))
; output
(square 5)
(square 12)
(square 112376347)
; double gedeg nertei parametr awaad tuunii utgiig doubled dag punkts bichne
; tuuniigee 4, 8, -35 gedeg argumentuudar testlej ur dung shalgaarai
(define (double x)
  (+ x x))
(double 4)
(double 8)
(double -35)

(define (triple x)
  (* 3 x))
(triple 5)
(triple 15)

(define (add-ten x)
  (+ 10 x))
(add-ten 10)

;ex06
; Multiple parameters
; two parameters function
; tegsh untsugtiin talbaig oloh - width*height
(define (calculate-area-rectangle width height)
  (* width height))
(calculate-area-rectangle 5 6)
;ex07
; calculate perimetr-rectangle punkts
; p=2*(a+b)

(define (calculate-perimetr-rectangle a b )
  (* 2(+ a b)))
(calculate-perimetr-rectangle 5 6)

;ex08
;calculate-circle-area gedeg punkts bichne uu
; r=3.14 * r *r
(define (calculate-circle-area r )
  (* 3.14 r ))
(calculate-circle-area 5 )


