#lang eopl
#|
Autores:
 CASTAÑO HOLGUIN, JUAN ESTEBAN,1968098-3743.
 MONTANO HURTADO, HAROLD ANDRES,1968067-3743.
 MURILLAS MONDRAGON, GERMAN DAVID,2067549-3743.
 VICTORIA RODRIGUEZ, NICOLAS FELIPE,1767315-3743.
|#

;Constructores
(define th-vacio
  (lambda ()
    (list 'th-vacio)))

(define th-novacio
  (lambda (item reg)
    (list 'th-novacio item reg)))

(define itemElm
  (lambda (key dato)
    (list 'itemElm key dato)))

(define lnumvacia
  (lambda ()
    (list 'lnumvacia)))

(define lnumnovacia
  (lambda (num lst)
    (list 'lnumnovacia num lst)))

;Predicados
(define th-vacio?
  (lambda (exp)
    (equal? 'th-vacio (car exp))))

(define th-novacio?
  (lambda (exp)
    (equal? 'th-novacio (car exp))))

(define itemElm?
  (lambda (exp)
    (equal? 'itemElm (car exp))))

(define lnumvacia?
  (lambda (exp)
    (equal? 'lnumvacia (car exp))))

(define lnumnovacia?
  (lambda (exp)
    (equal? 'lnumnovacia (car exp))))

;Extractores
(define th-novacio->item
  (lambda (th-novacio)
    (cadr th-novacio)))

(define th-novacio->reg
  (lambda (th-novacio)
    (caddr th-novacio)))

(define itemElm->key
  (lambda (itemElm)
    (cadr itemElm)))

(define itemElm->dato
  (lambda (itemElm)
    (caddr itemElm)))

(define lnumnovacia->num
  (lambda (lnumnovacia)
    (cadr lnumnovacia)))

(define lnumnovacia->lst
  (lambda (lnumnovacia)
    (caddr lnumnovacia)))

;Area de programacion
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
  (lambda (simbolo th)
    (cond
      [(th-vacio? th) '()]
      [(th-novacio? th)
       (let
           ([item (th-novacio->item th)])
         (if
          (itemElm? item)
          (if (equal? (itemElm->key item) simbolo)
              (itemElm->dato item)
              (buscar-llave simbolo (th-novacio->reg th))
              )
          (eopl:error "un elemento no es de tipo itemElm")
          )
         )]
      [else eopl:error "ingreso de datos no valido"]
      )
    )
  )

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
  (lambda (th)
    (cond
      [(th-vacio? th) '()]
      [(th-novacio? th)
       (letrec
            ([item (th-novacio->item th)]
             [sumar-lista (lambda (lnum)
                       (cond
                         [(lnumvacia? lnum) 0]
                         [else (+ (lnumnovacia->num lnum)
                                  (sumar-lista (lnumnovacia->lst lnum)))]
                         )
                       )]
             )         
         (cons (list (itemElm->key item) (sumar-lista (itemElm->dato item)))
               (sumar-valores (th-novacio->reg th)))
           )
       ]
      [else eopl:error "ingreso de datos no valido"]
    )
  )
)

;f = {a : ’ ( 1 2 3 ) , b : ’ ( 1 ) , c : ’ ( 1 , 2 ) }
(define f
  (th-novacio
   (itemElm 'a (lnumnovacia 1 (lnumnovacia 2 (lnumnovacia 3 (lnumvacia)))))
   (th-novacio
    (itemElm 'b (lnumnovacia 1 (lnumvacia)))
    (th-novacio
     (itemElm 'c (lnumnovacia 1 (lnumnovacia 2 (lnumvacia)))) (th-vacio)))))

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