;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname students) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
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
  
;; 4. student-grade: хуучин function-аа дахин ашиглах
(define (letter-grade n)
  (cond [(>= n 90) "A"]
        [(>= n 80) "B"]
        [(>= n 70) "C"]
        [(>= n 60) "D"]
        [else "F"]))
(define (student-grade s) (letter-grade (final-score s)))
;; student-grade : Student -> String
;; эцсийн онооны үсгэн үнэлгээ
(check-expect (student-grade aki) "B")
(check-expect (student-grade sora) "D")
(check-expect (student-grade mina) "A")
(check-expect (student-grade ren) "F")
(check-expect (student-grade (make-student "Nine" 90 90)) "A")
;;Дасгал 5A,2 function
;; 1. add-bonus
;; add-bonus : Student Number -> Student
;; project оноонд bonus нэмнэ, гэхдээ 100-аас хэтрэхгүй (min ашигла)
(define (add-bonus s b) (make-student (student-name s)
                                      (student-quiz s) (min 100 (+ (student-project s) b))))
(check-expect (add-bonus aki 5) (make-student "Aki" 80 95))
(check-expect (add-bonus mina 20) (make-student "Mina" 95 100))
(check-expect (add-bonus ren 0) ren)
;; 2. retake-quiz
;; retake-quiz : Student Number -> Student
;; quiz-ийг дахин өгсөн: шинэ оноо их бол түүнийг, үгүй бол хуучныг үлдээнэ (max)
(define (retake-quiz s new) (make-student (student-name s)
                                          (max new (student-quiz s)) (student-project s)))
(check-expect (retake-quiz ren 70) (make-student "Ren" 70 55))
(check-expect (retake-quiz aki 50) aki)

;;Дасгал 6A, Сурагчийн карт
;; 1. card-color
;; card-color : Student -> String
;; тэнцсэн бол "green", үгүй бол "red"
(define (card-color s)
  (if (passing? s) "green" "red" ))
(check-expect (card-color aki) "green")
(check-expect (card-color ren) "red")

;; student-card
;; student-card : Student -> Image
;; нэр (18, хар), доор нь үсгэн үнэлгээ (24, card-color), card-color хүрээ (120 × 70)
(require 2htdp/image)
(define (student-card s) (overlay (above (text (student-name s) 18 "black")
                                         (text (student-grade s) 24 (card-color s)))
                                  (rectangle 120 70 "outline" (card-color s))))
(check-expect (student-card aki)
              (overlay (above (text "Aki" 18 "black") (text "B" 24 "green"))
                       (rectangle 120 70 "outline" "green")))
(check-expect (student-card ren)
              (overlay (above (text "Ren" 18 "black") (text "F" 24 "red"))
                       (rectangle 120 70 "outline" "red")))
  (student-card aki)
(student-card ren)








