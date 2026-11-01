;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname review) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; Сэргээх 1 ;Хилээс дээш сурагчид
;; 1. count-passing
(define-struct student (name grade final))
(define aki (make-student "Aki" "B" 85))
(define sora (make-student "Sora" "D" 65))
(define ren (make-student "Ren" "F" 40))
(define mina (make-student "Mina" "A" 95))
(define students (list aki sora ren mina))

(define (passing? s)
  (>= (student-final s) 60))

(define (better-student s1 s2)
  (if (>= (student-final s1) (student-final s2))
      s1
      s2))

;; 1. count-passing
(define (count-passing l)
  (cond [(empty? l) 0]
        [else (if (passing? (first l))
                  (+ 1 (count-passing (rest l)))
                  (count-passing (rest l)))]))
(check-expect (count-passing students) 3)
;; count-at-least : List-of-students Number -> Number
;; эцсийн оноо нь n ба түүнээс дээш сурагчийн тоо
(define (count-at-least l n)
  (cond [(empty? l) 0]
        [else (if (>= (student-final (first l)) n)
                  (+ 1 (count-at-least (rest l) n))
                  (count-at-least (rest l) n))]))
(check-expect (count-at-least empty 50) 0)
(check-expect (count-at-least students 80) 2)
(check-expect (count-at-least students 0) 4)
;;Сэргээх 2, Шүүх + хувиргах
(define (names-with-grade los target-grade)
  (cond
    [(empty? los) empty]
    [(cons? los)
     (if (string=? (student-grade (first los)) target-grade)
         (cons (student-name (first los)) (names-with-grade (rest los) target-grade))
         (names-with-grade (rest los) target-grade))]))

(check-expect (names-with-grade students "A") (list "Mina"))
(check-expect (names-with-grade students "C") empty)
(check-expect (names-with-grade empty "A") empty)


;; Сэргээх 3; Зураг: тэнцсэн эсэхийн мөр
(require 2htdp/image)

;; grade-row : List-of-students -> Image
;; сурагч бүрт радиус 10 тойрог: тэнцсэн бол ногоон, үгүй бол улаан
(define (grade-row los)
  (cond
    [(empty? los) empty-image]
    [else
     (beside (if (passing? (first los))
                 (circle 10 "solid" "green")
                 (circle 10 "solid" "red"))
             (grade-row (rest los)))]))

(check-expect (grade-row empty) empty-image)
(check-expect (grade-row (list aki ren))
              (beside (circle 10 "solid" "green") 
                      (circle 10 "solid" "red")))




