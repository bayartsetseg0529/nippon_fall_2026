;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname system) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; Dasgal 4A
;; 1. passing-students
(define-struct student [name grade final])

(define aki (make-student "Aki" 80 80))
(define sora (make-student "Sora" 70 75))
(define mina (make-student "Mina" 95 90))
(define ren (make-student "Ren" 40 45))
(define students (list aki sora mina ren))
(define (passing? s)
  (>= (student-score s) 60))
(define (passing-students l)
  (cond
    [(empty? l) empty]
    [else (if (passing? (first l))
              (cons (first l) (passing-students (rest l)))
              (passing-students (rest l)))]))
(check-expect (passing-students empty) empty)
(check-expect (passing-students students) (list aki sora mina))
(check-expect (passing-students (list ren aki)) (list aki))


;; 2. names
(check-expect (names empty) empty)
(check-expect (names students) (list "Aki" "Sora" "Rina" "Ren"))

(define (names l)
  (cond
    [(empty? l) empty]
    [else (cons (student-name (first l))
                (names (rest l)))]))


;; 3. grades
(check-expect (grades empty) empty)
(check-expect (grades students) (list "B" "B" "A" "F"))

(define (grades l)
  (cond
    [(empty? l) empty]
    [else (cons (letter-grade (first l))
                (grades (rest l)))]))


;; 4. bonus-all
(check-expect (bonus-all empty 10) empty)
(check-expect (bonus-all (list aki ren) 10)
              (list (make-student "Aki" 80 100) (make-student "Ren" 45 55)))

(define (bonus-all l b)
  (cond
    [(empty? l) empty]
    [else (cons (add-bonus (first l) b)
                (bonus-all (rest l) b))]))
