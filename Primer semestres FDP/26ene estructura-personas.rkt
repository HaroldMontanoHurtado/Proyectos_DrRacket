;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |26ene estructura-personas|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;estructuras PERSONAS
(define-struct datos-persona
  (name apellido email)
  )

(define persona1
  (make-datos-persona 'Andres 'Hurtado 'andres@gmail.com))
(define persona2
  (make-datos-persona 'Brayan 'Morales 'brayan@gmai.com))
(define persona3
  (make-datos-persona 'Camila 'Paz 'camila@gmail.com))
(define persona4
  (make-datos-persona 'Pedro 'Perez 'Perez@hotmail.com))

;autor: Harold Montano 1968069-3743
;fecha: 26 de Enero, 2020
;contrato: actualizar-datos: struct -> struct
;proposito: esta funcion modifica la informacion de la estructura llamada.
;ejemplo:
;(actualizar-datos 1 persona1 ’Jaime)->(make-datos-persona 'Jaime 'Hurtado 'andres@gmail.com)
;(actualizar-datos 2 persona2 ’Hernandez)->(make-datos-persona 'Brayan ’Hernandez 'brayan@gmai.com)
;(actualizar-datos 3 persona4 ’PedroElPro@hotmail.com)
;->(make-datos-persona 'Pedro 'Perez 'PedroElPro@hotmail.com )
;codigo:
(define (actualizar-datos opcion persona datoNuevo)
  (cond
    [(= opcion 1) (make-datos-persona datoNuevo
                                      (datos-persona-apellido persona)
                                      (datos-persona-email persona)
                                      )]
    [(= opcion 2) (make-datos-persona (datos-persona-name persona)
                                      datoNuevo
                                      (datos-persona-email persona)
                                      )]
    [else (make-datos-persona (datos-persona-name persona)
                              (datos-persona-apellido persona)
                              datoNuevo)
          ]
   )
 )

;pruebas
(check-expect (actualizar-datos 1 persona1 'Jaime)
(make-datos-persona 'Jaime 'Hurtado 'andres@gmail.com))
(check-expect (actualizar-datos 2 persona2 'Hernandez)
(make-datos-persona 'Brayan 'Hernandez 'brayan@gmai.com))
(check-expect (actualizar-datos 3 persona4 'PedroElPro@hotmail.com)
(make-datos-persona 'Pedro 'Perez 'PedroElPro@hotmail.com))