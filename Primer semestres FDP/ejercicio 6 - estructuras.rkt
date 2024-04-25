;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |ejercicio 6 - estructuras|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;funcion auxiliar, Distancia
;halla la distancia entre 2 punto en el plano carteciano

(define (distancia a b)
  (sqrt
   (+ (sqr (- (posn-x a) (posn-x b))
       )
      (sqr (- (posn-y a) (posn-y b))
       )
    )
   )
  )

(check-expect (distancia (make-posn 3 4) (make-posn 1 4)) 2)

;autor: Harold Montano 1968063 - 3743
;fecha: 29 de nov, 2019
;contrato: posn, posn, posn -> num
;proposito: Esta funcion recibe 3 puntos y retorna la mayor distancia entre 2 puntos
;ejemplo:
;suponga ((distancia p1 p2) -> 5, (distancia p1 p3) -> 8, (distancia p3 p2) -> 10) -> 10
;definicion:

(define (mayor-distancia p1 p2 p3)
  (cond
    [(and (> (distancia p1 p2) (distancia p1 p3))
          (> (distancia p1 p2) (distancia p2 p3))
       )
     (distancia p1 p2)]
    [(> (distancia p1 p3) (distancia p2 p3))
     (distancia p1 p3)]
    [else (distancia p2 p3)]
    )  
 )



(mayor-distancia (make-posn 1 2) (make-posn 3 4) (make-posn 5 6) )