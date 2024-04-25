;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |holidays - 24 december's 1.2|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;autor: Harold A Montano 201968067-3743
;fecha: 24 de Dic, 2019
;contrato: raiz: num, num, num -> num
;proposito: funcion que retorna el valor de una raiz cuadrada
;deficion:
(deficion (raiz a b c)
  (sqrt (- (sqr b) (* 4 a c)))
  )
;;autor: Harold A Montano 201968067-3743
;fecha: 24 de Dic, 2019
;contrato: f: num, num, num -> num
;proposito: funcion cuadratica
;deficion:
(define (f a b c)
  (/ (+ -b (raiz a b c))
     (* 2 a)
   )
 )
;;autor: Harold A Montano 201968067-3743
;fecha: 24 de Dic, 2019
;contrato: num, num, num -> num
;proposito: funcion cuadratica
;deficion: