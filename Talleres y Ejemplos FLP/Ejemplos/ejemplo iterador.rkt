#lang eopl
;#lang racket
(define contador 0)

(define contar
  (lambda () (set! contador (+ 1 contador)) )
 )

(define loop
  (lambda (rango)
    (cond
      [(< contador rango) contar]
      [else ""]
     )
   )
 )
#|
(display contador) (display "\n"); 0
(contar); 0 + 1 = 1
(display contador) (display "\n"); 1
(contar); 1 + 1 = 2
(display contador) (display "\n"); 2
(contar); 2 + 1 = 3
(display contador) (display "\n"); 3
|#
#|
(define (bucle rango)
  (let [
        (c 0) ;siempre se estará re definiendo
        ]
    (display c) (display " ")
    (set! c (+ 1 c))
    (cond
      [(<= c rango) (bucle rango)]
      [else (display c)]
      )
   )
 )
|#
;(bucle 5) (display "\n"); 0 1 2 3 falla por completo :c