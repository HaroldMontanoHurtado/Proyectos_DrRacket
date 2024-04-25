;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |ejercicio 5 - estructuras|) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp")) #f)))
;autor: Harold Montano 1968067-3743
;fecha: 24 de nov, 2019
;contrato: mas-cercano: posn, posn -> num
;proposito: una funcion que recibe 3 coordenadas y retorna la coordenada más cercana a (0,0)
;Ejemplo: (distancia (make-posn 6 2) (make-posn 8 4))-> 2*(sqrt 2)
;(distancia (make-posn 6 11) (make-posn 3 5))-> 3

;definicion:
(define (distancia p1 p2)
  (sqrt (+ (sqr (- (posn-x p1) (posn-x p2)))
           (sqr (- (posn-y p1) (posn-y p2)))
          )
    )
  )
 
(define (cercania p1 p2 p3)
  (cond
    [(< (distancia p1 p2) (distancia p2 p3)) (distancia p1 p2)]
    [(< (distancia p2 p3) (distancia p1 p2)) (distancia p2 p3)]
    [else (distancia p1 p3)]
    )
  )

(cercania (make-posn 1 2) (make-posn 3 4) (make-posn 5 6))