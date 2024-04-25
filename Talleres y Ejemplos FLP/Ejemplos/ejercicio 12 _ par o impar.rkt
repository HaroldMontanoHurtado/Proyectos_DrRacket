#lang eopl
(define filter-acum
  (lambda (a b f acum filter)
    (display "a:") (display a) (display " | ") (display "b:") (display b) (display " | ")
    (display "acum:") (display acum) (display "\n")
    (cond
      [(> a b)
       acum]
      
      [(filter a)
       ;               a    b f    acum    filter
       (filter-acum (+ a 1) b f (f a acum) filter)]
      ;                     a    b f acum filter
      [else (filter-acum (+ a 1) b f acum filter)]
      )))

(display "suma de impares (odd?):\n")
;                     a b  f ac flt
(display (filter-acum 1 10 + 0 odd?)) ; 1 + 3 + 5 + 7 + 9 = 25
(display "\n\n\n")

(display "suma de pares (even?):\n")
;                      a b  f ac flt
(display (filter-acum 1 10 + 0 even?)); 2 + 4 + 6 + 8 + 10 = 30