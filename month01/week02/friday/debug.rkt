;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname debug) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;Төсөл доторх 6 алдаа

;; 1. Хувь урвуу бодогдож байна
;; Засвар: total болон completed-ийн байрыг солиж, ирсэн/хийсэн ажлыг нийт дүнд хуваана.
(define (assignment-percent-1 completed total)
  (* (/ completed total) 100))
(check-expect (assignment-percent-1 8 10) 80)

;; 2. Дундажийн оронд нийлбэр шалгаж байна
;; Засвар: sum3-ийн оронд 3 тооны дундаж буюу (/ (sum3 s1 s2 s3) 3)-ийг шалгана.
(define (passing-average-2? s1 s2 s3)
  (>= (/ (sum3 s1 s2 s3) 3) 60))
(check-expect (passing-average-2? 20 20 20) #f)

;; 3. Нэг шалгуур мартагдсан
;; Засвар: Даалгавар гүйцэтгэлийн хувь шалгуурыг (assignments-complete?) нэмж оруулна.
(define (eligible-3? s1 s2 s3 attendance completed total)
  (and (passing-average? s1 s2 s3)
       (good-attendance? attendance)
       (assignments-complete? completed total)))
(check-expect (eligible-3? 80 90 70 85 6 10) #f)

;; 4. Хоёр string-ийн байр солигдсон
;; Засвар: True үед "Eligible", False үед "Not eligible" байхаар string-үүдийг солино.
(define (final-status-4 s1 s2 s3 attendance completed total)
  (if (eligible? s1 s2 s3 attendance completed total)
      "Eligible"
      "Not eligible"))
(check-expect (final-status-4 80 90 70 85 8 10) "Eligible")

;; 5. Оролтын тоо таарахгүй
;; Засвар: eligible? функцэд дутуу дамжуулсан total оролтыг нэмж өгнө.
(define (final-status-5 s1 s2 s3 attendance completed total)
  (if (eligible? s1 s2 s3 attendance completed total)
      "Eligible"
      "Not eligible"))
(check-expect (final-status-5 80 90 70 85 8 10) "Eligible")

;; 6. Шалтгааны дараалал буруу
;; Засвар: Хамгийн чухал суурь шалгуур буюу даалгавар дутуу эсэх эсвэл оноо бага эсэхийг зөв дарааллаар шалгах хэрэгтэй. 
(define (ineligibility-reason-6 s1 s2 s3 attendance completed total)
  (cond
    [(not (assignments-complete? completed total)) "Missing assignments"]
    [(not (passing-average? s1 s2 s3)) "Low score"]
    [(not (good-attendance? attendance)) "Low attendance"]
    [else "Eligible"]))
(check-expect (ineligibility-reason-6 59 59 59 50 0 10) "Missing assignments") ; эсвэл тестэнд тохируулан дарааллыг өөрийн спектэйгээ нийцүүлнэ.