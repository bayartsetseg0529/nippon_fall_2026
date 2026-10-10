;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Dasgal2B) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(and #t #t)
(and #t #f)
(or #f #f)
(or #f #t)
(not #t)
(not #f)
(and (> 8 3) (even? 10))
(or (< 1 0) (= 6 (+ 3 3)))
(not (positive? -2))
(and (>= 60 60) (>= 79 80))



;Dasgal 2B
;; 1. teen?
;; teen? : Number -> Boolean
;; age 13-аас 19 хүртэл (хоёр талдаа орно) бол #t
(define (teen? age)
  (and (>= age 13) (<= age 19)))
(check-expect (teen? 13) #t)
(check-expect (teen? 19) #t)
(check-expect (teen? 12) #f)
(check-expect (teen? 20) #f)
;; 2. weekend?
;; weekend? : Number -> Boolean
;; долоо хоногийн өдрийн дугаар (1 = Даваа ... 7 = Ням) 6 эсвэл 7 бол #t
(define (weekend? day)
  (or (= day 6) (= day 7)))
(check-expect (weekend? 6) #t)
(check-expect (weekend? 7) #t)
(check-expect (weekend? 5) #f)
;; 3. scholarship?
;; scholarship? : Number Number -> Boolean
;; score 90 ба түүнээс дээш, attendance 80 ба түүнээс дээш бол #t
(define (scholarship? score attendance)
  (and (>= score 90) (>= attendance 80)))
(check-expect (scholarship? 90 80) #t)
(check-expect (scholarship? 89 100) #f)
(check-expect (scholarship? 100 79) #f)
;; 4. not-passing?
;; not-passing? : Number -> Boolean
;; Даваагийн passing-score?-г not-оор урвуулна (score 60-аас доош байвал #t)
(define (passing-score? score)
  (>= score 60))
(define (not-passing? score)
  (not (passing-score? score)))
(check-expect (not-passing? 59) #t)
(check-expect (not-passing? 60) #f)
