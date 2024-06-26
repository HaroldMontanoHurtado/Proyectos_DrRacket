;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |ejercicio 1 - funciones|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Autor: Harold Montano (201968067-3743)
; Fecha: 03 de Noviembre, 2019
; Contrato: Resta2: Nùmero, Nùmero -> Nùmero 
; Proposito: Recibe 2 nùmeros y retorna la resta del primero por el segundo
; Ejemplo:
;   (resta2 5 4) = 1
;   (resta2 29 14) = 15 
; Definiciôn: 
(define (resta2 a b)
  (- a b)
 )
; Pruebas:
(check-expect (resta2 5 2) 3)
(check-expect (resta2 29 14) 15)



; Autor: Harold Montano (201968067-3743)
; Fecha: 03 de Noviembre, 2019
; Contrato: Multiplicaciòn5: Nùmero, Nùmero, Nùmero, Nùmero, Nùmero -> Nùmero 
; Proposito: Recibe 5 nùmeros y retorna su multiplicaciòn
; Ejemplo:
;   (multiplicacion5 1 2 3 4 5) = 120
;   (multiplicacion5 6 5 4 3 2) = 720 
; Definiciôn:
(define (multiplicacion5 a b c d f)
  (* a b c d f)
 )
;Pruebas:
(check-expect (multiplicacion5 1 2 3 4 5) 120)
(check-expect (multiplicacion5 6 5 4 3 2) 720)



