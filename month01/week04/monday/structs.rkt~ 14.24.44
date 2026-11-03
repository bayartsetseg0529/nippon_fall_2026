;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname structs) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define-struct student (name quiz project))
;; A Student is (make-student String Number Number)
;; name    : сурагчийн нэр
;; quiz    : quiz оноо, 0–100
;; project : project оноо, 0–100
(define aki  (make-student "Munkhjin"  90 90))
(define sora (make-student "Bilegt" 60 60))
(define mina (make-student "Khulan" 95 91))
(define ren  (make-student "Itgelt"  45 55))
;;(make-student "Aki" 80 90)
;;(student-name aki)
;;(student-quiz aki)
;;(student-project aki)
;;(student? aki)
(check-expect (student-name aki) "Munkhjin")
(check-expect (student-quiz aki) 90)
(check-expect (student-project aki) 90)
(check-expect (student? aki) #true)


