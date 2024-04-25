;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname info-plan) (read-case-sensitive #t) (teachpacks ((lib "guess.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "guess.rkt" "teachpack" "htdp")) #f)))
;estructuras
(define-struct info-hotel (nombre  numNoches costoNoche infoHabitacion))
(define-struct info-habitacion (numCamas numBaños numDuchas))

(define-struct info-transporte (ciudadOrigen ciudadDestino valorTiquete numPersonas otros))
(define-struct otros-viaje-info (aeropuerto niños-ancianos))

(define-struct info-guia (ciudad nomPlan numSitios valorSitio))

(define-struct info-plan (valorHotel valorTransporte valorPlanGuia valorTotal))

;autor: Harold Montano 1968067-3743
;fecha: 08 de Enero, 2020
;contrato: calcular-hotel: info-hotel -> num
(define (calcular-hotel info-h)
  (* (info-hotel-costoNoche info-h) (info-hotel-numNoches info-h)
     (if (or (> (info-habitacion-numCamas (info-hotel-infoHabitacion info-h)) 2)
             (> (info-habitacion-numBaños (info-hotel-infoHabitacion info-h)) 3)
             (> (info-habitacion-numDuchas (info-hotel-infoHabitacion info-h)) 2)
             )
         1.25
         1
        )
    )
 )

;autor: Harold Montano 1968067-3743
;fecha: 08 de Enero, 2020
;contrato: calcular-transporte: info-transporte -> num
(define (calcular-costo-transporte info-t)
 (*
  (+
   (* (info-transporte-valorTiquete info-t) (info-transporte-numPersonas info-t))
   (otros-viaje-info-aeropuerto (info-transporte-otros info-t))
   (otros-viaje-info-niños-ancianos (info-transporte-otros info-t))
  )
 (if
  (> (info-transporte-numPersonas info-t) 5)
  0.6
  1
  )
 )
)

;autor: Harold Montano 1968067-3743
;fecha: 08 de Enero, 2020
;contrato: calcular-valor-guia: info-guia -> num
(define (calcular-valor-guia info-g)
  (*
   (info-guia-numSitios info-g) (info-guia-valorSitio info-g)
     (if
      (> (info-guia-numSitios info-g) 4)
      1.2
      1
     )
    )
 )


;autor: Harold Montano 1968067-3743
;fecha: 08 de Enero, 2020
;contrato: calcular-valor-plan: info-hotel, info-transporte, info-guia -> info-plan
;proposito: presentar en una estructura el costo total de un viaje truristico.
;ejemplos:

;definicion
(define (calcular-valor-plan info-h info-t info-g)
  (make-info-plan
   (calcular-hotel info-h)
   (calcular-costo-transporte info-t)
   (calcular-valor-guia info-g)
   (+ (calcular-hotel info-h) (calcular-costo-transporte info-t) (calcular-valor-guia info-g))
  )
)
;pruebas
(define hotel
  (make-info-hotel
   "tulua city"
   2
   20000
   (make-info-habitacion 2 4 5)
   ))

(define  transporte
  (make-info-transporte
   "cali"
   "cartagena"
   120000
   6
   (make-otros-viaje-info 4000 6000)
   ))

(define guia
  (make-info-guia
   "cartagena"
   "Plan FDP"
   5
   40000
   ))

(calcular-valor-plan hotel transporte guia)

;Autor: Harold Montano 201968067-3743
;fecha: 24 de Enero, 2020
;contrato: desplegar-informacion: info-plan, string -> string
;proposito: emitir una informacion comprensible para un usuario normal.
(define (desplegar-informacion plan nombre)
  (string-append
   "Señor "
   nombre
   " su plan tiene un costo total de "
   (number->string (info-plan-valorTotal plan))
   ", en hotel son "
   (number->string (info-plan-valorHotel plan))
   ", en transporte son "
   (number->string (info-plan-valorTransporte plan))
   ", en su plan de visita "
   (number->string (info-plan-valorPlanGuia plan))
   ", gracias por creer en nosotros :)"
  )
 )

(desplegar-informacion (calcular-valor-plan hotel transporte guia) "Carlos") 