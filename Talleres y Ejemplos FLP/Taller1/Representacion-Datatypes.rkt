#lang eopl
#|
Autores:
CASTAÑO HOLGUIN, JUAN ESTEBAN,1968098-3743.
MONTANO HURTADO, HAROLD ANDRES,1968067-3743.
MURILLAS MONDRAGON, GERMAN DAVID,2067549-3743.
VICTORIA RODRIGUEZ, NICOLAS FELIPE,1767315-3743.

<tabla-hash> := th-vacio '()
             := th-novacio <item><tabla-hash>

<item>       :=itemElm <simbolo><lnumero>

<lnumero>    := lnumvacia '()
             := lnumnovacia <numero><lnumero>

buscar-llave  : llave * tabla-hash -> lnumero

Proposito
dada una llave y una tabla hash, busca dentro de la tabla hash
la llave y retorna la lista de numeros de pertenecen a esa llave

sumar-valores  : tabla-hash -> lista-de-listas

Proposito:
Dada una tabla hash, retorna una lista de listas en donde
cada una de la lista interna tiene dos valores,el primero es el simbolo
que llevaba internamente cada tabla hash y el segundo es la suma de cada 
uno de los numeros de la lista de numeros que estaban asociados a ese simbolo
|#

(define-datatype tabla-hash tabla-hash?
  (th-vacio)
  (th-novacio (item item?)
              (tabla-hash tabla-hash?)))

(define-datatype item item?
  (itemElm (simbolo symbol?)
           (lnumero lnumero?)))

(define-datatype lnumero lnumero?
  (lnumvacia)
  (lnumnovacia (num number?)
               (lst lnumero?)))
;;-----------------------------------
#|
<dato> ::= <numero> | <simbolo> | <lnumero> | <lsimbolo>
<lnumero> ::= '()
          ::= <numero> <lnumero>

buscar-llave: llave , registro --> dato
Proposito:
Dentro del registro enviado se buscará (de forma recursiva) la llave,
para retornar el dato, almacenado en la llave
|#
(define buscar-llave
  (lambda (llave lst)
    (cond
      [(tabla-hash? lst)
       (cases tabla-hash lst
         (th-vacio () '())
         (th-novacio (item tabla-hash)
                     (if
                      (null? (buscar-llave llave item))
                      (buscar-llave llave tabla-hash)
                      (buscar-llave llave item))))]
      [(item? lst)
       (cases item lst
         (itemElm (simbolo lnumero)
                  (if (eqv? simbolo llave) lnumero '())))])))
#|
<dato> ::= <numero> | <simbolo> | <lnumero> | <lsimbolo>
<lnumero> ::= '()
          ::= <numero> <lnumero>
<tabla-hash> := th-vacio '()
             := th-novacio <item><tabla-hash>

sumar-valores: lista --> lista
Proposito:
Se ingresa una lista de tablas hash, y los valores de se sumaran (de forma recursiva),
y se retornará listas que su primer valor será la llave, y el segundo la suma de cada
valor de la lista.
|#
(define sumar-valores
  (lambda (lst)
    (cond
      [(tabla-hash? lst)
       (cases tabla-hash lst
         (th-vacio () '())
         (th-novacio (item tabla-hash)
                     (append (list (sumar-valores item))
                             (sumar-valores tabla-hash))))]
      [(item? lst)
       (cases item lst
         (itemElm (simbolo lnumero) (list simbolo (sumar-valores lnumero))))]
      [(lnumero? lst)
       (cases lnumero lst
         (lnumvacia () 0)
         (lnumnovacia (num lnum) (+ num (sumar-valores lnum))))])))

;;----------------------------------
; ejemplos Datatypes
(define exp
  (th-novacio
   (itemElm 'a (lnumnovacia 3 (lnumnovacia 5 (lnumvacia))))
  (th-novacio
   (itemElm 'b (lnumnovacia 7 (lnumnovacia 8 (lnumvacia))))
  (th-vacio))))

(define exp2
  (th-novacio
   (itemElm 'g (lnumnovacia 12 (lnumnovacia 7 (lnumvacia))))
  (th-novacio
   (itemElm 't (lnumnovacia 6 (lnumnovacia 9 (lnumvacia))))
  (th-novacio
   (itemElm 'e (lnumnovacia 4 (lnumnovacia 5 (lnumvacia))))
  (th-novacio
   (itemElm 'j (lnumnovacia 32 (lnumnovacia 8 (lnumvacia))))
  (th-vacio))))))

(define exp3
  (th-novacio
   (itemElm 'l (lnumnovacia 13 (lnumnovacia 15 (lnumvacia))))
  (th-vacio)))

(define exp4
  (th-novacio
   (itemElm 'a (lnumnovacia 0 (lnumnovacia 4 (lnumvacia))))
  (th-novacio
   (itemElm 'k (lnumnovacia 24 (lnumnovacia 18 (lnumvacia))))
  (th-vacio))))

(define exp5
  (th-novacio
   (itemElm 'w (lnumnovacia 13 (lnumnovacia 7 (lnumvacia))))
  (th-novacio
   (itemElm 'o (lnumnovacia 21 (lnumnovacia 38 (lnumvacia))))
  (th-novacio
   (itemElm 'p (lnumnovacia 5 (lnumnovacia 9 (lnumvacia))))
  (th-vacio)))))

;;ejemplos funcionamiento

;;buscar-llave 
(display (buscar-llave 'c exp)) (display "\n")
;;retorna () ya que no existe la llave buscada
(display (buscar-llave 'g exp2)) (display "\n")
;;retorna #(struct:lnumnovacia 12 #(struct:lnumnovacia 7 #(struct:lnumvacia)))
(display (buscar-llave 'k exp4)) (display "\n")
;;retorna #(struct:lnumnovacia 24 #(struct:lnumnovacia 18 #(struct:lnumvacia)))
;;------------------------------------------------------------------------------------------
;;sumar-valores
(display (sumar-valores exp)) (display "\n")
;;retorna ((a 8) (b 15))
(display (sumar-valores exp2)) (display "\n")
;;retorna ((g 19) (t 15) (e 9) (j 40))
(display (sumar-valores exp5)) (display "\n")
;;retorna ((w 20) (o 59) (p 14))
