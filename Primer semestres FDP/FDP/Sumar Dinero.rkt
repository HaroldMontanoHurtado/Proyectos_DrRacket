;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |Sumar Dinero|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
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
                               "Av siempre viva 7-43" 6000000 archivo-vehiculos1))
(define EMPRESA2 (make-empresa "977.345.564-0" "Rockstar Games" archivo-empleados2
                               "Cr 4 # 34-8" 500000 archivo-vehiculos2))
(define EMPRESA3 (make-empresa "954.671.110-0" "Nintendo" archivo-empleados3
                               "Calle 8 # 98-09" 6500000 archivo-vehiculos3))

(define LISTA-EMPRESAS1 (list EMPRESA1 EMPRESA2))
(define LISTA-EMPRESAS2 (list EMPRESA3)) 
;;MULTINACIONALES
(define MICROSOFT (make-multinacional "894.125.678-3" "Microsoft" LISTA-EMPRESAS1))
(define UBISOFT (make-multinacional "675.098.501-5" "Ubisoft" LISTA-EMPRESAS2))

;Funcion que recibe una lista de empresas y retorna la suma de su dinero actual
(define (sumaDineroEmpresas lis)
    (cond
      [(empty? lis) 0]
      [else
       (local [
               (define (extraerDinero emp)
                 (if
                  (empresa? emp)
                  (empresa-dineroActual emp)
                  0
                  ))
               ]
          (+ (extraerDinero (first lis)) (sumaDineroEmpresas (rest lis)))
         )]
      )
  )
;Recibe una multinacional y retorna la suma de su dinero
(define (dineroTotal mult)
  (sumaDineroEmpresas (multinacional-empresasAsociadas mult)) )
;Recibe una lista de multinacionales.
(define (multinacionalMasDinero lis)
  (local [
          (define (compare a b)
            (cond
              [(empty? b) a]
              [(eq? a b)
               (cons a (cons b empty))]
              [(> a b) a] 
              [else b]
              ))
          ]
    (cond
      [(empty? lis) empty]
      [else
       (compare (dineroTotal (first lis))
                (multinacionalMasDinero (rest lis))
                )
       ]
      )
    )
  )
(multinacionalMasDinero (cons MICROSOFT (cons UBISOFT empty)))