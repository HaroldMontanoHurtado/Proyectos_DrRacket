#lang eopl
;;; abs-all: genera una lista con los valores
;;; absolutos de la lista ls
(define abs-all
(lambda (ls)
(if (null? ls)
()
(cons (abs (car ls)) (abs-all (cdr ls)))
)
)
)
; => abs-all
(abs-all '(3 7 -10 5 -8)) ; => (3 7 10 5 8)

;;; abs-all1: genera una lista con los valores
;;; absolutos de la lista ls, usando el procedimiento map
(define abs-all1
(lambda (ls) (map abs ls))
)
; => abs-all1
(abs-all1 '(3 7 -10 5 -8)) ; => (3 7 10 5 8)
;;; que se puede expresar directamente como:
(map abs '(3 7 -10 5 -8)) ; => (3 7 10 5 8)


(define raices-cuadradas
(lambda (a b c)
(let ((menosb 0) (raiz 0)
(divisor 1) (raiz1 0) (raiz2 0))
(set! menosb (- 0 b))
(set! divisor (* 2 a))
(set! raiz (sqrt (- (* b b) (* 4 (* a c)))))
(set! raiz1 (/ (+ menosb raiz) divisor))
(set! raiz2 (/ (- menosb raiz) divisor))
(cons raiz1 raiz2)
)
)
)
; => raices-cuadradas


;;;; CONTADOR
;;; definicion de un contador usando variable de
;;; nivel superior
(define contador 0)
; => contador
(define cuenta
(lambda ()
(set! contador (+ contador 1))
contador
)
)
; => cuenta
(cuenta) ; => 1
(cuenta) ; => 2