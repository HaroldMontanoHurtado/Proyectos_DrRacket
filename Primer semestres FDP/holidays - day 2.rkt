;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |holidays - day 2|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;autor: Harold Montano 201968067-3743
;fecha: 13 de noviembre, 2019
;contraro: f:num-> num
;proposito: esta funcion si recibe un numero menor que 0, retorna el numero al cuadrado,
;si recibe un numero entre 0 y 5, retorna el mismo numero,
;si recibe un numero mayor que 5, retorna el numero al cubo.
;ejemplo: (f -2)-> 4 ; (f -3)-> 9 ; (f 2)-> 2 ; (f 3)-> 3 ; (f 6)-> 216 ; (f 9)-> 729
;definicion:
(define (f x)
   (cond
     [(< x 0) (sqr x)]
     [(and (>= x 0) (<= x 5) ) x]
     [else (expt x 3)]
    )
 )
;pruebas:
(check-expect (f -2) 4)
(check-expect (f -3) 9)
(check-expect (f 2) 2)
(check-expect (f 3) 3)
(check-expect (f 6) 216)
(check-expect (f 9) 729)