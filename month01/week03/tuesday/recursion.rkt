;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname recursion) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; Дасгал 4A  3 function
;; count-items : List-of-numbers -> Number
;; элементийн тоо
(define (count-items l)
  (cond
    [(empty? l) 0]
    [else (+ 1 (count-items (rest l)))]))
(check-expect (count-items empty) 0)
(check-expect (count-items (cons 7 (cons 8 (cons 9 empty)))) 3)
;; 2. product
;; product : List-of-numbers -> Number
;; бүх тооны үржвэр. Хоосон list-ийн үржвэр 1 (0 биш!) — яагаад? base 1, учир нь 1-ээр үржүүлэхэд утга өөрчлөгдөхгүй. 0 бол бүх үржвэр 0 болно.
(define (product l)
  (cond
    [(empty? l) 1]
    [else (* (first l) (product (rest l)))]))
(check-expect (product empty) 1)
(check-expect (product (cons 2 (cons 3 (cons 4 empty)))) 24)
;; contains-zero? : List-of-numbers -> Boolean
;; list дотор 0 байвал #t. or ашигла.
(define (contains-zero? l)
  (cond
    [(empty? l) #f]
    [else
     (or (= (first l) 0)
         (contains-zero? (rest l)))]))
(check-expect (contains-zero? empty) #f)
(check-expect (contains-zero? (cons 1 (cons 0 empty))) #t)
(check-expect (contains-zero? (cons 1 (cons 2 empty))) #f)

;;Дасгал 5A 2 function
;; count-even : List-of-numbers -> Number
;; тэгш тоонуудын тоо

(define (count-even l)
  (cond
    [(empty? l) 0]
    [else
     (if (even? (first l))
         (+ 1 (count-even (rest l)))
         (count-even (rest l)))]))
(check-expect (count-even empty) 0)
(check-expect (count-even (cons 2 (cons 3 (cons 4 (cons 5 (cons 6 empty)))))) 3)
(check-expect (count-even (cons 1 (cons 3 empty))) 0)

;; count-negative : List-of-numbers -> Number
;; сөрөг тоонуудын тоо (0 сөрөг биш)
(define (count-negative l)
  (cond
    [(empty? l) 0]
    [else
     (if (negative? (first l))
         (+ 1 (count-negative (rest l)))
         (count-negative (rest l)))]))
(check-expect (count-negative empty) 0)
(check-expect (count-negative (cons -1 (cons 0 (cons -3 empty)))) 2)

;; draw-all : List-of-images -> Image
;; бүх зургийг зүүнээс баруун тийш тавина
(require 2htdp/image)

;; draw-all : List-of-images -> Image
;; бүх зургийг зүүнээс баруун тийш тавина
(define (draw-all l)
  (cond
    [(empty? l) empty-image]
    [else (beside (first l)
                  (draw-all (rest l)))]))

;; Шалгах тестүүд (check-expect)
(check-expect (draw-all empty) empty-image)
(check-expect (draw-all (cons (circle 20 "solid" "red")
                              (cons (rectangle 40 40 "solid" "blue") empty)))
              (beside (circle 20 "solid" "red") (rectangle 40 40 "solid" "blue")))

;; Шаардлагатай жагсаалт ба дуудах хэсэг
(define shapes
  (cons (circle 20 "solid" "red")
        (cons (rectangle 40 40 "solid" "blue") empty)))

(draw-all shapes)
