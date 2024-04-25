;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname discoteca) (read-case-sensitive #t) (teachpacks ((lib "guess.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "guess.rkt" "teachpack" "htdp")) #f)))
;Autor: Harold Montano 201968067-3743
;Fecha: 24 de Enero, 2020
;Contrato: discoteca: string, number-> string
;proposito: Esta funcion determina si una persona puede entrar a la discoteca, o no. De acuerdo a la edad.
;ejemplo:
;(discoteca "Daniel" 12) "No puedes entrar Daniel eres muy pequeño"
;(discoteca "John" 13) "No puedes pasar a la discoteca John, pero puedes ir a la chiquiteca"
;(discoteca "Camilo" 15) "Lo siento Camilo, solo puedes pasar al Galpón"
;(discoteca "Carlos" 19) "Carlos, puedes ingresar a la discoteca"
;codigo
(define (discoteca name old)
  (cond
    [(<= old 12)
     (string-append "No puedes entrar " name " eres muy pequeño")]
    [(and (> old 12) (<= old 14))
     (string-append "No puedes pasar a la discoteca " name ", pero puedes ir a la chiquiteca")]
    [(and (> old 14) (< old 18))
     (string-append "Lo siento " name ", solo puedes pasar al Galpón")]
    [(> old 18)
     (string-append name ", puedes ingresar a la discoteca")]
    [else (error "ha ingresado datos no validos")]
   )
 )

;pruebas:
(check-expect (discoteca "Daniel" 12) "No puedes entrar Daniel eres muy pequeño")
(check-expect (discoteca "John" 13) "No puedes pasar a la discoteca John, pero puedes ir a la chiquiteca")
(check-expect (discoteca "Camilo" 15) "Lo siento Camilo, solo puedes pasar al Galpón")
(check-expect (discoteca "Carlos" 19) "Carlos, puedes ingresar a la discoteca")