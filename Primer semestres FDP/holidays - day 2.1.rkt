;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |holidays - day 2.1|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;autor: Harold Montano 201968067-3743
;fecha: 13/nov/2019
;Contrato: Num -> boolean
;descripcion: esta funcion recibe un numero y retorna un boleano
;ejemplo:
;(verificar-rango 3) -> #t
;(verificar-rango -12) -> #f
;(verificar-rango 15) -> #t
;(verificar-rango 24) -> #f
;(verificar-rango 100) -> #f

;definicion
(define (verificar-rango x)
   (or
    (and (> x -10) (<= x 8))
    (and (> x 10) (<= x 20))
    (and (> x 33) (<= x 66))
    (and (> x 100) (<= x 200))
    (and (>= x 500) (< x 1000))
    (and (>= x 2000) (< x 3000))
    (>= x 5000)
    )
  )
;pruebas:
(check-expect (verificar-rango 3) #t)
(check-expect (verificar-rango -12) #f)
(check-expect (verificar-rango 15) #t)
(check-expect (verificar-rango 24) #f)
(check-expect (verificar-rango 100) #f)