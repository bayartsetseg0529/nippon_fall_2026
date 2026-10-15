;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname review) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; Сэргээх 1 ,Хилтэй тоолох
;; count-at-least : List-of-numbers Number -> Number
;; Өгөгдсөн жагсаалт дотроос limit-ээс их буюу тэнцүү тоонуудын тоог олно.
(define (count-at-least lon limit)
  (cond
    [(empty? lon) 0]
    [else
     (if (>= (first lon) limit)
         (+ 1 (count-at-least (rest lon) limit))
         (count-at-least (rest lon) limit))]))

(check-expect (count-at-least empty 60) 0)
(check-expect (count-at-least (cons 60 (cons 59 empty)) 60) 1)
;;Сэргээх 2 ,NEList

;; smallest : NEList-of-numbers -> Number
;; Өгөгдсөн хоосон биш жагсаалтын хамгийн бага утгыг олно.
(define (smallest nelon)
  (cond
    [(empty? (rest nelon)) (first nelon)]
    [else
     (min (first nelon) (smallest (rest nelon)))]))
(check-expect (smallest (cons 3 empty)) 3)
(check-expect (smallest (cons 5 (cons -1 (cons 4 empty)))) -1)

;;Сэргээх 3,Тооноос зураг
;; draw-sizes : List-of-numbers -> Image
;; Тоо бүрийг радиус болгосон хар хүрээтэй тойргуудыг зүүнээс баруун тийш тавина.
(require 2htdp/image)
(define (draw-sizes lon)
  (cond
    [(empty? lon) empty-image]
    [else
     (beside (circle (first lon) "outline" "black")
             (draw-sizes (rest lon)))]))

(check-expect (draw-sizes empty) empty-image)
(check-expect (draw-sizes (cons 10 (cons 20 empty)))
              (beside (circle 10 "outline" "black") (circle 20 "outline" "black")))