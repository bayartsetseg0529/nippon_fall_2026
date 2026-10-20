;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname debug) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;1 Жинг сольсон
(define-struct student (name quiz project))

(define aki (make-student "Aki" 90 80))
(define sora (make-student "Sora" 60 60))
(define ren (make-student "Ren" 95 90))
(define mina (make-student "Mina" 50 55))

(define (letter-grade score)
  (cond
    [(>= score 90) "A"]
    [(>= score 80) "B"]
    [(>= score 70) "C"]
    [(>= score 60) "D"]
    [else "F"]))

(define (final-score s)
  (+ (* 0.4 (student-quiz s))
     (* 0.6 (student-project s))))

(check-expect (final-score aki) 84)

;;2  > нь яг 60-ийг унагаана: >= 

(define (passing? s)
  (>= (final-score s) 60))

(check-expect (passing? sora) #true)


;;3 Талбарын дараалал буруу: quiz хоёрдугаарт, project гуравдугаарт.
(define (add-bonus s b)
  (make-student (student-name s)
                (student-quiz s)
                (min 100 (+ (student-project s) b))))

(check-expect (add-bonus aki 5) (make-student "Aki" 90 85))

;;4 letter-grade тоо хүлээнэ

(define (student-grade s)
  (letter-grade (final-score s)))

(check-expect (student-grade aki) "B")



(define (retake-quiz s new-quiz-score)
  (make-student (student-name s)
                (max (student-quiz s) new-quiz-score)
                (student-project s)))