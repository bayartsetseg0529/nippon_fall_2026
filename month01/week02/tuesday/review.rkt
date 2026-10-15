;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname review) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;Sergeeh1
;; kb-to-bytes : Number -> Number
;; килобайтыг байт руу хөрвүүлэх (kB = 1000 byte)
(define (kb-to-bytes kb)
  (* kb 1000))
(kb-to-bytes 2)
;; bytes-to-bits : Number -> Number
;; байтыг бит рүү хөрвүүлэх (1 byte = 8 bits)
(define (bytes-to-bits bytes)
  (* bytes 8))
(bytes-to-bits 2)
;; kb-to-bits : Number -> Number
;; kb-to-bytes болон bytes-to-bits функцийг ашиглан байгуулах (composition)
(define (kb-to-bits kb)
  (bytes-to-bits (kb-to-bytes kb)))
(kb-to-bits 2)

;Sergeeh2
;; can-store? : Number Number -> Boolean
;; файлын хэмжээ, дискний сул зай (KiB) → багтвал #t (Яг тэнцүү үед багтана)
(define (can-store? file-size free-space)
  (<= file-size free-space))
(can-store? 500 512)
(can-store? 512 512)
(can-store? 513 512)

;Sergeeh3
;; item-total : Number Number -> Number
;; үнэ болон тоо ширхэгийг үржүүлж нийт дүнг олох
(define (item-total price qty)
  (* price qty))
;; cheap-order? : Number Number -> Boolean
;; нэгж үнэ, тоо ширхэг → item-total 10000-аас бага бол #t
(define (cheap-order? price qty)
  (< (item-total price qty) 10000))
(cheap-order? 2000 4)
(cheap-order? 2000 5)