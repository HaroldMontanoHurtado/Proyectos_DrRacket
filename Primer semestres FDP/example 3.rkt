;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |example 3|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; 1. dar un nombre
; 2. Describir el prototipo
; 3. dar ejemplos. caracaterizar la relación entrada-salida
; 5. cuerpo definir. el CODIGO
; &. Pruebas. ejecutar la función

; variable es un nombre
; x=5 -> (define x 5)
; y=8 -> (define x 8)
; si uso las variables
; (+ x y) -> deberia ser = 11
; (- y x) = 3
; (define variableA ´hola)
; 'hola -> es un simbolo que no permite texto sin espacio
; "hola mundo" si permite textos espacios
; (define (f x) (sqr x))
; para darle un valor a X se debe llamar a la función
; (f 5) debe ser = 25
; el contrato me dice que solo espera un número

(define (f x) (sqr x))
(f 4)
(f 5)
(f 3)

; a la funcion podes llamarla con otro indice si ya tenesmos otra con igual nombre
; una funcion puede recibir varios argumentos, si asi lo definimos en el contrato
; ejemplo
; (define (f1 a b c d) (+ (sqr a) (sqrt b) (/ a b) (- b (sqr c))))
; llamar a la funcion
; (f1 7 1 2 3)
;prueba

