;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname students) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; Dasgal 3A
;; 1. count-passing
;; count-passing : List-of-students -> Number
;; Жагсаалт дахь тэнцсэн сурагчдын тоог олно.
(define-struct student [name score])
(define hangai (make-student "Khangai" 45))           
(define bat (make-student "Bat" 85))          
(define saraa (make-student "Saraa" 70))       
(define dorj (make-student "Dorj" 89.6))        

(define students (list hangai bat saraa dorj))   
(define (passing? s)
  (>= (student-score s) 60))
(define (count-passing l)
  (cond
    [(empty? l) 0]
    [else
     (if (passing? (first l))
         (+ 1 (count-passing (rest l)))
         (count-passing (rest l)))]))
(check-expect (count-passing empty) 0)
(check-expect (count-passing students) 3)
(check-expect (count-passing (list hangai)) 0)


;;2. total-final
(define (total-final l)
  (cond
    [(empty? l) 0]
    [else (+ (student-score (first l)) 
             (total-final (rest l)))]))
(check-expect (total-final empty) 0)
(check-expect (total-final students) 289.6)

;; count-students
(define (count-students l)
  (cond [(empty? l) 0] [else (+ 1 (count-students (rest l)))]))
(check-expect (count-students empty) 0)
(check-expect (count-students students) 4)


;; Dasgal 4A
;; 1. passing-students

(define (passing-students l)
  (cond
    [(empty? l) empty]
    [else (if (passing? (first l))
              (cons (first l) (passing-students (rest l)))
              (passing-students (rest l)))]))
(check-expect (passing-students empty) empty)
(check-expect (passing-students students) (list bat saraa dorj))
(check-expect (passing-students (list hangai bat)) (list bat))


;; 2. names
(define (names l)
  (cond [(empty? l) empty]
        [else (cons (student-name (first l))
                    (names (rest l)))]))
(check-expect (names empty) empty)
(check-expect (names students) (list "Khangai" "Bat" "Saraa" "Dorj"))

;; 3.grades

(define (score-to-grade score)
  (cond
    [(>= score 90) "A"]
    [(>= score 80) "B"]
    [(>= score 70) "C"]
    [(>= score 60) "D"]
    [else "F"]))


(define (grades los)
  (cond
    [(empty? los) empty]
    [else (cons (score-to-grade (student-score (first los)))
                (grades (rest los)))]))

(define test-students
  (list (make-student "Anhaa" 85)   ; 85 -> "B"
        (make-student "Temuulen" 65); 65 -> "D"
        (make-student "Nomin" 95)   ; 95 -> "A"
        (make-student "Bilguun" 50))) ; 50 -> "F"

(check-expect (grades test-students) (list "B" "D" "A" "F"))
;; 4
(define (add-bonus s b)
  (make-student (student-name s)
                (+ (student-score s) b)))
(define (bonus-all l b)
  (cond [(empty? l) empty]
        [else (cons (add-bonus (first l) b) (bonus-all (rest l) b))]))
(check-expect (bonus-all empty 10) empty)
(check-expect (bonus-all (list hangai dorj) 10)
              (list (make-student "Khangai" 55) (make-student "Dorj" 99.6)))



;; dasgal 5a

(define (better-student s1 s2)
  (if (>= (student-score s1) (student-score s2))
      s1
      s2))

(define (best-student l)
  (cond
    [(empty? (rest l)) (first l)]
    [else (better-student (first l) (best-student (rest l)))]))

(check-expect (best-student (list hangai)) hangai)
(check-expect (best-student students) dorj)

;; 2. average-final
(define (average-final l) (/ (total-final l) (count-students l)))
(check-expect (average-final (list bat)) 85)
(check-expect (average-final students) 72.4)

;;3. top-name
(define (top-name l) (student-name (best-student l)))
(check-expect (top-name students) "Dorj")



;; 2 alham tentseegui suragchid
(define (failing-students l)
  (cond [(empty? l) empty]
        [else (if (passing? (first l))
                  (failing-students (rest l)) (cons (first l) (failing-students (rest l))))]))
(check-expect (failing-students empty) empty)
(check-expect (failing-students students) (list hangai))

;; count-failing
(define (count-failing l) (- (count-students l) (count-passing l)))
(check-expect (count-failing students) 1)





















