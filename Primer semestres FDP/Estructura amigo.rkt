;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Estructura amigo|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define-struct
  amigo
  (nombre edad altura correo telefono)
  )

;autor: Harold Montano-1968067
;fecha: 30 de nov, 2019
;contrato: amigo-mayor: amigo, amigo, amigo -> amigo
;proposito: esta funcion recibe 3 amigos y retorna el de mayor edad
;ejemplo:
;(define amigo1 (make-amigo 'Carlos 19 168 "carlo@gmail.com" 12121221))
;(define amigo2 (make-amigo 'Daniel 28 174 "daniel@hotmail.com" 23232332))
;(define amigo3 (make-amigo 'Camilo 34 180 "camilo@yahoo.es" 34343443))
;(define amigo4 (make-amigo 'Marcela 21 166 "marcela@gmail.com" 45454554))
;(amigo-mayor amigo2 amigo3 amigo4)-> (make-amigo 'Camilo 34 180 "camilo@yahoo.es" 34343443)
;(amigo-mayor amigo1 amigo2 amigo4)-> (make-amigo 'Daniel 28 174 "daniel@hotmail.com" 23232332)

(define (amigo-mayor am1 am2 am3)
  (cond
    [(and (> (amigo-edad am1) (amigo-edad am2))
          (> (amigo-edad am1) (amigo-edad am3)))
     am1]
    [(> (amigo-edad am2) (amigo-edad am3))
     am2]
    [else (amigo-edad am3)]
   )
 )

(define amigo1 (make-amigo 'Carlos 19 168 "carlo@gmail.com" 12121221))
(define amigo2 (make-amigo 'Daniel 28 174 "daniel@hotmail.com" 23232332))
(define amigo3 (make-amigo 'Camilo 34 180 "camilo@yahoo.es" 34343443))
(define amigo4 (make-amigo 'Marcela 21 166 "marcela@gmail.com" 45454554))

(amigo-mayor amigo2 amigo3 amigo4)
(amigo-mayor amigo1 amigo2 amigo4)