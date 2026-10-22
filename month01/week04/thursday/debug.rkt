;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname debug) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
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

;; 2. names
(define (names l)
  (cond [(empty? l) empty]
        [else (cons (student-name (first l)) (names (rest l)))]))
(check-expect (names (list aki)) (list "Aki"))

;; 3. passing-students
(define (passing-students l)
  (cond [(empty? l) empty]
        [else (if (passing? (first l))
                  (cons (first l) (passing-students (rest l)))
                  (passing-students (rest l)))]))
(check-expect (passing-students (list ren aki)) (list aki))

;; 4. best-student
(define (best-student l)
  (cond [(empty? (rest l)) (first l)]
        [else (better-student (first l) (best-student (rest l)))]))
(check-expect (best-student students) mina)

;; 5. grades
(define (grades l)
  (cond [(empty? l) empty]
        [else (cons (student-grade (first l)) (grades (rest l)))]))
(check-expect (grades (list aki sora)) (list "B" "D"))