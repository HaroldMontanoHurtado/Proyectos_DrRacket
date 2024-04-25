;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |TALLER 3.4 vehiculo|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;Techpack
(require 2htdp/batch-io)
;ESTRUCTURAS
(define-struct empleado (cc nombre sueldo cargo telefono))
(define-struct vehiculo (placa tipo ciudad cantidadGalones velocidadMaxima distanciaXgalon))
(define-struct empresa (nit nombre  empleados direccion dineroActual vehiculo))
(define-struct multinacional (nit nombre empresasAsociadas))
;Archivos
(define archivo-empleados1 (read-words/line "Data/empleados1.txt"))
(define archivo-empleados2 (read-words/line "Data/empleados2.txt"))
(define archivo-empleados3 (read-words/line "Data/empleados3.txt"))
(define archivo-vehiculos1 (read-words/line "Data/vehiculos1.txt"))
(define archivo-vehiculos2 (read-words/line "Data/vehiculos2.txt"))
(define archivo-vehiculos3 (read-words/line "Data/vehiculos3.txt"))
;Empresas
(define EMPRESA1 (make-empresa "800.198.456-1" "Electronic Arts" archivo-empleados1
                               "Av siempre viva 7-43" 1000000 archivo-vehiculos1))
(define EMPRESA2 (make-empresa "977.345.564-0" "Rockstar Games" archivo-empleados2
                               "Cr 4 # 34-8" 900000 archivo-vehiculos2))
(define EMPRESA3 (make-empresa "954.671.110-0" "Nintendo" archivo-empleados3
                               "Calle 8 # 98-09" 6500000 archivo-vehiculos3))

(define LISTA-EMPRESAS1 (list EMPRESA1 EMPRESA2))
(define LISTA-EMPRESAS2 (list EMPRESA3)) 
;;MULTINACIONALES
(define MICROSOFT (make-multinacional "894.125.678-3" "Microsoft" LISTA-EMPRESAS1))
(define UBISOFT (make-multinacional "675.098.501-5" "Ubisoft" LISTA-EMPRESAS2))

;proposito: Funcion que cambien los strings a number, siempre y cuando cumpla las condicones establesidad.
(define (texto->num lis)
  (if
   (string-numeric? lis)
   (string->number lis)
   lis))
;proposito: funcion que recibe un lista con listas, y retorna una lista con estructuras
(define (list->vehiculo lis)
  (if
   (list? lis)
   (make-vehiculo (texto->num (first lis))
                  (texto->num (second lis))
                  (texto->num (third lis))
                  (texto->num (fourth lis))
                  (texto->num (fifth lis))
                  (texto->num (sixth lis)) )
   (error "no es una lista empresario")
   ))
;proposito:  funcion que recibe un lista de listas, y retorna una lista de estructuras tipo vehiculo
(define (list-list->list-vehiculo lis)
  (cond
    [(empty? lis) empty]
    [else
     (local [
             (define primero (first lis))
             (define resto (rest lis))
             ]
       (cond
         [(cons? primero)
          (cons (list->vehiculo primero) (list-list->list-vehiculo resto))]
         [else (cons primero (list-list->list-vehiculo resto))]
         )
       )]
    ))
;proposito: La funcion recibe una lista de vehiculos y retorna el vehiculo mas rapido.
;defino una variable como cero, para compararla con el resto de la lista
(define (velocidadMaxima lis)
  (local [
          (define filtrado (list-list->list-vehiculo lis)) ;;;;filtrar
          (define (compare a b) ;;;;comparacion
            (cond
              [(empty? b) a]
              [(>= a b) a] 
              [else b]
              ))
          ]
    (cond
      [(empty? filtrado) empty]
      [else
       (local [
               (define primeraVelocidad (vehiculo-velocidadMaxima (first filtrado)))
               (define recursion (velocidadMaxima (rest lis)))
               ]
         (compare primeraVelocidad  ;a
                  recursion)        ;b
         )]
      ))
  )
;Esta funcion, usando la velocidad Maxima optenida con la funcion auxiliar anterio,
;retorna la estructura del Vehiculo más rápido
(define (vehiculoMasRapido lis)
  (cond
    [(empty? lis) empty]
    [else
     (local [
             (define filtrado (list-list->list-vehiculo lis)) 
             ]
       (cond
         [(eq? (velocidadMaxima lis)
               (vehiculo-velocidadMaxima (first filtrado)))
          (first filtrado)]
         [else
          (vehiculoMasRapido (rest lis))]
         )
       )]
    )
  )
;(empresa-vehiculo (first (multinacional-empresasAsociadas UBISOFT)))
;esta funcion retorna el vehiculo mas veloz de una multinacional
;(define (vehiculoMasRapidoMultinacional multi)
;  (local [
;          (define
;          ]  