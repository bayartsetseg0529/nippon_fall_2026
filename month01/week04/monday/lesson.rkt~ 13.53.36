;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname lesson) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;List
;; cons a (const b

(define-struct book(tittle author pages))
;; A book is (make-book String String Number)

(define b1 (make-book "Harry Potter" "Rowling" 320))
(define b2 (make-book "Бяцхан ханхүү" "Exupéry" 96))
(define b3 (make-book "Нууц товчоо" "Тодорхойгүй" 300))
(book-tittle b2)
;; b3 heden huudas
(book-pages b3)
;; b1 zohiogchin hen be
(book-author b1)
;; 
(define(long-book? book)
  (>(book-pages book) 300))

(check-expect (long-book? b1) #true)
(check-expect (long-book? b2) #false)
(check-expect (long-book? b3) #false)   ; яг 300
(check-expect (long-book? (make-book "A" "B" 301)) #true)

;; udurt 20 huudas unshwal nom heden udurt duusahiig tootsool
(define (reading-days b)
  (/ (book-pages b) 20))
(check-expect (reading-days b1) 16)
(check-expect (reading-days b2) 4.8)
(check-expect (reading-days b3) 15)

;; Exercise-02
;; A pet is (make-pet String String Number)
;; name: ner
;; kind : "nohoi", "muur"
;; age : nas(jileer)
(define-struct pet (name kind age))

(define bobo (make-pet "Бобо" "нохой" 3))
(define mimi (make-pet "Мими" "муур" 1))
(define tom  (make-pet "Том"  "муур" 12))


;; dasgal 2B cat?
(define (cat? pet)
  (string=? (pet-kind pet) "муур"))
;; amitan muur bol #true butsaa 
(check-expect (cat? mimi) #true)
(check-expect (cat? tom) #true)
(check-expect (cat? bobo) #false)

;; dasgal 2c:senior?
;; amitan 10 ba tuunees deesh nastai bol #true butsaa
;; senior? : Pet->Boolean
(define(senior? pet)
  (>=(pet-age pet) 10))
(check-expect (senior? tom) #true)
(check-expect (senior? bobo) #false)
(check-expect (senior? (make-pet "Хар" "нохой" 10)) #true)
(check-expect (senior? (make-pet "Цагаан" "муур" 9)) #false) 

;; Dasgal 2D
;; Amitani neg uluulbereer taniltsuuldag function bich
;;pet-intro :pet->String

(define (pet-intro pet)
  (string-append (pet-name pet)
                 " бол "
                 (number->string (pet-age pet))
                 " настай "
                 (pet-kind pet)))                       
(check-expect (pet-intro bobo) "Бобо бол 3 настай нохой")
(check-expect (pet-intro mimi) "Мими бол 1 настай муур")
(check-expect (pet-intro tom) "Том бол 12 настай муур")


;; Exercise-03
(define-struct product (name price qty))
;; A product is (make-product String Number Number)
;; price: negjiin une 
(define pen      (make-product "Үзэг"   500   40))
(define notebook (make-product "Дэвтэр" 1500  0))
(define bag      (make-product "Цүнх"   45000 3))
(define (stock-value p)
  (*(product-price p) (product-qty p)))
(define (in-stock? p)
  (> (product-qty p) 0))
(define(price-with-tax p)
  (* (product-price p) 1.1))

(check-expect (stock-value pen) 20000)
(check-expect (stock-value bag) 135000)
(check-expect (stock-value notebook) 0)
(check-expect (in-stock? pen) #true)
(check-expect (in-stock? bag) #true)
(check-expect (in-stock? notebook) #false)
(check-expect (price-with-tax pen) 550)
(check-expect (price-with-tax notebook) 1650)
(check-expect (price-with-tax bag) 49500)

;;Exercise-4
;; ball (zurag)

(require 2htdp/image)
(define-struct ball (radius color))
(define red-ball (make-ball 20 "red"))
(define big-blue (make-ball 50 "blue"))
(define tiny (make-ball 5 "green"))
;;bumbugiig duuren duguigaar zur
;; draw-ball : Ball-> Image
(define (draw-ball b)
  (circle (ball-radius b) "solid" (ball-color b)))

(check-expect (draw-ball red-ball) (circle 20 "solid" "red"))
(check-expect (draw-ball big-blue) (circle 50 "solid" "blue"))


;; dasgal 4b bigger?
;; 2 bumbug awna ehnii bumbug 2 dahiasaa tom bol true
(define (bigger? b1 b2)
  (>(ball-radius b1) (ball-radius b2)))
(check-expect (bigger? big-blue red-ball) #true)
(check-expect (bigger? red-ball tiny) #true)
(check-expect (bigger? tiny red-ball) #false)
(check-expect (bigger? red-ball red-ball) #false)




;; Dasgal 4c:
;;ball-in-box
;;bumbugiig har hureetei durwuljin dotor zur durwuljingiin tal - 2 X radius + 10
(define (ball-in-box ball)
  (overlay (draw-ball ball) (square (+ (* (ball-radius ball) 2) 10) "outline" "black")))

(check-expect (ball-in-box red-ball)
              (overlay(circle 20 "solid" "red") (square 50 "outline" "black")))

(check-expect (ball-in-box tiny)
              (overlay(circle 5 "solid" "green") (square 20 "outline" "black")))

(check-expect (ball-in-box big-blue)
              (overlay(circle 50 "solid" "blue") (square 110 "outline" "black")))



;; Exercise-05

;; Дасгал 5A: struct, data definition, жишээ, template
;; hulbumbug toglolt burt geriin bag , zochin bag, gerin bagiin gool zochin bagin gool gesn 4 medeelel bii
;; struct, data definition jishee templ
(define-struct game (home away home-goals away-goals))
(define g1 (make-game "Монгол" "Япон" 2 1))
(define g2 (make-game "Бразил" "Солонгос" 1 3))
(define g3 (make-game "Англи" "Франц" 2 2))

(check-expect (game? g1) #true)
(check-expect (game-home g1) "Монгол")
(check-expect (game-away g2) "Солонгос")
(check-expect (game-away-goals g2) 3)


;; togloltiin niit gooliig ol

(define (total-goals g)
  (+ (game-home-goals g) (game-away-goals g)))
(check-expect (total-goals g1) 3)
(check-expect (total-goals g2) 4)
(check-expect (total-goals g3) 4)
(check-expect (total-goals (make-game "A" "B" 0 0)) 0)


;; hojson bagiin neriig butsaa tentsen bol tentsee gej butsaa
;;winner : Game -> String

(define (winner g)
  (cond
    [(> (game-home-goals g) (game-away-goals g)) (game-home g)]
    [(< (game-home-goals g) (game-away-goals g)) (game-away g)]
    [else "Тэнцээ"]))
(check-expect (winner g1) "Монгол")
(check-expect (winner g2) "Солонгос")
(check-expect (winner g3) "Тэнцээ")
(check-expect (winner (make-game "A" "B" 0 0)) "Тэнцээ")

;; togloltin dung neg mur bolgoj bich
;; score-line : Game -> String

(define (score-line game)
  (string-append (game-home game) " " (number->string (game-home-goals game)) ":"
                 (number->string (game-away-goals game)) " " (game-away game)))

(check-expect (score-line g1) "Монгол 2:1 Япон" )
(check-expect (score-line g2) "Бразил 1:3 Солонгос" )
(check-expect (score-line g3) "Англи 2:2 Франц" )


;; Exercise-06

(define-struct student (name quiz project))
;; A Student is (make-student String Number Number)
;; name    : сурагчийн нэр
;; quiz    : quiz оноо, 0–100
;; project : project оноо, 0–100

(define aki (make-student "Aki" 80 90))
(define sora (make-student "Sora" 60 60))
(define mina (make-student "Mina" 95 91))
(define ren (make-student "Ren" 45 55))

;; Дасгал 1: final-score, эцсийн оноо (15 мин)
;; Асуулт: Эцсийн оноог тооцоол. Quiz нь 40%, project нь 60% жинтэй.
;; final-score : Student -> Number
;; quiz * 0.4 + project * 0.6

(define (final-score s)
  (+ (* (student-quiz s) 0.4)
     (* (student-project s) 0.6)))

(check-expect (final-score aki) 86)
(check-expect (final-score sora) 60)
(check-expect (final-score mina) 92.6)
(check-expect (final-score ren) 51)
(check-expect (final-score (make-student "Zero" 0 0)) 0)


;; Дасгал 2: passed?, тэнцсэн эсэх (10 мин)
;; Асуулт: Эцсийн оноо 60 ба түүнээс дээш бол #true буцна. 1-р дасгалын final-score-ийг ашигла.
;; passed? : Student -> Boolean

(define (passed? s)
  (>= (final-score s) 60))

(check-expect (passed? aki) #true)
(check-expect (passed? sora) #true)  
(check-expect (passed? mina) #true)
(check-expect (passed? ren) #false)

(check-expect (passed? (make-student "Uka" 100 34)) #true)
(check-expect (passed? (make-student "Bat" 100 33)) #false) 




















