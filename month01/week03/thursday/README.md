;; хилийн тест:
(count-passing (list 60 59))
= (+ 1 (count-passing (list 59)))     ; 60 >= 60 → тоологдоно
= (+ 1 (count-passing empty))         ; 59 < 60 → тоологдохгүй
= (+ 1 0)
= 1
;; нэг trace:
lowest (Хамгийн бага оноог олох)
(failing-scores (list 50 70))
= (cons 50 (failing-scores (list 70))) ; 50 < 60 → шүүгдэж орно
= (cons 50 (failing-scores empty))       ; 70 нь 60-аас багагүй → орохгүй
= (cons 50 empty)
= (list 50)
;; зассан нэг алдаа:
DrRacket дээр mixed-scores нэртэй тогтмолыг кодын өөр өөр хэсэгт давхар define хийснээс болж "mixed-scores: this name was defined previously and cannot be re-defined" гэсэн алдаа гарсан.


