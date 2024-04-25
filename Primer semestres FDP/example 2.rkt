;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |example 2|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; 1. dar un nombre
; 2. Describir el prototipo
; 3. dar ejemplos. caracaterizar la relación entrada-salida
; 5. cuerpo definir. el CODIGO
; &. Pruebas. ejecutar la función

; variable es un nombre
; x=5 -> (define x 5)
; y=8 -> (define x 8)
; si uso las variables
; (+ x y) -> deberia ser = 11
; (- y x) = 3


(define a (expt 5 (sqrt 7)) )
(define b (sqrt 8) )
(define c (sqr 7) )
(define x (+ a b c))

(define d (sqr 3) )
(define f (/ 1 (+ (sqr 3) (sqr 8) (sqrt 9))))
(define y (expt (+ d f) (/ 1 3)))

(expt (/ x y ) (/ 1 8)
 )
