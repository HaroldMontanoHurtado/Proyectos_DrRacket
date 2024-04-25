;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |Ejercicio 1.0 - funciones auxiliares|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;;Autor: Harold Andres Montano Hurtado
;;Fecha: 09 / Junio / 2021
;;Contrato: f: número, número, número -> número
;;Proposito: Está funcion llamada 'f' recibe 3 números, ejecuta ciertos procesos
;            con los números ingresados, y retorna el resultado de dicho proceso.
;;Ejemplos:
;(f 1 2 3) 5.29150
;(f 2 4 5) 9.819805
;;Código:
(define (f x y z)
  (/ (+ (sqr x) (sqr y) (sqr z)
        )
     (sqrt (+ (* 2 x) (- (* 2 y)) (sqr z)
              )
           )
   )
  )
;;Pruebas:
(check-within (f 1 2 3) 5.29150 0.001) ;para hacer pruebas aproximadas
(check-within (f 2 4 5) 9.819805 0.001)

;;Autor: Harold Andres Montano Hurtado
;;Fecha: 09 / Junio / 2021
;;Contrato: g: número, número -> número
;;Proposito: Está funcion llamada 'g' recibe 2 números, ejecuta ciertos procesos
;            con los números ingresados, incluyendo llamar a la función 'f',
;            y retorna el resultado de dicho proceso.
;;Codigo:
(define (g x y)
  (/ (* (f x y (sqr x)) (f (sqr x) (sqr y) (sqrt x)) )
     (+ (f x y (+ x y)) (sqrt (f (+ (sqr x) y) y (sqr x))) )
   )
 )
;;Autor: Harold Andres Montano Hurtado
;;Fecha: 09 / Junio / 2021
;;Contrato: h: número, número -> número
;;Proposito: Está funcion llamada 'h' recibe 2 números, ejecuta ciertos procesos
;            con los números ingresados, incluyendo llamar a la función 'f' y 'g',
;            y retorna el resultado de dicho proceso.
;;Codigo:
(define (h a b)
  (+ (g (f a  b (sqr a)) b )
     (g (f (sqr a) b (sqr b)) (sqrt (+ a b)) )
   ) 
 )
