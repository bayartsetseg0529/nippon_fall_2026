;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname review) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; sergeeh 01 onts suragchdiig tooloh
;; 1. Өгөгдлийн бүтэц (Data Definition)
(define-struct student [name score1 score2])
(define mina (make-student "Mina" 95 88))
(define puredorj (make-student "Purevdorj" 80 85))
(define students (list mina puredorj))

(define (honor? s)
  (or (>= (student-score1 s) 90)
      (>= (student-score2 s) 90)))

(define (count-honor los)
  (cond
    [(empty? los) 0]
    [(cons? los)
     (if (honor? (first los))
         (+ 1 (count-honor (rest los)))
         (count-honor (rest los)))]))

(check-expect (count-honor empty) 0)
(check-expect (count-honor students) 1)
(check-expect (count-honor (list mina (make-student "Nine" 90 90))) 2)

