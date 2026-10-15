;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname practice) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;Dasgal 3A

;; 1. minutes-to-seconds, hours-to-seconds

;; minutes-to-seconds : Number -> Number
(define (minutes-to-seconds m)
  (* m 60))

(check-expect (minutes-to-seconds 2) 120)


;; hours-to-seconds : Number -> Number
;; minutes-to-seconds-г дуудна (1 цаг = 60 минут)
(define (hours-to-seconds h)
  (minutes-to-seconds (* h 60)))

(check-expect (hours-to-seconds 1) 3600)
(check-expect (hours-to-seconds 2) 7200)


;; 2. mib-to-bits
;; (Жич: Тухайн бодлогод kib-to-bits гэж байгаа тул эхлээд түүнийг тодорхойлно, 
;; 1 KiB = 1024 bytes = 8192 bits эсвэл 1 KiB = 1024 * 8 bits гэх мэт)
;; 1 MiB = 1024 KiB, 1 KiB = 1024 bytes, 1 byte = 8 bits гэж үзвэл:
(define (kib-to-bits kib)
  (* kib 1024 8))

;; mib-to-bits : Number -> Number
;; 1 MiB = 1024 KiB. Даваагийн kib-to-bits-г дуудна.
(define (mib-to-bits mib)
  (kib-to-bits (* mib 1024)))

(check-expect (mib-to-bits 1) 8388608)


;; 3. fahrenheit-to-celsius, fahrenheit-to-kelvin

;; fahrenheit-to-celsius : Number -> Number
;; C = (F - 32) × 5/9
(define (fahrenheit-to-celsius f)
  (* (- f 32) (/ 5 9)))

(check-expect (fahrenheit-to-celsius 212) 100)
(check-expect (fahrenheit-to-celsius 32) 0)


;; fahrenheit-to-kelvin : Number -> Number
;; K = C + 273.15. fahrenheit-to-celsius-г дуудна.
(define (fahrenheit-to-kelvin f)
  (+ (fahrenheit-to-celsius f) 273.15))

(check-expect (fahrenheit-to-kelvin 32) 273.15)


;; 4. tax-amount, price-with-tax

;; item-total (Өмнөх бодлогоос шаардагдах тул тодорхойлно: нэгж үнэ * тоо ширхэг)
(define (item-total price qty)
  (* price qty))

;; tax-amount : Number Number -> Number
;; нийт үнэ ба татварын хувь (10 = 10%) → татварын хэмжээ
(define (tax-amount total rate)
  (* total (/ rate 100)))

(check-expect (tax-amount 3000 10) 300)


;; price-with-tax : Number Number Number -> Number
;; нэгж үнэ, тоо ширхэг, хувь → татвартай нийт үнэ.
;; Даваагийн item-total ба tax-amount-г дуудна.
(define (price-with-tax price qty rate)
  (+ (item-total price qty) 
     (tax-amount (item-total price qty) rate)))

(check-expect (price-with-tax 1000 3 10) 3300)
(check-expect (price-with-tax 1000 3 0) 3000)

;Нэг дуудлагыг гараар trace хийх (Жишээ: (price-with-tax 1000 3 10))
;(price-with-tax 1000 3 10) функцийг дуудна (price = 1000, qty = 3, rate = 10).
;let блокийн доторх (item-total 1000 3) ажиллана:
;item-total функцэд утгууд очиж (* 1000 3) буюу 3000 гарна (subtotal = 3000).
;Үндсэн илэрхийлэл (+ subtotal (tax-amount subtotal rate)) руу subtotal = 3000, rate = 10 утгууд орно.
;(tax-amount 3000 10) хэсэг ажиллана:
;tax-amount функц (* 3000 (/ 10 100)) буюу (* 3000 0.1)-ийг тооцоолж 300 гарна.
;Эцэст нь (+ 3000 300) үйлдэл хийгдэж 3300 гэсэн эцсийн үр дүнг буцаана.

;Дасгал 4A
;Олон нөхцөлтэй predicate

;; 1. valid-percent?
;; valid-percent? : Number -> Boolean
;; 0-ээс 100 хүртэл (хоёр талдаа орно) бол #t
(define (valid-percent? p)
  (and (>= p 0) (<= p 100)))

(check-expect (valid-percent? 0) #t)
(check-expect (valid-percent? 100) #t)
(check-expect (valid-percent? -1) #f)
(check-expect (valid-percent? 101) #f)


;; 2. weekday?
;; weekday? : Number -> Boolean
;; өдрийн дугаар (1 = Даваа ... 7 = Ням) 1–5 бол #t
(define (weekday? day)
  (and (>= day 1) (<= day 5)))

(check-expect (weekday? 1) #t)
(check-expect (weekday? 5) #t)
(check-expect (weekday? 6) #f)


;; 3. eligible-basic?
;; eligible-basic? : Number Number -> Boolean
;; score 60 ба түүнээс дээш, attendance 80 ба түүнээс дээш бол #t
(define (eligible-basic? score attendance)
  (and (>= score 60) (>= attendance 80)))

(check-expect (eligible-basic? 60 80) #t)
(check-expect (eligible-basic? 59 100) #f)
(check-expect (eligible-basic? 100 79) #f)


;; 4. needs-help?
;; needs-help? : Number Number -> Boolean
;; eligible-basic? биш бол #t. not ба eligible-basic?-г ашигла.
(define (needs-help? score attendance)
  (not (eligible-basic? score attendance)))

(check-expect (needs-help? 59 100) #t)
(check-expect (needs-help? 60 80) #f)

;;Дасгал 5A

;; 1. parking-fee (2 сонголт -> if ашиглана)
;; parking-fee : Number -> Number
;; 2 цаг хүртэл (2 орно) үнэгүй, түүнээс их бол 2000
(define (parking-fee hours)
  (if (<= hours 2)
      0
      2000))

(check-expect (parking-fee 2) 0)
(check-expect (parking-fee 3) 2000)


;; 2. smaller (2 сонголт -> if ашиглана)
;; smaller : Number Number -> Number
;; хоёр тооны бага нь
(define (smaller a b)
  (if (<= a b)
      a
      b))

(check-expect (smaller 3 8) 3)
(check-expect (smaller 8 3) 3)
(check-expect (smaller 5 5) 5)


;; 3. speed-label (4 сонголт -> cond ашиглана)
;; speed-label : Number -> String
;; км/ц: 30-аас бага "slow", 30–59 "normal", 60–99 "fast", 100 ба түүнээс дээш "too fast"
(define (speed-label speed)
  (cond
    [(>= speed 100) "too fast"]
    [(>= speed 60) "fast"]
    [(>= speed 30) "normal"]
    [else "slow"]))

(check-expect (speed-label 29) "slow")
(check-expect (speed-label 30) "normal")
(check-expect (speed-label 59) "normal")
(check-expect (speed-label 60) "fast")
(check-expect (speed-label 99) "fast")
(check-expect (speed-label 100) "too fast")


;; 4. battery-label (4 сонголт -> cond ашиглана)
;; battery-label : Number -> String
;; 0–100%: 10 хүртэл "empty", 11–50 "low", 51–99 "ok", 100 "full"
(define (battery-label bat)
  (cond
    [(= bat 100) "full"]
    [(>= bat 51) "ok"]
    [(>= bat 11) "low"]
    [else "empty"]))

(check-expect (battery-label 10) "empty")
(check-expect (battery-label 11) "low")
(check-expect (battery-label 50) "low")
(check-expect (battery-label 51) "ok")
(check-expect (battery-label 99) "ok")
(check-expect (battery-label 100) "full")


;; 5. report-status (3 сонголт -> cond ашиглана)
;; report-status : Number Number -> String
;; score, attendance:
;;   eligible-basic? үнэн бол         "pass"
;;   score >= 60 боловч ирц хүрэхгүй   "attendance"
;;   бусад                            "retake"
(define (report-status score attendance)
  (cond
    [(eligible-basic? score attendance) "pass"]
    [(>= score 60) "attendance"]
    [else "retake"]))

(check-expect (report-status 60 80) "pass")
(check-expect (report-status 70 50) "attendance")
(check-expect (report-status 40 90) "retake")

