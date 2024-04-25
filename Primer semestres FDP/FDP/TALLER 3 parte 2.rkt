;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |TALLER 3 parte 2|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;Teachpack
(require 2htdp/batch-io)
;ESTRUCTURAS
(define-struct empleado (cc nombre sueldo cargo telefono))
(define-struct vehiculo (placa tipo ciudad cantidadGalones velocidadMaxima distanciaXgalon))
(define-struct empresa (nit nombre  empleados direccion dineroActual vehiculo))
(define-struct multinacional (nit nombre empresasAsociadas))

;Autores: Harold Montano Hurtado 1968067-3743, Juan Rios 1968106-3743, Heider Castaño 1968179-3743
;Fecha: 08 de Febrero, 2020
;contrato: Archivos
;proposito: extraer informacion de los vehiculos y empleados que ve van a trabajar.
(define archivo-empleados1 (read-words/line "Data/empleados1.txt"))
(define archivo-empleados2 (read-words/line "Data/empleados2.txt"))
(define archivo-empleados3 (read-words/line "Data/empleados3.txt"))
(define archivo-vehiculos1 (read-words/line "Data/vehiculos1.txt"))
(define archivo-vehiculos2 (read-words/line "Data/vehiculos2.txt"))
(define archivo-vehiculos3 (read-words/line "Data/vehiculos3.txt"))

;Autores: Harold Montano Hurtado 1968067-3743, Juan Rios 1968106-3743, Heider Castaño 1968179-3743
;Fecha: 08 de Febrero, 2020
;contrato: texto->num: string -> number
;proposito: Funcion que cambien los strings a number, siempre y cuando cumpla las condicones establecidas.
(define (texto->num lis)
  (if
   (string-numeric? lis)
   (string->number lis)
   lis))

;Autores: Harold Montano Hurtado 1968067-3743, Juan Rios 1968106-3743, Heider Castaño 1968179-3743
;Fecha: 08 de Febrero, 2020
;contrato: list->empleado: list -> empleado
;proposito: funcion que recibe un lista con listas, y retorna una lista con estructuras
(define (list->empleado lis)
  (if
   (list? lis)
   (make-empleado (texto->num (first lis)) ;CC
                  (texto->num (second lis)) ;nombre
                  (texto->num (third lis)) ;Sueldo
                  (texto->num (fourth lis)) ;cargo
                  (texto->num (fifth lis)) ; telefono
                  )
   (error "no es una lista empresario")
   ))
;Autores: Harold Montano Hurtado 1968067-3743, Juan Rios 1968106-3743, Heider Castaño 1968179-3743
;Fecha: 08 de Febrero, 2020
;contrato: list-list->list-empleado: list -> list-structs
;proposito: funcion que recibe un lista de listas, y retorna una lista de estructuras tipo empleado
;definicion:
(define (list-list->list-empleado lis)
  (cond
    [(empty? lis) empty]
    [else
     (local [
             (define primero (first lis))
             (define resto (rest lis))
             (define estructuraEmpleados (list->empleado primero))
             (define recursion (list-list->list-empleado resto))
             ]
       (cond
         [(cons? primero)
          (cons estructuraEmpleados recursion)]
         [else (cons primero recursion)]
         )
       )]
    ))
;ejemplos:
(check-expect (list-list->list-empleado archivo-empleados1)
              (list
               (make-empleado 1143843823 "Roberto_Rivaz" 620000 "Aseo" 3485698)
               (make-empleado 11145876834 "Maria_Valencia" 1000000 "Asesor" 6789043)
               (make-empleado 1234678432 "Patricia_olaya" 279000 "Mantenimiento" 8765423))
              )
;________________________________________________________________________________________________________
;Autores: Harold Montano Hurtado 1968067-3743, Juan Rios 1968106-3743, Heider Castaño 1968179-3743
;Juan Rios 1968106-3743, Heider Castaño 1968179-3743
;Fecha: 08 de Febrero, 2020
;contrato: list->vehiculo: list -> vehiculo
;proposito: funcion que recibe un lista con listas, y retorna una lista con estructuras
(define (list->vehiculo lis)
  (if
   (list? lis)
   (make-vehiculo (texto->num (first lis))
                  (texto->num (second lis))
                  (texto->num (third lis))
                  (texto->num (fourth lis))
                  (texto->num (fifth lis))
                  (texto->num (sixth lis))
                  )
   (error "no es una lista empresario")
   ))
;ejemplo:
(check-expect (list->vehiculo (first archivo-vehiculos2))
              (make-vehiculo "WBC-896" "147_1.6_T_Spark_Eco_Impression" "Cali" "16.56" 180 "16.56")
              )

;Autores: Harold Montano Hurtado 1968067-3743, Juan Rios 1968106-3743, Heider Castaño 1968179-3743
;Fecha: 10 de Febrero, 2020
;contrato: list->vehiculo: list -> list-structs
;proposito:  funcion que recibe un lista de listas, y retorna una lista de estructuras tipo vehiculo
;definicion:
(define (list-list->list-vehiculo lis)
  (cond
    [(empty? lis) empty]
    [else
     (local [
             (define primero (first lis))
             (define resto (rest lis))
             (define estructuraVehiculo (list->vehiculo primero))
             (define recursion (list-list->list-vehiculo resto))
             ]
       (cond
         [(cons? primero)
          (cons estructuraVehiculo recursion)]
         [else (cons primero recursion)]
         )
       )]
    ))
;ejemplos:
(check-expect
 (list-list->list-vehiculo archivo-vehiculos1)
 (list
  (make-vehiculo "HVC-987" "GTO" "California" "15.4" 137 "39.2")
  (make-vehiculo "VCD-325" "Camaro" "California" "18.40" 240 "14.72")
  (make-vehiculo "DSR-456" "Brera_2.2_JTS_Coupe" "California" "18.40" 222 "24.89")
  (make-vehiculo "ZDE-439" "147_1.6_Progression" "Washinton_DC" "15.77" 195 "28.55")
  (make-vehiculo "ABE-070" "147_1.6_Twin_Spark_Impression" "New_York" "15.77" 300 "28.55"))
              )
;___________________________________________________________________________________________________________
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