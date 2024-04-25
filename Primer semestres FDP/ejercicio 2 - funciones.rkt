;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |ejercicio 2 - funciones|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;;Funcion
; Autor: Harold Montano (201968067-3743)
; Fecha: 03 de noviembre, 2019
; Contrato: f: numero, numero, numero -> numero
; Proposito: este programa recibe 3 numeros y retorna la suma del tercero al cubo màs la divicion del primero al cuadrado màs el segundo al cuadrado, elevado al tercer numero elevado al cuadrado. Sobre el primero al cubo màs 2 veces el primero màs en la raiz cuadrada del segundo elevado a la 1 sobre el tercero al cuadrado màs el segundo al cuadrado.
; Ejemplo:
;  (f 1 2 3) -> 621982,27219
;  (f 1 1 1) -> 1,52241
; definicion:

(define (f x y z)
  (+ (expt z 3) (/ (expt (+ (sqr x) (sqr y)) (sqr z))
                   (+ (expt x 3) (* 2 (expt (+ x (sqrt y)) (/ 1 (+ (sqr z) (sqr y)) )) )) ))
 )
; Pruebas:
(f 1 1 1)
(f 1 2 3)