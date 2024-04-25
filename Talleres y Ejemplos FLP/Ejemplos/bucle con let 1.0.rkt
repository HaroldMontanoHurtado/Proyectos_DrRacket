#lang eopl
;; valor incial del iterador
(define index 0)

;; función aux que lo hace iterar
(define contar
  (lambda () (set! index (+ 1 index)) )
  )

;;funcion de verificacion si es menor al rango
(define menor_que
  (lambda (iter rango)
    (< iter rango)
   )
 )

;;Funcion madre que ejecuta todo
; funcion empleando funciones auxiliares
#|
(define bucle
  (lambda (rango)
    (cond
      [(menor_que index rango) (let () ; definicion de calores, no se define nada
                                 (display index)
                                 (contar)
                                 (display " ")
                                 (bucle rango) )]
      [else ""]
     )
   )
 ) |#

; Sin necesidad de funciones auxiliares
(define bucle
  (lambda (rango)
    (cond
      [(< index rango) (let () ; definicion de calores, no se define nada
                         (display index)
                         (set! index (+ 1 index))
                         (display " ")
                         (bucle rango) )]
      [else ""]
     )
   )
 )

(bucle 9) ; ejemplo => 0 1 2 3 4 5 6 7 8