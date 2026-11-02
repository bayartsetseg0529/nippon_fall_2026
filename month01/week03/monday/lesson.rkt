;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname lesson) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; Ex04
;; List яг хоёр элементтэй эсэх
;; exactly-two? : List-of-numbers -> Boolean
;; List яг хоёр элементтэй бол #true буцаана.
;; Tip: cons ашиглах
;; Гурван нөхцөлийг шалгана.
;; 1. List хоосон биш.
;; 2. Эхний элементийн дараа бас нэг элемент байна.
;; 3. Хоёр дахь элементийн дараа list хоосон байна.

(define (exactly-two? numbers)
  (and
   (cons? numbers)
   (cons? (rest numbers))
   (empty? (rest (rest numbers)))))

(check-expect (exactly-two? empty) #false)

(check-expect
  (exactly-two? (cons 5 empty))
  #false)

(check-expect
  (exactly-two? (cons 5 (cons 10 empty)))
  #true)

(check-expect
  (exactly-two? (cons 5 (cons 10 (cons 15 empty))))
  #false)

;; Ex04A
;; хоосон list
(define no-scores empty)

;; 1 элементтэй list: 70, дараа нь хоосон
(define one-score (cons 70 empty))

;; 3 элементтэй list: 70, 82, 95
(define scores (cons 70 (cons 82 (cons 95 empty))))
(define temps (cons -5 (cons 0 (cons 12 empty))))
(define names (cons "Aki" (cons "Mina" (cons "Sora" empty))))
(define my-numbers (cons 1 (cons 2 (cons 3 (cons 4 empty)))))
(define todo empty)
(define single (cons 100 empty))
;; Ex05
;; first-three-total : List-of-numbers -> Number
;; List-ийн эхний гурван элементийн нийлбэрийг буцаана.
;; List дор хаяж гурван элементтэй байна.
(define (first-three-total prices)
  (+ (first prices)
     (first (rest prices))
     (first (rest (rest prices)))))
(define prices
  (cons 2500
    (cons 4000
      (cons 1500 empty))))

(check-expect (first-three-total prices) 8000)

(check-expect
  (first-three-total (cons 100 (cons 200 (cons 300 empty))))
  600)

;; Dasgal 7A 4 function
;; second-item : List-of-numbers -> Number
;; дор хаяж 2 элементтэй list-ийн хоёр дахь утга
;; 1. second-item
(define (second-item nums)
  (first (rest nums)))
(check-expect (second-item (cons 4 (cons 7 empty))) 7)
(check-expect (second-item (cons 4 (cons 7 (cons 9 empty)))) 7)
;; 2. sum-first-two
;; sum-first-two : List-of-numbers -> Number
;; дор хаяж 2 элементтэй list-ийн эхний хоёр утгын нийлбэр
(define (sum-first-two nums)
  (+ (first nums) (first (rest nums))))

(check-expect (sum-first-two (cons 4 (cons 7 (cons 9 empty)))) 11)

;; 3. starts-with-zero?
;; starts-with-zero? : List-of-numbers -> Boolean
;; хоосон биш, эхний утга нь 0 бол #t. Хоосон list дээр алдаа гаргахгүй байх ёстой.
(define (starts-with-zero? nums)
  (cond
    [(empty? nums) #false]
    [else (= (first nums) 0)]))
(check-expect (starts-with-zero? empty) #f)
(check-expect (starts-with-zero? (cons 0 empty)) #t)
(check-expect (starts-with-zero? (cons 5 (cons 0 empty))) #f)

;; 4. one-item?
;; one-item? : List-of-numbers -> Boolean
;; яг нэг элементтэй бол #t
(define (one-item? nums)
  (and (cons? nums)
       (empty? (rest nums))))
(check-expect (one-item? empty) #f)
(check-expect (one-item? (cons 1 empty)) #t)
(check-expect (one-item? (cons 1 (cons 2 empty))) #f)


;; Dasgal 8. zurgiin list
(require 2htdp/image)

;; List-of-images is one of:
;; – empty
;; – (cons Image List-of-images)
(define shapes
  (cons (circle 20 "solid" "red")
        (cons (rectangle 40 40 "solid" "blue")
              empty)))
(first shapes)
(first (rest shapes))
;;Dasgal 8A
;; first-two-beside : List-of-images -> Image
;; дор хаяж 2 зурагтай list-ийн эхний хоёрыг зүүнээс баруун тийш тавина
(define (first-two-beside imgs)
  (beside (first imgs) (first (rest imgs))))

(check-expect (first-two-beside shapes)
              (beside (circle 20 "solid" "red") (rectangle 40 40 "solid" "blue")))
(first-two-beside shapes)









