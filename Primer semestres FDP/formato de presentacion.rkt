;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |formato de presentacion|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Autor: Harold Montano (201968067-3743)
; Fecha: 11 de Noviembre, 2019
; Contrato: recibe un numero y saca un numero (que hace el codigo)
; proposito: describi que busca conseguir el codigo
; ejemplo:
; CODIGO:
; Pruebas:
; (check-expect (doy los valores de el/los argumento/s) el supuesto valor que debe ser)
; despues de eso debera comprobar si es correcto o no


; Autor: Harold Montano (201968067-3743)
; Fecha: 11 de Noviembre, 2019
; Contrato: recibe un numero -> saca un numero
; proposito: cado 2 valores, calcular el area de un triangulo
; ejemplo:
;  (areaT (3 2)) = 3
;  (areaT (4 3)) = 6

(define (areaT h b)
  (* h b (/ 1 2))
 )

; Pruebas:
(check-expect (areaT 3 2) 3)
(check-expect (areaT 4 3) 6)

(areaT 5 4)