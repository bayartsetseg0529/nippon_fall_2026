;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Example) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; Dasgal 2A 
(define-struct student (name midterm final grade))

;; 1. Better-student
(define (final-score s)
  (+ (student-midterm s) (student-final s)))

(define (better-student a b)
  (if (>= (final-score a) (final-score b)) a b))

;; Энд оюутнуудыг үүсгэхдээ 4 утгыг (нэрийн хамт үсгэн үнэлгээг нэмж) бүтэн өгнө
(define aki (make-student "Aki" 30 40 "A"))  
(define mina (make-student "Mina" 45 85 "B")) 
(define sora (make-student "Sora" 80 50 "A"))

(check-expect (better-student aki mina) mina)
(check-expect (better-student mina aki) mina)
(check-expect (better-student sora (make-student "Tie" 60 60 "C")) sora)

;; 2. same-grade?
(define (same-grade? a b)
  (string=? (student-grade a) (student-grade b)))

(check-expect (same-grade? aki (make-student "Ben" 85 85 "A")) #true)
(check-expect (same-grade? aki mina) #false)