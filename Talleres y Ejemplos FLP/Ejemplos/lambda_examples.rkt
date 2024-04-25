#lang eopl
(define funLambda
  (lambda (x y) (* x y))
  )

(display (funLambda 3 4))

; (if <quest> <respuesta_t> <respuesta_f>)
(define funToF
  (lambda (a b c)
    (if
     (> a b)
     a
     c)
    )
  )

(define cadenero
  (lambda (edad)
    (cond
      [(and (>= edad 0) (< edad 18)) "No puede entrar"]
      [(and (>= edad 18) (<= edad 30)) "Puede entrar"]
      [else "Edad no valida"]
     )
    )
  )

(display "\n")
(display (cadenero 10)) (display "\n")
(display (cadenero 20)) (display "\n")
(display (cadenero -12)) (display "\n")

; funciones como ciudadanos de primera clase
