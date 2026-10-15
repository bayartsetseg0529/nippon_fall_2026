;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname score-analyzer) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; 1-р алхам ,Нийлбэр, тоо, дундаж
;; 1. total
;; total : List-of-numbers -> Number
;; Тоонуудын жагсаалтыг авч нийлбэрийг буцаана.

(define scores (list 70 82 95 63 88))

(define (total l)
  (cond
    [(empty? l) 0]
    [else (+ (first l) (total (rest l)))]))

(check-expect (total empty) 0)
(check-expect (total scores) 398)


;; 2. count-scores
;; count-scores : List-of-numbers -> Number

(define (count-scores l)
  (cond
    [(empty? l) 0]
    [else (+ 1 (count-scores (rest l)))]))

(check-expect (count-scores empty) 0)
(check-expect (count-scores scores) 5)

;; 3. average
;; average : NEList-of-numbers -> Number
;; total, count-scores-г дуудна. Хоосон list дээр дуудахгүй (NEList).
;;(define mixed-scores (list 100 50 48))
(define (average nelist)
  (/ (total nelist) (count-scores nelist)))
(check-expect (average scores) 79.6)
(check-expect (average mixed-scores) 66)

;; 4.highest
;; highest : NEList-of-numbers -> Number
(define (highest nelist)
  (cond
    [(empty? (rest nelist)) (first nelist)]
    [else (max (first nelist) (highest (rest nelist)))]))

(check-expect (highest (list 63)) 63)
(check-expect (highest scores) 95)
(check-expect (highest mixed-scores) 100)

                          ;; 2-р алхам ,Тэнцсэн, тэнцээгүй (хил 60)
;;count-passing
;; count-passing : List-of-numbers -> Number
;; 60 ба түүнээс дээш онооны тоог тоолно.
(define mixed-scores (list 40 60 72 58 100))
(define (count-passing lon)
  (cond
    [(empty? lon) 0]
    [(>= (first lon) 60) (+ 1 (count-passing (rest lon)))]
    [else (count-passing (rest lon))]))

(check-expect (count-passing scores) 5)
(check-expect (count-passing mixed-scores) 3)
(check-expect (count-passing (list 60 59)) 1)

;;2. count-failing
;; count-failing : List-of-numbers -> Number
;; 60-аас бага онооны тоог тоолно.
(define (count-failing lon)
  (cond
    [(empty? lon) 0]
    [(< (first lon) 60) (+ 1 (count-failing (rest lon)))]
    [else (count-failing (rest lon))]))
(check-expect (count-failing scores) 0)
(check-expect (count-failing mixed-scores) 2)

;; 3. passing-scores
;; passing-scores : List-of-numbers -> List-of-numbers
;; зөвхөн тэнцсэн оноонуудыг шүүж шинэ жагсаалт үүсгэнэ.
(define (passing-scores lon)
  (cond
    [(empty? lon) empty]
    [(>= (first lon) 60) (cons (first lon) (passing-scores (rest lon)))]
    [else (passing-scores (rest lon))]))

(check-expect (passing-scores mixed-scores) (list 60 72 100))
(check-expect (passing-scores (list 10 20)) empty)

;;3-р алхам ,Баганан диаграм
;; score-bars : List-of-numbers -> Image
;; оноо бүрийг 2-р долоо хоногийн score-bar-аар (rectangle оноо 20 "solid" "blue")
;; дээрээс доош тавина. Хоосон list → empty-image.
(require 2htdp/image)
(define (score-bars lon)
  (cond
    [(empty? lon) empty-image]
    [else (above (rectangle (first lon) 20 "solid" "blue")
                 (score-bars (rest lon)))]))
(check-expect (score-bars empty) empty-image)
(check-expect (score-bars (list 80 60))
              (above (rectangle 80 20 "solid" "blue") (rectangle 60 20 "solid" "blue")))
(score-bars scores)