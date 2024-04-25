#lang eopl
(define especificacion-lexica
  '(
    ;Comenzamos con las cosas que debe ignorar
    ;(<Nombre>  <Caracteristicas que acepta>  <Tipo de dato asignado>)
    (espacio-blanco (whitespace) skip) ;si encuentra espacion en blanco, los ignora
    (comentarios ("%" (arbno (not #\newline))) skip)
    (identificador (letter (arbno (or letter digit "?" "$"))) symbol)
    (numero (digit (arbno digit)) number); enteros
    (numero ("-" digit (arbno digit)) number); negativos
    (numero (digit (arbno digit) "." digit (arbno digit)) number); float
    (numero ("-" digit (arbno digit) "." digit (arbno digit)) number); float negativos
    )
  )

(define especificacion-gramatical
  '(
    ;Declaraciones
    (declaracion ("{" declaracion ";" declaracion "}") decl-1)
    (declaracion ("while" expresion "do" declaracion) decl-2)
    (declaracion (identificador ":=" expresion) decl-3)
    ;Expresiones
    (expresion (identificador) exp-1)
    (expresion (numero) exp-2)
    (expresion ("(" expresion "+" expresion ")") exp-3)
    )
  )

;; Creacion de data types automaticamente
(sllgen:make-define-datatypes
  especificacion-lexica especificacion-gramatical)

;; Data types generados
(define listaDatatypes
  (sllgen:list-define-datatypes
   especificacion-lexica especificacion-gramatical)
  )

;; Construir escaner
(define escaner
 (sllgen:make-string-scanner
  especificacion-lexica especificacion-gramatical)
  )
; ejemplo escaner:
;(escaner "while hola do perro := (1.4 + x)")
;(escaner "while hola do perro := (-1.4 + 8)")

;; Contruir parser:
(define parser
  (sllgen:make-string-parser
   especificacion-lexica especificacion-gramatical))
; ejemplo parser
;(parser "while hola do perro := (1.4 + x)")
;(parser "while hola do perro := (-1.4 + 8)")

;;Construir el interpretador:
(define evaluar-programa
  (lambda (prog)
    (cases declaracion prog
      (decl-1 (d1 d2) (list d1 d2))
      (decl-2 (exp d1) (list exp d1))
      (decl-3 (id exp) (list id exp))
     )))

(define interpretador
  (sllgen:make-rep-loop ">>>"
                        evaluar-programa
                        (sllgen:make-stream-parser
                         especificacion-lexica especificacion-gramatical)
                        ))
;ejemplos:
; {x := 1.8; while x do j := 1}

(interpretador)