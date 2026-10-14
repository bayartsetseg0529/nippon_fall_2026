;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname review) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;Сэргээх 1 , Тоолох recursion
;; count-zeros : List-of-numbers -> Number
;; Жагсаалт доторх 0-ийн тоог тоолно
(define (count-zeros alon)
  (cond
    [(empty? alon) 0]
    [(zero? (first alon)) (+ 1 (count-zeros (rest alon)))]
    [else (count-zeros (rest alon))]))
(check-expect (count-zeros empty) 0)
(check-expect (count-zeros (cons 0 (cons 5 (cons 0 empty)))) 2)

;;Сэргээх 2 , and-тай recursion
;; all-positive? : List-of-numbers -> Boolean
;; Жагсаалт дахь бүх тоо эерэг эсэхийг шалгана

(define (all-positive? alon)
  (cond
    [(empty? alon) #t]
    [else (and (> (first alon) 0) 
               (all-positive? (rest alon)))]))
(check-expect (all-positive? empty) #t)
(check-expect (all-positive? (cons 1 (cons 2 empty))) #t)
(check-expect (all-positive? (cons 1 (cons 0 empty))) #f)

;;Сэргээх 3 , Зургийн recursion
;; stack-all : List-of-images -> Image
;; бүх зургийг дээрээс доош тавина
(require 2htdp/image)
(define (stack-all aloi)
  (cond
    [(empty? aloi) empty-image]
    [else (above (first aloi) 
                 (stack-all (rest aloi)))]))
(check-expect (stack-all empty) empty-image)
(check-expect (stack-all (cons (circle 10 "solid" "red") (cons (circle 10 "solid" "blue") empty)))
              (above (circle 10 "solid" "red") (circle 10 "solid" "blue")))
