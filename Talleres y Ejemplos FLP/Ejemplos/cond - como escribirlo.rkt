;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |cond - como escribirlo|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
; Ejemplo de la estructura cond

(define (f x)
  (cond 
    [(> x 5)
     "Correcto, es mayor o igual a 5"]
    [()
     ]
    [else
     "Falso, es menor que 5"]
   )
 )