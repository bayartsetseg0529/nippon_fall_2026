;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname review) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;Сэргээх 1
;;Гурван оронтой тооны цифр (L7)

;; sum-digits-3 : Number -> Number
;; гурван оронтой тооны цифрүүдийн нийлбэр. remainder, quotient ашигла.
(define (sum-digits-3 n)
  (+ (quotient n 100)                     ; Зуутын орны цифр
     (remainder (quotient n 10) 10)       ; Арваатын орны цифр
     (remainder n 10)))                  ; Нэгийн орны цифр

(check-expect (sum-digits-3 507) 12)
(check-expect (sum-digits-3 100) 1)
(check-expect (sum-digits-3 999) 27)

;;Сэргээх 2
;;Struct авдаг function
;; Student бүтцийг тодорхойлох
(define-struct student (name quiz project))

;; quiz-gap : Student -> Number
;; quiz ба project онооны зөрүү (үргэлж эерэг). abs ашигла.
(define (quiz-gap s)
  (abs (- (student-quiz s) (student-project s))))

;; (Test data)
(define aki (make-student "Aki" 80 70))   ; quiz: 80, project: 70 (Зөрүү нь 10)
(define sora (make-student "Sora" 85 85)) ; quiz: 85, project: 85 (Зөрүү нь 0)

(check-expect (quiz-gap aki) 10)
(check-expect (quiz-gap sora) 0)
(check-expect (quiz-gap (make-student "Zul" 90 70)) 20)



;;Сэргээх 3
;;List дээр тоолох

;; count-a-scores : List-of-numbers -> Number
;; 90 ба түүнээс дээш оноо хэд байгааг тоолно
(define (count-a-scores lon)
  (cond
    [(empty? lon) 0]
    [(>= (first lon) 90) (+ 1 (count-a-scores (rest lon)))]
    [else (count-a-scores (rest lon))]))

(check-expect (count-a-scores empty) 0)
(check-expect (count-a-scores (list 90 89 100)) 2)
