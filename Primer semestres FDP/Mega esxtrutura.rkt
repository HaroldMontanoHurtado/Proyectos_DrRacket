;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Mega esxtrutura|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define-struct
  datos-personales
  (nombre telefono email)
 )

(define persona1 (make-datos-personales 'Pedro 3125657897  "pedro@gmail.com") )
(define persona2 (make-datos-personales 'Laura 3102312523  "laura@gmail.com") )
(define persona3 (make-datos-personales 'Jose 3112356653  "jose@gmail.com") )

(datos-personales-nombre persona1)
(datos-personales-telefono persona2)
(datos-personales-email persona3)