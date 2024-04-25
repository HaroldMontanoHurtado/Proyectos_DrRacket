#lang eopl
(define index 0)
(define p1 '(0 1 2 3 4 5))
(define p2 '(5 4 3 2 1 0))
(define p3 '(9 8 7))

(define list-set
  (lambda (lista n)
    (cond
      [(null? lista) '()]
      [(eq? n index) (append (car lista) ())]
      [else (let ()
              #|
              (display (car lista))
              (display " ")
              (set! index (+ 1 index))
              (list-set (cdr lista) n)
              |#
              (append ())
             )
       ]
     )
   )
 )

(list-set p2 2)
(display "\n")
(display (append p1 (cdr p2)))