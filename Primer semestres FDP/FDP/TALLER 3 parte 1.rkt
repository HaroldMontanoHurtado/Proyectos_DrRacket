;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |TALLER 3 parte 1|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;Autores: Harold Montano Hurtado 1968067-3743, Juan Rios 1968106-3743, Heider Castaño 1968179-3743
;Fecha: 08 de Febrero, 2020
;contrato: estructuras
;proposito: Se crea las estructuras con las que se trabajará el taller.
;ESTRUCTURAS
(define-struct empleado (cc nombre sueldo cargo telefono))
(define-struct vehiculo (placa tipo ciudad cantidadGalones velocidadMaxima distanciaXgalon))
(define-struct empresa (nit nombre  empleados direccion dineroActual vehiculo))
(define-struct multinacional (nit nombre empresasAsociadas))