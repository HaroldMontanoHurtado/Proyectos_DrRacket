;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |TALLER 3 parte 3|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
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

;Autores: Harold Montano Hurtado 1968067-3743, Juan Rios 1968106-3743, Heider Castaño 1968179-3743
;Fecha: 08 de Febrero, 2020
;contrato: texto->num: string -> number
;proposito: Funcion que cambien los strings a number, siempre y cuando cumpla las condicones establecidas.
(define (texto->num lis)
  (if
   (string-numeric? lis)
   (string->number lis)
   lis))
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
;Autores: Harold Montano Hurtado 1968067-3743, Juan Rios 1968106-3743, Heider Castaño 1968179-3743
;Fecha: 14 de Febrero, 2020
;contrato: velocidadMaxima: lista de vehiculos -> numero
;proposito: La funcion recibe una lista de vehiculos y retorna el valor de la velocidad maxima.
;definicion:
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
;Autores: Harold Montano Hurtado 1968067-3743, Juan Rios 1968106-3743, Heider Castaño 1968179-3743
;Fecha: 14 de Febrero, 2020
;contrato: vehiculoMasRapido: lista de vehiculos -> vehiculo
;proposito: La funcion recibe una lista de vehiculos y retorna el vehiculo mas rapido.
;definicion:
(define (vehiculoMasRapido lis)
  (cond
    [(empty? lis) empty]
    [else
     (local
       [
        (define filtrado (list-list->list-vehiculo lis))
        (define primeraVelocidad (vehiculo-velocidadMaxima (first filtrado)))
        ]
       (cond
         [(eq? (velocidadMaxima lis)
               primeraVelocidad)
          (first filtrado)]
         [else
          (vehiculoMasRapido (rest lis))]
         )
       )]
    )
  )
;ejemplos:
(check-expect (vehiculoMasRapido archivo-vehiculos1)
              (make-vehiculo "ABE-070" "147_1.6_Twin_Spark_Impression" "New_York" "15.77" 300 "28.55")
              )
;________________________________________________________________________________________________________
;Autores: Harold Montano Hurtado 1968067-3743, Juan Rios 1968106-3743, Heider Castaño 1968179-3743
;Fecha: 19 de Febrero, 2020
;contrato: empresaVehiculo: empresa-> vehiculo
;proposito: Extraer el vehiculo más rapido de una estructua empresa.
;definicion:
(define (empresaVehiculo emp)
  (cond
    [(empresa? emp)
     (vehiculoMasRapido (empresa-vehiculo emp))]
    [else
     (error "Se debe ingresar una estructura tipo empresa")]
    ))
;Autores: Harold Montano Hurtado 1968067-3743, Juan Rios 1968106-3743, Heider Castaño 1968179-3743
;Fecha: 19 de Febrero, 2020
;contrato: empresaVehiculoMasRapido: empresa ->  numero
;proposito: 
;definicion:
(define (empresaVehiculoMasRapido emp)
  (local [
          (define filtro (velocidadMaxima (empresa-vehiculo emp)))
          ]
    filtro)
  )
;Autores: Harold Montano Hurtado 1968067-3743, Juan Rios 1968106-3743, Heider Castaño 1968179-3743
;Fecha: 19 de Febrero, 2020
;contrato: list-empresasVehiculoMasRapido: lista-> numero
;proposito: Busca la velocidad maxima en una lista de empresas y retorna la velocidad maxima
;definicion:
(define (list-empresasVehiculoMasRapido lis)
  (local [
          (define (compare a b) ;;;;comparacion
            (cond
              [(empty? b) a]
              [(>= a b) a] 
              [else b]
              ))
          ]
    (cond
      [(empty? lis) empty]
      [else
       (local [
               (define primeraVelocidad (empresaVehiculoMasRapido (first lis)))
               (define recursion (list-empresasVehiculoMasRapido (rest lis)))
               ]
         (compare primeraVelocidad
                  recursion)
         )
       ]
      ))
  )
;Autores: Harold Montano Hurtado 1968067-3743, Juan Rios 1968106-3743, Heider Castaño 1968179-3743
;Fecha: 20 de Febrero, 2020
;contrato: burcarVehiculo: listaEmpresas -> vehiculo
;proposito: Esta funcion recibe una lista de empresas y retorna el vehiculo más rapido.
;definicion:
(define (burcarVehiculo lis)
  (cond
    [(empty? lis) empty]
    [else
     (local [
             (define velMax (list-empresasVehiculoMasRapido lis))
             ]
       (cond
         [(empresa? (first lis))
          (if
           (eq? velMax
                (empresaVehiculoMasRapido (first lis)))
           (empresaVehiculo (first lis))
           (burcarVehiculo (rest lis))
           )
          ]
         [else (burcarVehiculo (rest lis))]
         )
       )
     ]
    )
  )
;Autores: Harold Montano Hurtado 1968067-3743, Juan Rios 1968106-3743, Heider Castaño 1968179-3743
;Fecha: 20 de Febrero, 2020
;contrato: 
;proposito: Esta funcion recibe una multicacional, y retorna el vehiculo más rapido
;definicion:
(define (vehiculoMasRapidoMultinacional mult)
  (burcarVehiculo (multinacional-empresasAsociadas mult))
  )
;ejemplos:
(check-expect
 (vehiculoMasRapidoMultinacional MICROSOFT)
 (make-vehiculo "BHU-451" "Alfasud_Ti" "Medellin" "13.14" 500 "13.14")
 )

;_______________________________________________________________________________________________________
;Autores: Harold Montano Hurtado 1968067-3743, Juan Rios 1968106-3743, Heider Castaño 1968179-3743
;Fecha: 20 de Febrero, 2020
;contrato: sumaDineroEmpresas: lista-empresas-> numero
;proposito: Funcion que recibe una lista de empresas y retorna la suma de su dinero actual
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
;ejemplos:
(check-expect
 (sumaDineroEmpresas LISTA-EMPRESAS1)
 1900000)
(check-expect
 (sumaDineroEmpresas LISTA-EMPRESAS2)
 6500000)
;________________________________________________________________________________________________________
;Autores: Harold Montano Hurtado 1968067-3743, Juan Rios 1968106-3743, Heider Castaño 1968179-3743
;Fecha: 20 de Febrero, 2020
;contrato: dineroTotal: multinacional -> numero
;proposito: Esta funcion nos permite calcular el dinero total que posee una mutinacional,
;dado la suma del dinero actual de totas las empresas que la componen.
(define (dineroTotal mult)
  (sumaDineroEmpresas (multinacional-empresasAsociadas mult)) )

;ejemplos:
(check-expect
 (dineroTotal MICROSOFT)
 1900000)
(check-expect
 (dineroTotal UBISOFT)
 6500000)
;_________________________________________________________________________________________________________
;Autores: Harold Montano Hurtado 1968067-3743, Juan Rios 1968106-3743, Heider Castaño 1968179-3743
;Fecha: 20 de Febrero, 2020
;contrato: multinacionalDinero: Lista -> numero 
;proposito: recibe una lista de mutinacionales y retorna la catidad de dinero mayor
(define (dineroMultinacional lis)
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
                (dineroMultinacional (rest lis))
                )
       ]
      )
    )
  )

;Autores: Harold Montano Hurtado 1968067-3743, Juan Rios 1968106-3743, Heider Castaño 1968179-3743
;Fecha: 20 de Febrero, 2020
;contrato: multinacionalMasDinero: Lista -> multinacional 
;proposito:
(define (multinacionalMasDinero lis)
  (cond
    [(empty? lis) empty]
    [else
     (local [
             (define mayorDinero (dineroMultinacional lis))
             ]
       (cond
         [(multinacional? (first lis))
          (if
           (eq? mayorDinero
                (dineroTotal (first lis)))
           (first lis)
           (multinacionalMasDinero (rest lis))
           )]
         [else (multinacionalMasDinero (rest lis))]
         )
       )]
    )
  )

(define listaMultinacionales (list MICROSOFT UBISOFT))
;ejemplo
(check-expect
 (multinacionalMasDinero listaMultinacionales)
 UBISOFT)