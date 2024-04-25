#lang eopl
#| 1. (list-set lista n x) que retorna una lista similar a lista, excepto que el
n-simo elemento (indexado desde cero) es x.

> (list-set '(a b c d) 2 '(1 2))
(a b (1 2) d)
> (list-set '(a b c d) 3 '(1 5 10))
(a b c (1 5 10)) |#

(define list-set
  (lambda (lista n x)
    (cond
      [(null? lista) '()]
      [(or (null? n) (= n 0)) (cons x (cdr lista))]
      [else (cons (car lista) (list-set (cdr lista) (- n 1) x))]
     )
   )
 )

(display "(1)(list-set lista n x):\n")
(display (list-set '(a b c d) 2 '(1 2) ))   (display "\n")
(display (list-set '(a b c d) 3 '(1 5 10) ))   (display "\n")
(display (list-set '(a b c d c) 7 '(1 5 10) ))   (display "\n")
(display "\n")

#| 2. (list-tails lista) que recibe como parametro una lista y retorna una
lista de todas las sublistas de elementos consecutivos en lista.

> (list-tails '(1 2 3 4 5))
((1 2 3 4 5) (2 3 4 5) (3 4 5) (4 5) (5))
> (list-tails '(1 a (e 4) 5 v))
((1 a (e 4) 5 v) (a (e 4) 5 v) ((e 4) 5 v) (5 v) (v)) |#

(define list-tails
  (lambda (lista)
    (cond
      [(null? lista) '()]
      [else (cons lista (list-tails (cdr lista)) )]
     )
    )
 )
(display "(2)(list-tails lista):\n")
(display (list-tails '(1 2 3 4 5)) )  (display "\n")
(display (list-tails '(1 a (e 4) 5 v)) )  (display "\n")
(display "\n")

#| 3. (exists? pred lst) recibe como parametros un predicado (number? symbol? bool? list?)
y retorna #t si al menos un elemento de la lista satisface el predicado.

> (exists? number? '(a b c 3 e))
#t
> (exists? number? '(a b c d e))
#f |#

(define exists?
  (lambda (pred lst)
    (cond
      [(null? lst) #f]
      [else (or (pred (car lst)) (exists? pred (cdr lst)) )]
     )
   )
 )

(display "(3)(exists? pred lst):\n")
(display (exists? number? '(a b c 3 e)) )  (display "\n")
(display (exists? number? '(a b c d e)) )  (display "\n")
(display "\n")

#| 4. (list-facts n) que recibe como parametro un entero n y retorna una lista
incremental de factoriales, comenzando en 1! hasta n!

> (list-facts 5)
(1 2 6 24 120) |#

;genera el factorial
(define factAux
  (lambda (n)
    (cond
      [(= n 0) 1]
      [else (* n (factAux (- n 1)))]
     )
   )
 )
; genera la lista de factoriales
(define generate-list
  (lambda (n)
    (cond
      [(= n 0) '()]
      [else (cons (factAux n) (generate-list (- n 1)))]
     )
   )
 )
; revierte la lista de factoriales
(define list-facts
  (lambda (n)
    (reverse (generate-list n))
   )
 )

(display "(4)(list-facts n):\n")
(display (list-facts 5)) (display "\n")
(display (list-facts 6)) (display "\n")
(display "\n")

#| 6. (inversions lista) que determina el numero de inversiones de lista.
Sea A = (a1 a2 : : : an) una lista de n numeros diferentes, si i < j y ai > aj
entonces la pareja (i j) es una inversion de A.

(inversions '(2 3 8 6 1)) > 5
(inversions '(1 2 3 4)) > 0
(inversions '(3 2 1)) > 3 |#

(define inversion-aux
  (lambda (elm lst)
    (cond
      [(null? lst) 0]
      [(> elm (car lst))
       (+ 1 (inversion-aux elm (cdr lst)))]
      [else (inversion-aux elm (cdr lst))]
      )
    )
  )

(define inversions
  (lambda (lst)
    (cond
      [(null? lst) 0]
      [else (+ (inversion-aux (car lst) (cdr lst))
               (inversions (cdr lst)))]
      )
    )
  )

(display "(6)(inversions lista):\n")
(display (inversions '(2 3 8 6 1)))  (display "\n")
(display (inversions '(1 2 3 4)))  (display "\n")
(display (inversions '(3 2 1)))  (display "\n")
(display "\n")

#| 7. (up lista) que remueve un par de parentesis de cada elemento del nivel mas
alto de lista. Si un elemento de este nivel no es una lista (no tiene parentesis),
este elemento es incluido en el resultado sin modificaciones.

(up '((1 2) (3 4)) ) -> (1 2 3 4)
(up '((x (y)) z) ) -> (x (y) z) |#

(define up
  (lambda (lista)
    (cond
      [(null? lista) '()]
      [(list? (car lista))
       (append (car lista) (up (cdr lista)))]
      [else
       (cons (car lista) (up (cdr lista)))]
     )
   )
 )

(display "(7)(up lista):\n")
(display (up '((1 2) (3 4)))) (display "\n")
(display (up '((x (y)) z))) (display "\n")

#|
(define fun
  (lambda (a operador b) ;; como ingresar parametros
    #| Area de trabajo |#
    (display
     (operador a b))
   )
 )
;;   a op b 
(fun 2 * 3)
|#

#| 10. (max-list lista) que recibe una lista de numeros y devuelve el
numero mayor en dicha lista. |#

;; Funcion pregunta si el primer elemento es mayor a los demas de la lista.
(define aux-max
  (lambda (elm lst)
    (cond
      [(null? lst) #t]
      [(not (> elm (car lst))) ;;pregunta
       (and
        (> elm (car lst))
        (aux-max elm (cdr lst))
        )] ;;respuesta
      [else (aux-max elm (cdr lst))]
     )))

;; Funcion que repite la funcion (aux-man) para cada elemento de la lista
(define max-list
  (lambda (lista)
    (cond
      [(null? lista) '()]
      [(aux-max (car lista) (cdr lista))
       (car lista)]
      [else (max-list (cdr lista))]
     )))

(display (max-list '(12 4 21 11 8))) (display "\n")
(display (max-list '(19 12 34 8 14 45)))  (display "\n")


