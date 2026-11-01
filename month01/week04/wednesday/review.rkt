;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname review) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;2. final-score

(define-struct student [name quiz project])
;; Student нь (make-student String Number Number) бүтэцтэй байна.
(define aki (make-student "Aki" 80 90))
(define sora (make-student "Sora" 60 60))
(define mina (make-student "Mina" 95 91))
(define ren (make-student "Ren" 45 55))

;; final-score : Student -> Number
;; Сурагчийн квизийн онооны 40%, төслийн онооны 60%-иар эцсийн оноог тооцоолно.

(check-expect (final-score aki) 86)
(check-expect (final-score sora) 60)
(check-expect (final-score mina) 92.6)
(check-expect (final-score ren) 51)
(check-expect (final-score (make-student "Q" 100 0)) 40)
(check-expect (final-score (make-student "P" 0 100)) 60)
(define (final-score s)
  (+ (* 0.4 (student-quiz s))
     (* 0.6 (student-project s))))

;;Dasgal 3A
;; passing? : Student -> Boolean
;; Сурагчийн эцсийн оноо 60 ба түүнээс дээш бол #true, бусад тохиолдолд #false буцаана.
(define (passing? s)
  (>= (final-score s) 60))
(check-expect (passing? sora) #true)
(check-expect (passing? ren) #false)
(check-expect (passing? (make-student "Edge" 59 61)) #true)
(check-expect (passing? (make-student "Low" 61 59)) #false)   