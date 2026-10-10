;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname review) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;Sergeeh 1
;; hours-to-seconds : Number -> Number
(define (hours-to-seconds hours)
  (* hours 3600))

;; days-to-hours : Number -> Number
(define (days-to-hours days)
  (* days 24))

;; days-to-seconds : Number -> Number
;; days-to-hours, hours-to-seconds-г дуудна
(define (days-to-seconds days)
  (hours-to-seconds (days-to-hours days)))

(check-expect (days-to-hours 2) 48)
(check-expect (days-to-seconds 1) 86400)

;;sergeeh 2
;; in-range? : Number -> Boolean
(define (in-range? n)
  (and (>= n 1) (<= n 10)))

;; outside-range? : Number -> Boolean
;; n нь 1–10-ийн гадна бол #t
(define (outside-range? n)
  (not (in-range? n)))

(check-expect (outside-range? 0) #t)
(check-expect (outside-range? 1) #f)
(check-expect (outside-range? 10) #f)
(check-expect (outside-range? 11) #t)

;;sergeeh 3
;; grade-change : Number Number -> String
;; хуучин оноо, шинэ оноо → "up", "same", "down"
(define (grade-change old-score new-score)
  (cond
    [(< old-score new-score) "up"]
    [(= old-score new-score) "same"]
    [(> old-score new-score) "down"]))

(check-expect (grade-change 70 80) "up")
(check-expect (grade-change 80 80) "same")
(check-expect (grade-change 90 80) "down")