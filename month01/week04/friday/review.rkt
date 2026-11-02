;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname review) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; sergeeh01 onts suragchdiig tooloh
(define-struct student [name score])
(define aki (make-student "Aki" 89.6))           
(define sora (make-student "Sora" 70))                 
(define mina (make-student "Mina" 95))
(define ren (make-student "Ren" 50))

(define students (list aki sora mina ren))   

(define (passing? s)
  (>= (student-score s) 60))

(define (honor? s)
  (>= (student-score s) 90))

(define (count-honor los)
  (cond
    [(empty? los) 0]
    [else
     (if (honor? (first los))
         (+ 1 (count-honor (rest los)))
         (count-honor (rest los)))]))

(check-expect (count-honor empty) 0)
(check-expect (count-honor students) 1)
(check-expect (count-honor (list mina (make-student "Nine" 90))) 2)

;; sergeeh02 shuuh huwirgah
;; failing-names : List-of-students -> List-of-strings
;; тэнцээгүй сурагчдын нэрийг буцаана
(define (failing-names los)
  (cond
    [(empty? los) empty]
    [else
     (if (not (passing? (first los)))
         (cons (student-name (first los)) (failing-names (rest los)))
         (failing-names (rest los)))]))

(check-expect (failing-names empty) empty)
(check-expect (failing-names (list ren)) (list "Ren"))

;;; sergeeh 03 zurag: nersiin mur
(require 2htdp/image)
(define (name-tag s)
  (text (student-name s) 20 'black))
(define (tags-row los)
  (cond
    [(empty? los) empty-image]
    [else
     (beside (name-tag (first los))
             (tags-row (rest los)))]))

(check-expect (tags-row empty) empty-image)
(check-expect (tags-row (list aki sora))
              (beside (name-tag aki) (name-tag sora)))











