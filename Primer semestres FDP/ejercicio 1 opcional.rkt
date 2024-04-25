;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |ejercicio 1 opcional|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;;Ejercicios 1
;;;Procesamiento de datos simples
;;Autor: Harold Montano
;;Fecha: 1 de Dic, 2019
;;Contrato: calcular-salario: profesor, profesor, profesor profesor-> profesor
;;Proposito: esta funcion lo que hacer es recibir 4 profesores y retornar sus salarios con las bonificacoines
;;Ejemplos:
;

;;Definición:

(define-struct profe-nombrado
  (nombre salario horaadmin asig1 asig2 asig3)
 )
(define-struct profe-ocasional
  (nombre salario asig1 asig2 asig3)
 )
(define-struct profe-catedra
  (nombre valor-hora asig1 asig2 asig3)
 )
(define-struct asignatura
  (nombre numEstudiantes numHoras)
 )

(define calculo (make-asignatura 'calculo 9 8))
(define discretas (make-asignatura 'discretas 12 7))
(define ingles (make-asignatura 'ingles 16 7))
(define español (make-asignatura 'español 14 5))
(define historia (make-asignatura 'historia 10 4))
(define sociales (make-asignatura 'sociales 15 6))

(define nombradoA (make-profe-nombrado 'Carlos 600000 16 discretas ingles calculo))
(define nombradoB (make-profe-nombrado 'Daniel 845000 22 ingles sociales español))
(define ocacionalA (make-profe-ocasional 'Valeria 467000 calculo discretas ingles))
(define ocacionalB (make-profe-ocasional 'Andres 556000 sociales español historia))
(define catedraA (make-profe-catedra 'Javier 10000 calculo discretas ingles))
(define catedraB (make-profe-catedra 'Dora 23000 ingles español historia))

;profesor nombrado
(define (calcular-salario profesor)
  (make-profe-nombrado
   (profe-nombrado-nombre profesor)
   (cond
     [(> (profe-nombrado-horaadmin profesor) 20)
      (* 1.2 (profe-nombrado-salario))]
     [(> (+ (asignatura-numEstudiantes (proferos-asig1))
         (asignatura-numEstudiantes (proferos-asig2))
         (asignatura-numEstudiantes (proferos-asig3))
       ) 40)
      (* 1.1 (profesor-salario))]
    )
   (profe-nombrado-horaadmin profesor)
   (profe-nombrado-asig1 profesor)
   (profe-nombrado-asig2 profesor)
   (profe-nombrado-asig3 profesor)
   )
 )


;(calcular-salario nombradoA)






