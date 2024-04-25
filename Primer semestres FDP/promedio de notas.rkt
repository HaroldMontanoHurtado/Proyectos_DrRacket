;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |promedio de notas|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define (f a b c d f)
  (/ (+ a b c d f) 5)
 )
;(not (= (f)
; (< f 0)
; (> f 5) ))

;(and
; (and (>= a 0.0) (<= a 5.0))
; (and (>= b 0.0) (<= b 5.0))
; (and (>= c 0.0) (<= c 5.0))
; (and (>= d 0.0) (<= d 5.0))
; (and (>= f 0.0) (<= f 5.0)))

(check-expect (f 2 3 4 5 3) 3.4)