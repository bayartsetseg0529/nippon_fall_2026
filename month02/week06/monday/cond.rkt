
(define (age-category age)
  (cond
    [(< age 12) "baby"]
    [(and (>= age 12) (<= age 19)) "teenager"]
    [(and (>= age 20) (<= age 65)) "adult"]
    [else "senior"]))
    (check-expect (age-category 5) "baby")
    (check-expect (age-category 15) "teenager")
    (check-expect (age-category 30) "adult")
    (check-expect (age-category 70) "senior")
