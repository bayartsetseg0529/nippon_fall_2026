;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname review) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;Sergeeh 1
;; exam-time? : Number -> Boolean
;; Өгөгдсөн цаг шалгалтын хугацаанд (9-өөс 12 цаг хүртэл, хоёр талдаа орно) 
;; таарч байгаа эсэхийг шалгана.

(define (exam-time? t)
  (and (>= t 9) (<= t 12)))

(check-expect (exam-time? 9) #t)
(check-expect (exam-time? 12) #t)
(check-expect (exam-time? 8) #f)
(check-expect (exam-time? 13) #f)

;;Sergeeh 2
;; bonus-points : Number -> Number
;; Өгсөн оноо 90 ба түүнээс дээш бол 5 нэмэлт оноо, үгүй бол 0 оноо өгнө.

(define (bonus-points score)
  (if (>= score 90)
      5
      0))
(check-expect (bonus-points 90) 5)
(check-expect (bonus-points 89) 0)
;;Sergeeh 3

;; water-state : Number -> String
;; Өгөгдсөн температураас хамааран усны төлөвийг тодорхойлно:
;; 0-ээс бага бол "ice", 0-99 хооронд бол "water", 100 ба түүнээс дээш бол "steam"

(define (water-state temp)
  (cond
    [(< temp 0) "ice"]
    [(<= temp 99) "water"]
    [else "steam"]))

(check-expect (water-state -1) "ice")
(check-expect (water-state 0) "water")
(check-expect (water-state 99) "water")
(check-expect (water-state 100) "steam")
