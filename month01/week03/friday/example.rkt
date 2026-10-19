;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname example) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

;;1. grade-bar
;; grade-color : Number -> String
;; Оноонд тохируулан өнгийг буцаана (60 болон түүнээс дээш ногоон, бусад нь улаан)
(require 2htdp/image)
(define (grade-color score)
  (if (>= score 60) "green" "red"))

;; grade-bar : Number -> Image
;; Өргөн нь оноо, өндөр 20, өнгө нь grade-color байх тэгш өнцөгт үүсгэнэ
(define (grade-bar score)
  (rectangle score 20 "solid" (grade-color score)))

(check-expect (grade-bar 95) (rectangle 95 20 "solid" "green"))
(check-expect (grade-bar 59) (rectangle 59 20 "solid" "red"))

;;2. grade-bars
;; grade-bars : List-of-numbers -> Image
;; Оноо бүрийн grade-bar-ыг дээрээс доош байрлуулж зурна
(define (grade-bars scores)
  (cond
    [(empty? scores) empty-image]
    [else (above (grade-bar (first scores))
                 (grade-bars (rest scores)))]))

(check-expect (grade-bars empty) empty-image)
(check-expect (grade-bars (list 95 59)) (above (grade-bar 95) (grade-bar 59)))

(grade-bars (list 95 59))




