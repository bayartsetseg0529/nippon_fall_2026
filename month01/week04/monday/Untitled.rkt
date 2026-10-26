;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Untitled) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname review) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; sergeeh 01
;; count-passing : List-of-students -> Number
;; Жагсаалт дахь тэнцсэн сурагчдын тоог олно.
(define-struct student [name score])
(define hangai (make-student "Khangai" 45))           
(define bat (make-student "Bat" 85))          
(define saraa (make-student "Saraa" 70))       
(define dorj (make-student "Dorj" 89.6))        
(define students (list hangai bat saraa dorj))   
;;Хилээс дээш сурагчид
;; count-at-least : List-of-students Number -> Number
;; эцсийн оноо нь n ба түүнээс дээш сурагчийн тоо

(define (count-at-least l n)
  (cond
    [(empty? l) 0]
    [else
     (if (>= (student-score (first l)) n)
         (+ 1 (count-at-least (rest l) n))
         (count-at-least (rest l) n))]))
(check-expect (count-at-least empty 50) 0)
(check-expect (count-at-least students 80) 2)
(check-expect (count-at-least students 0) 4)
;;sergeeh02
(define (score->grade score)
  (cond
    [(>= score 90) "A"]
    [(>= score 80) "B"]
    [(>= score 70) "C"]
    [(>= score 60) "D"]
    [else "F"]))
;; names-with-grade : List-of-students String -> List-of-strings
;; Өгөгдсөн үнэлгээтэй сурагчдын нэрсийн жагсаалтыг буцаана
(define (names-with-grade l g)
  (cond
    [(empty? l) empty]
    [else
     (if (string=? (score->grade (student-score (first l))) g)
         (cons (student-name (first l)) (names-with-grade (rest l) g))
         (names-with-grade (rest l) g))]))

(check-expect (names-with-grade students "B") (list "Bat" "Dorj")) 
(check-expect (names-with-grade students "C") (list "Saraa"))      
(check-expect (names-with-grade empty "A") empty)
;; sergeeh03
(require 2htdp/image)

(define (student-circle s)
  (if (>= (student-score s) 60)
      (circle 10 "solid" "green")
      (circle 10 "solid" "red")))

(define (grade-row l)
  (cond
    [(empty? l) empty-image]
    [else
     (beside (student-circle (first l))
             (grade-row (rest l)))]))

(check-expect (grade-row empty) empty-image)

(define aki (make-student "Aki" 75)) 
(define ren (make-student "Ren" 40)) 
(check-expect (grade-row (list aki ren))
              (beside (circle 10 "solid" "green") (circle 10 "solid" "red")))