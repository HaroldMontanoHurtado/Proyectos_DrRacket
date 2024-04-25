;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |formula general|) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp")) #f)))
;ecuacion cuadratica general
(define (x a b c) 
;    (and
     (/ (+ (* -1 b) (sqrt (- (sqr b) (* 4 a c) ) ))
           (* 2 a) )
        (/ (- (* -1 b) (sqrt (- (sqr b) (* 4 a c) ) ))
           (* 2 a)
           ))
;  )



;ecuacion
(x 3 9 6)