;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname practice) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; Дасгал 3A
;; contains? : Number List-of-numbers -> Boolean
;; target list дотор байвал #t
(define (contains? target alon)
  (cond
    [(empty? alon) #f]
    [else (or (= target (first alon))
              (contains? target (rest alon)))]))
(check-expect (contains? 5 empty) #f)
(check-expect (contains? 5 (cons 3 (cons 5 (cons 7 empty)))) #t)
(check-expect (contains? 4 (cons 3 (cons 5 empty))) #f)

;; count-greater-than : List-of-numbers Number -> Number
;; limit-ээс ИХ (тэнцүү биш) тоонуудын тоо
(define (count-greater-than alon limit)
  (cond
    [(empty? alon) 0]
    [(> (first alon) limit) (+ 1 (count-greater-than (rest alon) limit))]
    [else (count-greater-than (rest alon) limit)]))
(check-expect (count-greater-than empty 5) 0)
(check-expect (count-greater-than (cons 2 (cons 8 (cons 10 empty))) 5) 2)
(check-expect (count-greater-than (cons 5 (cons 6 empty)) 5) 1)   ; 5 тоологдохгүй

;;Дасгал 3B NEList-of-numbers

;;;; find-max : NEList-of-numbers -> Number
;; хамгийн их утга max ашиглаж болно: (max 3 8) → 8
(define (find-max nelon)
  (cond
    [(empty? (rest nelon)) (first nelon)]
    [else (max (first nelon) 
               (find-max (rest nelon)))]))
(check-expect (find-max (cons 70 empty)) 70)
(check-expect (find-max (cons 70 (cons 95 (cons 63 empty)))) 95)
(check-expect (find-max (cons -5 (cons -2 empty))) -2)
;; ;; sum : List-of-numbers -> Number
;; Тоон жагсаалтын нийлбэр
(define (sum alon)
  (cond
    [(empty? alon) 0]
    [else (+ (first alon) (sum (rest alon)))]))

;; count-items : List-of-numbers -> Number
;; Жагсаалтын элементүүдийн тоо
(define (count-items alon)
  (cond
    [(empty? alon) 0]
    [else (+ 1 (count-items (rest alon)))]))

;; average : NEList-of-numbers -> Number
;; дундаж = sum / count-items. Хоосон биш тул 0-д хуваахгүй.
(define (average nelon)
  (/ (sum nelon) (count-items nelon)))
(check-expect (average (cons 80 empty)) 80)
(check-expect (average (cons 70 (cons 82 (cons 95 (cons 63 (cons 88 empty)))))) 79.6)
