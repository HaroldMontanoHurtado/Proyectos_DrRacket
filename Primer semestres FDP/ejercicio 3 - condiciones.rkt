;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |ejercicio 3 - condiciones|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;Venta de CD's
;Autor: 201968067-3643
;fecha: 16 de nov, 2019
;contrato: numero->numero
;proposito: calcular el IVA de una venta
;ejemplo:
;(calcular-iva 1)-> 1.2
;(calcular_iva 2)-> 1.15
;(calcular-iva 8)-> 1.13
;definicion:
(define (calcular-iva x)
  (cond
    [(and (> x 0) (< x 2)) 1.2]
    [(and (>= x 2) (<= 5)) 1.15]
    [else 1.13]
    )
 )

;Autor: 201968067-3643
;fecha: 16 de nov, 2019
;contrato: numero->numero
;proposito: calcular precio de venta de CD's
;ejemplo:
;(cd 1)-> 4800
;(cd 2)-> 8050
;(cd 8)-> 27150
;definicion:
(define (cd cnt)
  (cond
    [(and (> cnt 0) (< cnt 2)) (* cnt 4000 (calcular-iva cnt))]
    [(and (>= cnt 2) (<= cnt 5)) (* cnt 3500 (calcular-iva cnt))]
    [else (* cnt 3000 (calcular-iva cnt))]
    )
 )

;pruebas
(check-expect (cd 1) 4800)
(check-expect (cd 2) 8050)
(check-expect (cd 8) 27600)


