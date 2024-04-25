#lang eopl
(define especificacion-lexica
  '(
    (espacio-blanco (whitespace) skip)
    (comentarios ("%" (arbno (not #\newline))) skip)
    (identificador (letter (arbno (or letter digit "?" "$"))) symbol)
    (numero (digit (arbno digit)) number)
    (numero ("-" digit (arbno digit)) number)
    (numero (digit (arbno digit) "." digit (arbno digit)) number)
    (numero ("-" digit (arbno digit) "." digit (arbno digit)) number)
    )
  )

(define especificacion-gramatical
  '(
    (programa (expresion) a-program)
    (expresion (numero) lit-exp)
    (expresion (identificador) var-exp)
    (expresion (primitiva "(" (separated-list expresion ",") ")") prim-exp)
    (primitiva ("+") sum-prim)
    (primitiva ("-") minus-prim)
    (primitiva ("*") mult-prim)
    (primitiva ("/") div-prim)
    (primitiva ("add1") add-prim)
    (primit-iva ("sub1") sub-prim)
    )
  )

(sllgen:make-define-datatypes
  especificacion-lexica especificacion-gramatical)


(define valor? (lambda (x) #true))

(define-datatype ambiente ambiente?
  (ambiente-vacio)
  (ambiente-extendido
   (identificadores (list-of symbol?))
   (valores (list-of valor?))
   (ambiente-ex ambiente?)
   )
 )

(define apply-env
  (lambda (env sym)
    (cases ambiente env
      (ambiente-vacio () (eopl:error "No se encuentra la variable" sym))
      (ambiente-extendido (lid lval env-old)
                          (letrec
                              (
                               [buscar-sim
                                (lambda (lid lval sym)
                                  (cond
                                    [(null? lid) (apply-env env-old sym)]
                                    [(equal? (car lid) sym) (car lval)]
                                    [else (buscar-sim (cdr lid) (cdr lval) sym)]
                                    ))]
                               )
                            (buscar-sim lid lval sym)
                            )
                          )
      )
    ))

; ambiente inicial:
(define ambiente-inicial
  (ambiente-extendido '(x y z) '(1 2 3)
                      (ambiente-extendido '(a b c) '(4 5 6)
                                          (ambiente-vacio))))

;; FUNCION PRINCIPAL
(define eval-program
  (lambda (prog)
    (cases programa prog
      (a-program (exp) (evaluar-expresion exp ambiente-inicial))
      )))

;; Funcion de trabajo (evaluacion de las expresiones)
(define evaluar-expresion
  (lambda (exp amb)
    (cases expresion exp
      (lit-exp (dato) dato)
      (var-exp (id) (apply-env amb id))
      (else "ok") ;el else ayuda a evitar errores en los casos faltantes
     )
   )
 )

(define interpretador
  (sllgen:make-rep-loop ">>"
                        eval-program
                        (sllgen:make-stream-parser
                         especificacion-lexica especificacion-gramatical)))

(interpretador)