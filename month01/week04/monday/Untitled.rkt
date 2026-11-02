;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Untitled) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; 1. student-total   Дасгал 7A , 3 function
(define-struct student (name quiz project))

(define aki  (make-student "Aki"  80 90))
(define sora (make-student "Sora" 60 60))
(define mina (make-student "Mina" 95 91))
(define ren  (make-student "Ren"  45 55))
(define (student-total s)
  (+ (student-quiz s)
     (student-project s)))
(check-expect (student-total aki) 170)
(check-expect (student-total (make-student "Zero" 0 0)) 0)
;; 2. project-better?
(define (project-better? s)
  (> (student-project s)
     (student-quiz s)))
(check-expect (project-better? aki) #true)
(check-expect (project-better? sora) #false)
(check-expect (project-better? mina) #false)
;; 3. quiz-passed?
(define (quiz-passed? s)
  (>= (student-quiz s) 60))
(check-expect (quiz-passed? sora) #true)
(check-expect (quiz-passed? ren) #false)
(check-expect (quiz-passed? (make-student "Uka" 59 100)) #false)

;; Dasgal 7B  Зураг: name-tag
;; 1. name-tag
(require 2htdp/image)
(define (name-tag s)
  (overlay (text (student-name s) 18 "black")
           (rectangle 120 36 "outline" "blue")))
(check-expect (name-tag aki)
              (overlay (text "Aki" 18 "black") (rectangle 120 36 "outline" "blue")))
(name-tag aki)