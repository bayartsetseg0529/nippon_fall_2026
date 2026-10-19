;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname review) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;Сэргээх 1
;;Нөхцөлтэй нийлбэр
(define (sum-passing lon)
  (cond
    [(empty? lon) 0]
    [else
     (if (>= (first lon) 60)
         (+ (first lon) (sum-passing (rest lon)))
         (sum-passing (rest lon)))]))
(check-expect (sum-passing empty) 0)
(check-expect (sum-passing (list 59 60 100)) 160)
(check-expect (sum-passing (list 10 20)) 0)

;;Сэргээх 2
;;Бүгд тэнцсэн үү?
;; all-passing? : List-of-numbers -> Boolean
;; бүх оноо 60 ба түүнээс дээш бол #true. Хоосон list-д #true.

(define (all-passing? lon)
  (cond
    [(empty? lon) #true]
    [else
     (and (>= (first lon) 60)
          (all-passing? (rest lon)))]))
(check-expect (all-passing? empty) #true)
(check-expect (all-passing? (list 60 75)) #true)
(check-expect (all-passing? (list 60 59)) #false)

;;Сэргээх 3 ;;Онооноос зураг

(require 2htdp/image)

;; score-dots : List-of-numbers -> Image
;; оноо бүрийг радиус 10 тойрог болгож зэрэгцүүлнэ: 60+ ногоон, бусад улаан

(define (score-dots lon)
  (cond
    [(empty? lon) empty-image]
    [else
     (beside (if (>= (first lon) 60)
                 (circle 10 "solid" "green")
                 (circle 10 "solid" "red"))
             (score-dots (rest lon)))]))
(check-expect (score-dots empty) empty-image)
(check-expect (score-dots (list 70 40))
              (beside (circle 10 "solid" "green") (circle 10 "solid" "red")))
(check-expect (score-dots (list 60)) (circle 10 "solid" "green"))
