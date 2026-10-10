;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname debug) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; 1. Хаалт дутуу
(define (shipping-fee-1 amount)
  (if (>= amount 50000) 0 3000)) ; <- if хаалт хаагдаагүй байсныг нэмсэн
(check-expect (shipping-fee-1 100) 3000)
(check-expect (shipping-fee-1 60000) 0)

;; 2. cond-ийн дараалал буруу
(define (speed-label-2 speed)
  (cond
    [(>= speed 60) "fast"] ; <- cond нөхцөлүүд бага утгаас эхэлж шалгагдсанаас болж 70 хурд буруу салбар руу орсныг өндөр утгаас нь эхлүүлж зассан
    [(>= speed 30) "normal"]
    [else "slow"]))
(check-expect (speed-label-2 70) "fast")
(check-expect (speed-label-2 40) "normal")
(check-expect (speed-label-2 10) "slow")
;; 3. else байхгүй, нэг тохиолдол дутуу
(define (battery-label-3 percent)
  (cond
    [(<= percent 10) "empty"]
    [(<= percent 50) "low"]
    [(< percent 100) "ok"]
    [else "full"])) ; <- 100% буюу үлдсэн тохиолдлыг барих else салбар дутуу байсныг нэмсэн
(check-expect (battery-label-3 100) "full")
(check-expect (battery-label-3 5) "empty")   
(check-expect (battery-label-3 30) "low")     
(check-expect (battery-label-3 80) "ok")      
;; 4. Хил 80 буруу branch-д орсон
(define (good-attendance-4? attendance)
  (>= attendance 80)) ; <- '>' тэмдэг ашигласан тул 80 орж ирэхэд худал болж байсныг '>=' болгож зассан
(check-expect (good-attendance-4? 80) #t)

;; 5. and, or сольсон
(define (eligible-basic-5? score attendance)
  (and (>= score 60) (>= attendance 80))) ; <- or ашигласан байсныг хоёулаа биелэх ёстой тул and болгож зассан
(check-expect (eligible-basic-5? 40 90) #f)
(check-expect (eligible-basic-5? 70 90) #t)
(check-expect (eligible-basic-5? 70 50) #f)