;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Por fiiin!!!|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;autor: Harold Montano 201968067
;fecha: 19 de Dic, 2019
;contrato: emitir-mensaje: number, string, boolean-> string
;proposito: Dar una recomendacion por el paro del 21 de Nov
;ejemplos:
;(emitir-mensaje 9 "Carlos" true) "Eres muy pequeño para marchar Carlos"
;(emitir-mensaje 9 "Daniel" false) "Apoya en Twitter Daniel"
;(emitir-mensaje 14 "Camilo" true) "Aun eres muy pequeño para marchar"
;(emitir-mensaje 13 "John" false) "Apoya en Instagram John"
;(emitir-mensaje 17 "Santiago" true) "ok"
;(emitir-mensaje 20 "Juan" false) "#Noapoyoelparo Juan"
;(emitir-mensaje 28 "Julio" true) "Vaya trabaje Julio"
;(emitir-mensaje 30 "Andres" false) "veaRCN Andres"
;definicion:
(define (emitir-mensaje edad nombre marchael21?)
  (cond
    [(and (and (>= edad 0) (< edad 10)) (equal? marchael21? #true))
     (string-append "Eres muy pequeño para marchar" " " nombre)]
    [(and (and (>= edad 0) (< edad 10)) (equal? marchael21? #false))
     (string-append "Apoya en twitter" " " nombre)]
    [(and (and (>= edad 10) (< edad 16)) (equal? marchael21? #true))
     (string-append "Aun eres muy pequeño para marchar" " " nombre)]
    [(and (and (>= edad 10) (< edad 16)) (equal? marchael21? #false))
     (string-append "Apoya en Instagram" " " nombre)]
    [(and (and (>= edad 16) (< edad 28)) (equal? marchael21? #true))
     "ok"]
    [(and (and (>= edad 16) (< edad 28)) (equal? marchael21? #false))
      (string-append "#Noapoyoelparo" " " nombre)]
    [(and (>= edad 28) (equal? marchael21? #true))
     (string-append "Vaya trabaje" " " nombre)]
    [(and (>= edad 28) (equal? marchael21? #false))
     (string-append "veaRCN" " " nombre)]
    [else (error "Se de ingresar datos en el orden Numero, Texto, Verdadero o Falso")]
   )
 )

;pruebas:
(check-expect (emitir-mensaje 9 "Carlos" true) "Eres muy pequeño para marchar Carlos")
(check-expect (emitir-mensaje 9 "Daniel" false) "Apoya en twitter Daniel")
(check-expect (emitir-mensaje 14 "Camilo" true) "Aun eres muy pequeño para marchar Camilo")
(check-expect (emitir-mensaje 13 "John" false) "Apoya en Instagram John")
(check-expect (emitir-mensaje 17 "Santiago" true) "ok")
(check-expect (emitir-mensaje 20 "Juan" false) "#Noapoyoelparo Juan")
(check-expect (emitir-mensaje 28 "Julio" true) "Vaya trabaje Julio")
(check-expect (emitir-mensaje 30 "Andres" false) "veaRCN Andres")
(emitir-mensaje 25 #true "Camilo")