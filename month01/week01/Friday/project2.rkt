;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname project2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;Project 3: Аяллын тооцоолуур

; Функцийн нэр: travel-time
; Оролт: distance, speed (Зай, хурд)
; Гаралт: Зорчих хугацаа (цаг)
; Томьёо: distance / speed
(define (travel-time distance speed)
  (/ distance speed))
(travel-time 300 60)
; Функцийн нэр: fuel-needed
; Оролт: distance, rate-per-km (Зай, км тутамд зарцуулах түлш)
; Гаралт: Шаардлагатай түлшний хэмжээ
; Томьёо: distance * rate-per-km
(define (fuel-needed distance rate-per-km)
  (* distance rate-per-km))
(fuel-needed 200 0.08)
; Функцийн нэр: fuel-cost
; Оролт: fuel-amount, price-per-unit (Түлшний хэмжээ, нэгжийн үнэ)
; Гаралт: Түлшний нийт өртөг
; Томьёо: fuel-amount * price-per-unit
(define (fuel-cost fuel-amount price-per-unit)
  (* fuel-amount price-per-unit))
(fuel-cost 22 5000)
; Функцийн нэр: total-distance
; Оролт: d1, d2 (Хоёр өөр өдрийн зам)
; Гаралт: Нийт туулсан зай
; Томьёо: d1 + d2
(define (total-distance d1 d2)
  (+ d1 d2))
(total-distance 100 210)
; Функцийн нэр: distance-per-day
; Оролт: total-distance, days (Нийт туулсан зай, аялсан хоногийн тоо)
; Гаралт: Өдөрт дунджаар туулах зай
; Томьёо: total-distance / days
(define (distance-per-day total-distance days)
  (/ total-distance days))
(distance-per-day 1200 5)

