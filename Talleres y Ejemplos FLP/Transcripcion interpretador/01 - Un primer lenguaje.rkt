#lang eopl
(define-datatype declaracion declaracion?
  (decl-1 (a declaracion?)
          (b declaracion?))
  (decl-2 (exp expresion?);Aún no sabe que es un expresion?, asi que se definir como datatype
          (decl declaracion?))
  (decl-3 (ide symbol?)
          (exp expresion?)))
; los datatype se encuentran incluso estando en desorden
(define-datatype expresion expresion?
  (exp-1 (var symbol?))
  (exp-2 (a expresion?)
         (b expresion?)))
; Ejemplo de la estructura:
;(pegar en consola)
(decl-1
   (decl-3 'x (exp-1 'y))
   (decl-2
    (exp-1 'z)
    (decl-3 'y (exp-2
                (exp-1 'a)
                (exp-1 'b)))))