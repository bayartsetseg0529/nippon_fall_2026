;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; Dasgal 2A
;; 1. count-grade
(define-struct student [name score grade])
(define aki (make-student "Aki" 86 "B"))            
(define sora (make-student "Sora" 85 "B"))                 
(define mina (make-student "Mina" 90 "A"))
(define ren (make-student "Ren" 50 "F"))

(define students (list aki sora mina ren))   

(define (count-grade l g)
  (cond [(empty? l) 0]
        [else
         (if (string=?
              (student-grade (first l)) g)
             (+ 1 (count-grade (rest l) g))
             (count-grade (rest l) g))]))

(check-expect (count-grade empty "A") 0)
(check-expect (count-grade students "A") 1)
(check-expect (count-grade students "F") 1)
(check-expect (count-grade students "C") 0)

;; Dasgal 2B
;; 1. report-row
(require 2htdp/image)

(define (card-color s)
  (cond
    [(string=? (student-grade s) "A") "green"]
    [(string=? (student-grade s) "B") "green"]
    [else "red"]))

(define (report-row s)
  (beside (text (student-name s) 14 "black")
          (rectangle (* 2 (student-score s)) 16 "solid"
                     (card-color s))))
(check-expect (report-row aki)
              (beside (text "Aki" 14 "black") (rectangle 172 16 "solid" "green")))
;; 2. report-chart
(define (report-chart los)
  (cond
    [(empty? los) empty-image]
    [else
     (above/align "left"
                  (report-row (first los))
                  (report-chart (rest los)))]))

(check-expect (report-chart empty) empty-image)
(check-expect (report-chart (list aki ren))
              (above/align "left" (report-row aki) (report-row ren)))
(report-chart students)