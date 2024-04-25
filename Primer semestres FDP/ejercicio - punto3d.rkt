;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |ejercicio - punto3d|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

(define-struct punto3d (x y z))

;autor: Harold Montano 1968067-3743
;fecha: 1 de Dic, 2019
;contrato: distancia: punto3d, punto3d -> numero
(define (distancia p1 p2)
  (sqrt (+ (sqr (- (punto3d-x p1) (punto3d-x p2)))
           (sqr (- (punto3d-y p1) (punto3d-y p2)))
           (sqr (- (punto3d-z p1) (punto3d-z p2)))
         )
   )
 )

;autor: Harold Montano 1968067-3743
;fecha: 1 de Dic, 2019
;contrato: menor-distancia: punto3d, punto3d, punto3d -> numero
;proposito: esta funcion recibe 3 puntos y retorna la menor distancia
;ejemplo
;
;definicion:
(define (menor-distancia p1 p2 p3)
  (cond
    [(and (< (distancia p1 p2) (distancia p2 p3))
          (< (distancia p1 p2) (distancia p1 p3))      )
     (distancia p1 p2)]
    [(< (distancia p2 p3) (distancia p1 p3))
     (distancia p2 p3)]
    [else (distancia p1 p3)]
    )
 )


(define punto1 (make-punto3d 3 1 2))
(define punto2 (make-punto3d 5 3 6))
(define punto3 (make-punto3d 8 5 7))
(define punto4 (make-punto3d 6 1 4))

(distancia punto1 punto2)
(distancia punto1 punto3)
(distancia punto1 punto4)
(distancia punto2 punto3)
(distancia punto2 punto4)
(distancia punto3 punto4)

'hello

(menor-distancia punto1 punto2 punto3)
(menor-distancia punto2 punto3 punto4)
(menor-distancia punto4 punto1 punto2)
(menor-distancia punto3 punto4 punto1)




