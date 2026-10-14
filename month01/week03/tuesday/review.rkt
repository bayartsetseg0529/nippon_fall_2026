;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname review) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; Сэргээх 1 Гурав дахь утга
;; third-item : List-of-numbers -> Number
;; дор хаяж 3 элементтэй list-ийн гурав дахь утга
(check-expect (third-item (cons 4 (cons 7 (cons 9 empty)))) 9)

(define (third-item lon)
  (first (rest (rest lon))))

;;Сэргээх 2 and-тай predicate
;; two-items? : List-of-numbers -> Boolean
;; яг хоёр элементтэй бол #t
(check-expect (two-items? empty) #f)
(check-expect (two-items? (cons 1 empty)) #f)
(check-expect (two-items? (cons 1 (cons 2 empty))) #t)
(check-expect (two-items? (cons 1 (cons 2 (cons 3 empty)))) #f)

(define (two-items? lon)
  (and (not (empty? lon))
       (not (empty? (rest lon)))
       (empty? (rest (rest lon)))))

;;Сэргээх 3: Зураг + if
;; first-or-dot : List-of-images -> Image
;; хоосон бол саарал цэг (circle 5 "solid" "gray"), үгүй бол эхний зураг
(require 2htdp/image)
(check-expect (first-or-dot empty) (circle 5 "solid" "gray"))
(check-expect (first-or-dot (cons (circle 20 "solid" "red") empty)) (circle 20 "solid" "red"))

(define (first-or-dot loi)
  (if (empty? loi)
      (circle 5 "solid" "gray")
      (first loi)))


