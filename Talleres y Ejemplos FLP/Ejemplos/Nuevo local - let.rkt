#lang eopl
#| Sin necesidad de usar 'define', se puede definir una varaible con un valor.
Como se ve ans= x+y, y a=3
Y se pueden correr diversas funciones en una misma funcion let
|#
(define (sum x y)
  (let [
        (ans (+ x y))
        (a 3)
        ]
    (display "x + y = ")    
    (display ans)
    (display "\na = ")
    (display a)
    )
  )

(sum 2 3)
