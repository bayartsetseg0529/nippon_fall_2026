;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname debug) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; Dasgal 4A
;; 1
(define-struct student (name quiz grade))

(define aki (make-student "Aki" 86 "A"))
(define ren (make-student "Ren" 40 "F"))
(define students (list aki ren))

;; Хичээлд тэнцсэн эсэхийг шалгах жишиг функц
(define (passing? s)
  (>= (student-quiz s) 50))
(define (count-students l)
  (cond [(empty? l) 0] ;; Алдаа: [empty? l 1] байсныг 0 болгосон
        [else (+ 1 (count-students (rest l)))]))
(check-expect (count-students students) 2) ;;Алдаа: average-final байсныг count-students болгож зассан.
;; 2 Failing-students
(define (failing-students l)
  (cond [(empty? l) empty]
        [else (if (not (passing? (first l))) ; Алдаа: passing? байсныг (not (passing? ...)) болгон засаж, унасан оюутныг цуглуулав
                  (cons (first l) (failing-students (rest l)))
                  (failing-students (rest l)))]))

(check-expect (failing-students students) (list ren))
;; 3. report-row
(require 2htdp/image)
(define (card-color s)
  (cond
    [(string=? (student-grade s) "A") "green"]
    [(string=? (student-grade s) "B") "green"]
    [else "red"]))
(define (report-row s)
  (beside (text (student-name s) 14 "black")
          (rectangle (* 2 (student-quiz s)) 16 "solid" (card-color s))))
(check-expect (report-row aki)
              (beside (text "Aki" 14 "black") (rectangle 172 16 "solid" "green")))
;; 4. count-grade
(define (count-grade l g)
  (cond [(empty? l) 0]
        [else (if (string=? (student-grade (first l)) g) ; Алдаа: '=' операторыг 'string=?' болгож зассан.
                  (+ 1 (count-grade (rest l) g))
                  (count-grade (rest l) g))]))

(check-expect (count-grade students "A") 1)