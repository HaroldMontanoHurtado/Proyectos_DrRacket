#lang eopl

(define contador 0)
(define conteo
  (lambda () (set! contador (+ contador 1))
    contador)
  )

;; Autores: German Murillas 2067549-3743
;           Nicolas Victoria 201767315-3743
;           Harold Montano 201968067-3743
;; Fecha: 04 / Sep / 2021
;; Contrato: f: lista números -> número
;; Proposito: Está funcion llamada 'inversions' recibe una lista de numeros,
;; Ejemplos:
;     (inversions '(2 3 4 1)) -> 3
;     (inversions '(2 4 5)) -> 0
;; Código:
(define inversions
  (lambda (lista)
    (cond
      [(null? lista) "salida"]
      [(car lista) (display contador)]
      [else "h"]
     )
   )
 )
;;
(inversions '(2 3 4 1)) ; -> 3