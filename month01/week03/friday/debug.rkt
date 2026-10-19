;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname debug) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

(define scores (list 70 82 95 63 88))
(define mixed-scores (list 40 60 72 58 100))

(define (total l)
  (cond [(empty? l) 0]
        [else (+ (first l) (total (rest l)))]))

(define (count-scores l)
  (cond [(empty? l) 0]
        [else (+ 1 (count-scores (rest l)))]))

(define (average l) (/ (total l) (count-scores l)))

(define (highest l)
  (cond [(empty? (rest l)) (first l)]
        [else (max (first l) (highest (rest l)))]))

(define (count-passing l)
  (cond [(empty? l) 0]
        [else (if (>= (first l) 60)
                  (+ 1 (count-passing (rest l)))
                  (count-passing (rest l)))]))

(define (passing-scores l)
  (cond [(empty? l) empty]
        [else (if (>= (first l) 60)
                  (cons (first l) (passing-scores (rest l)))
                  (passing-scores (rest l)))]))

(define (score-bar score) (rectangle score 20 "solid" "blue"))

;; 1. <= → <: 60 тэнцсэн оноо.
(define (count-failing-1 l)
  (cond [(empty? l) 0]
        [else (if (< (first l) 60)
                  (+ 1 (count-failing-1 (rest l)))
                  (count-failing-1 (rest l)))]))
(check-expect (count-failing-1 (list 60)) 0)

;; 2. (count-scores (rest l)) → (count-scores l).
(define (average-2 l)
  (/ (total l) (count-scores l)))
(check-expect (average-2 (list 60 80)) 70)

;; 3. if-ийн хоёр салбарыг солих: тэнцсэн бол cons.
(define (passing-scores-3 l)
  (cond [(empty? l) empty]
        [else (if (>= (first l) 60)
                  (cons (first l) (passing-scores-3 (rest l)))
                  (passing-scores-3 (rest l)))]))
(check-expect (passing-scores-3 (list 40 60)) (list 60))

;; 4. Base case empty → empty-image: above зураг шаарддаг.
(define (score-bars-4 l)
  (cond [(empty? l) empty-image]
        [else (above (score-bar (first l)) (score-bars-4 (rest l)))]))
(check-expect (score-bars-4 (list 80)) (score-bar 80))