#lang eopl
#| 10. (max-list lista) que recibe una lista de numeros y devuelve el
numero mayor en dicha lista.

NICOLAS FELIPE VICTORIA RODRIGUEZ 1767315-3743
GERMAN DAVID MURILLAS MONDRAGON 2067549-3743
Harold Andres Montano Hurtado 1968067-3743
|#

;; Funcion pregunta si el primer elemento es mayor a los demas de la lista.
(define aux-max
  (lambda (elm lst)
    (display elm) (display " ")
    (display lst) (display "\n")
    
    (cond
      [(null? lst) #t]
      [(> elm (car lst))
       (aux-max elm (cdr lst))]
      [else #f]
     )))

;; Funcion que repite la funcion (aux-man) para cada elemento de la lista
(define max-list
  (lambda (lista)
    (cond
      [(null? lista) '()]
      ;           numero      lista
      [(aux-max (car lista) (cdr lista))
       (car lista)]
      [else (max-list (cdr lista))]
     )))

;(display (max-list '(12 4 21 11 8))) (display "\n\n")
;(display (max-list '(19 12 34 8 14 45)))  (display "\n\n")

(define max
  (lambda (lst) ;(elm lst)
    (define a (car lst))
    (define b (cadr lst))
    (display a) (display " ")
    (display b) (display " ")
    (display lst) (display "\n")
    (cond
      [(null? lst) (car lst)] ;[(null? lst) elm]
      [(> (car lst) (cadr lst))
       (max (cdr lst))] ;[(> elm (car lst)) (max elm (cdr lst))]
      [else
       (cadr lst)] ;[else (max (car lst) (cdr lst))]
     )))

(display (max '(12 4 21 70 11 8))) (display "\n\n")
(display (max '(19 12 34 8 14 45)))  (display "\n\n")
