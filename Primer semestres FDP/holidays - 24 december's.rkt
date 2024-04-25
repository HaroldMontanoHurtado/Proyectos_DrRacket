;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |holidays - 24 december's|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;autor: Harold A Montano 201968067-3743
;fecha: 24 de Dic, 2019
;contrato: num->num
;proposito: aumento de IVA
;deficion:
(define (iva x)
  (cond
    [(< x 2) 1.2]
    [(and (>= x 2) (<= x 5)) 1.15]
    [else 1.13]
   )
 )

;autor: Harold A Montano 201968067-3743
;fecha: 24 de Dic, 2019
;contrato: venta: num->num
;proposito: calcular el precio de venta de CD's con su respectivo IVA
;ejemplos: 
;(venta 1) 4800  (venta 3) 12075  (venta 8) 27120
;definicion
(define (venta num-cds)
  (cond
    [(< num-cds 2) (* num-cds (iva num-cds) 4000)]
    [(and (>= num-cds 2) (<= num-cds 5)) (* num-cds (iva num-cds) 3500)]
    [else (* num-cds (iva num-cds) 3000)]
   )
 )

;pruebas
(check-expect (venta 1) 4800)
(check-expect (venta 3) 12075)
(check-expect (venta 8) 27120)