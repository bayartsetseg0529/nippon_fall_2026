;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname review) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; Sergeeeh01: Onts suragch
(define-struct student [name score1 score2])

(define mina (make-student "Mina" 95 90))
(define aki1 (make-student "Aki" 80 85)) 

;; honor? : Student -> Boolean
;; Эцсийн оноо 90 ба түүнээс дээш бол #true
(define (honor? s)
  (>= (/ (+ (student-score1 s) (student-score2 s)) 2) 90))

(check-expect (honor? mina) #true)
(check-expect (honor? aki1) #false)
(check-expect (honor? (make-student "Nine" 90 90)) #true)


;; Sergeeh02: Shine struct
(define-struct student2 [name quiz project])

(define aki (make-student2 "Aki" 80 90))
(define sora (make-student2 "Sora" 85 85))

;; swap-scores : Student2 -> Student2
;; quiz ба project оноог сольсон шинэ сурагч буцаана
(define (swap-scores s)
  (make-student2 (student2-name s)
                 (student2-project s)
                 (student2-quiz s)))

(check-expect (swap-scores aki) (make-student2 "Aki" 90 80))
(check-expect (swap-scores sora) sora)

;; sergeeh 03
(require 2htdp/image)
;; pass-label : Student -> Image
;; Тэнцсэн бол ногоон "PASS", үгүй бол улаан "FAIL" 
(define ren (make-student2 "Ren" 50 40))
(define (pass-label s)
  (if (>= (/ (+ (student2-quiz s) (student2-project s)) 2) 60)
      (text "PASS" 16 "green")
      (text "FAIL" 16 "red")))

(check-expect (pass-label aki) (text "PASS" 16 "green"))
(check-expect (pass-label ren) (text "FAIL" 16 "red"))