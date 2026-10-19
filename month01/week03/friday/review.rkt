;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname review) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;Сэргээх 1
;;List буцаах recursion
;; scale-all : List-of-numbers Number -> List-of-numbers
;; тоо бүрийг factor-оор үржүүлнэ
(check-expect (scale-all empty 10) empty)
(check-expect (scale-all (list 1 2) 10) (list 10 20))

(define (scale-all lon factor)
  (cond
    [(empty? lon) empty]
    [else (cons (* (first lon) factor)
                (scale-all (rest lon) factor))]))
;;Сэргээх 2
;;NEList + composition
;; highest : NEList-of-numbers -> Number
(define (highest nelist)
  (cond
    [(empty? (rest nelist)) (first nelist)]
    [else (max (first nelist) (highest (rest nelist)))]))

;; letter-grade : Number -> String
(define (letter-grade score)
  (cond
    [(>= score 90) "A"]
    [(>= score 80) "B"]
    [(>= score 70) "C"]
    [(>= score 60) "D"]
    [else "F"]))

;; best-grade : NEList-of-numbers -> String
;; хамгийн их онооны үсгэн дүн.
(define (best-grade ne-lon)
  (letter-grade (highest ne-lon)))

(check-expect (best-grade (list 70 95)) "A")
(check-expect (best-grade (list 59)) "F")

;;Сэргээх 3
;;Зургийн recursion
;; pass-fail-badge : Number -> Image
;; Өгөгдсөн онооноос хамаарч ногоон эсвэл улаан тэмдэг (тойрог) буцаана
(require 2htdp/image)
(define (pass-fail-badge score)
  (if (>= score 60)
      (circle 20 "solid" "green")
      (circle 20 "solid" "red")))

;; badge-row : List-of-numbers -> Image
;; Оноо бүрийг pass-fail-badge-аар хувиргаж зүүнээс баруун тийш (beside) зэрэгцүүлнэ
(define (badge-row scores)
  (cond
    [(empty? scores) empty-image]
    [else (beside (pass-fail-badge (first scores))
                  (badge-row (rest scores)))]))

;; Тестүүд
(check-expect (badge-row empty) empty-image)
(check-expect (badge-row (list 60 59))
              (beside (circle 20 "solid" "green") (circle 20 "solid" "red")))