;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |example 4 - funciones auxiliares|) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp")) #f)))
;eleva al cudrado la resta de 2 numeros

(define (f a)
  (sqr a)
 )

;halla la hipotenusa, dados los 2 catetos

(define (hipo a b)
  (sqrt (+ (f a) (f b) ))
  )
;Prueba
(hipo 3 4)