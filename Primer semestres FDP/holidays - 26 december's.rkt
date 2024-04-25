;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |holidays - 26 december's|) (read-case-sensitive #t) (teachpacks ((lib "guess.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "guess.rkt" "teachpack" "htdp")) #f)))
;;autor: Harold Montano 201968067
;fecha: 26 de Dic, 2019
;contrato: chequear-numero: number -> string
;proposito: Nos ayuda a encontrar un número ubicado entre 0 y 99999
;definicion:
(define (chequear-numero a b)
  (cond
    [(= a b) 'BINGO!!]
    [(> (abs (- a b)) 80000) 'mayo80.000]
    [(and (> (abs (- a b)) 70000) (<= (abs (- a b)) 80000)) 'mayor70.000]
    [(and (> (abs (- a b)) 50000) (<= (abs (- a b)) 70000)) 'mayor50.000]
    [(and (> (abs (- a b)) 45000) (<= (abs (- a b)) 50000)) 'mayor45.000] 
    [(and (> (abs (- a b)) 40000) (<= (abs (- a b)) 45000)) 'mayor40.000]
    [(and (> (abs (- a b)) 30000) (<= (abs (- a b)) 40000)) 'mayor35.000]
    [(and (> (abs (- a b)) 30000) (<= (abs (- a b)) 35000)) 'mayor30.000]
    [(and (> (abs (- a b)) 25000) (<= (abs (- a b)) 30000)) 'mayor25.000]
    [(and (> (abs (- a b)) 20000) (<= (abs (- a b)) 25000)) 'mayor20.000]
    [(and (> (abs (- a b)) 15000) (<= (abs (- a b)) 20000)) 'mayor15.000]
    [(and (> (abs (- a b)) 12000) (<= (abs (- a b)) 15000)) 'mayor12.000]
    [(and (> (abs (- a b)) 10000) (<= (abs (- a b)) 12000)) 'mayor10.000]
    [(and (> (abs (- a b)) 8000) (<= (abs (- a b)) 10000)) 'mayor8.000]
    [(and (> (abs (- a b)) 7000) (<= (abs (- a b)) 8000)) 'mayor7.000]
    [(and (> (abs (- a b)) 6000) (<= (abs (- a b)) 7000)) 'mayor6.000]
    [(and (> (abs (- a b)) 5000) (<= (abs (- a b)) 6000)) 'mayor5.000]
    [(and (> (abs (- a b)) 4500) (<= (abs (- a b)) 5000)) 'mayor4.500]
    [(and (> (abs (- a b)) 4000) (<= (abs (- a b)) 4500)) 'mayor4.000]
    [(and (> (abs (- a b)) 3500) (<= (abs (- a b)) 4000)) 'mayor3.500]
    [(and (> (abs (- a b)) 3000) (<= (abs (- a b)) 3500)) 'mayor3.000]
    [(and (> (abs (- a b)) 2500) (<= (abs (- a b)) 3000)) 'mayor2.500]
    [(and (> (abs (- a b)) 2000) (<= (abs (- a b)) 2500)) 'mayor2.000]
    [(and (> (abs (- a b)) 1800) (<= (abs (- a b)) 2000)) 'mayor1.800]
    [(and (> (abs (- a b)) 1600) (<= (abs (- a b)) 1800)) 'mayor1.600]
    [(and (> (abs (- a b)) 1400) (<= (abs (- a b)) 1600)) 'mayor1.400]
    [(and (> (abs (- a b)) 1200) (<= (abs (- a b)) 1400)) 'mayor1.200]
    [(and (> (abs (- a b)) 1000) (<= (abs (- a b)) 1200)) 'mayor1.000]
    [(and (> (abs (- a b)) 900) (<= (abs (- a b)) 1000)) 'mayor900]
    [(and (> (abs (- a b)) 800) (<= (abs (- a b)) 900)) 'mayor800]
    [(and (> (abs (- a b)) 700) (<= (abs (- a b)) 800)) 'mayor700]
    [(and (> (abs (- a b)) 600) (<= (abs (- a b)) 700)) 'mayor600]
    [(and (> (abs (- a b)) 500) (<= (abs (- a b)) 600)) 'mayor500]
    [(and (> (abs (- a b)) 400) (<= (abs (- a b)) 500)) 'mayor400]
    [(and (> (abs (- a b)) 300) (<= (abs (- a b)) 400)) 'mayor300]
    [(and (> (abs (- a b)) 200) (<= (abs (- a b)) 300)) 'mayor200]
    [(and (> (abs (- a b)) 100) (<= (abs (- a b)) 200)) 'mayor100]
    [(and (> (abs (- a b)) 80) (<= (abs (- a b)) 100)) 'mayor80]
    [(and (> (abs (- a b)) 60) (<= (abs (- a b)) 80)) 'mayor60]
    [(and (> (abs (- a b)) 50) (<= (abs (- a b)) 60)) 'mayor50]
    [(and (> (abs (- a b)) 40) (<= (abs (- a b)) 50)) 'mayor40]
    [(and (> (abs (- a b)) 30) (<= (abs (- a b)) 40)) 'mayor30]
    [(and (> (abs (- a b)) 20) (<= (abs (- a b)) 30)) 'mayor20]
    [(and (> (abs (- a b)) 15) (<= (abs (- a b)) 20)) 'mayor15]
    [(and (> (abs (- a b)) 10) (<= (abs (- a b)) 15)) 'mayor10]
    [(and (> (abs (- a b)) 7) (<= (abs (- a b)) 10)) 'mayor7]
    [(and (> (abs (- a b)) 5) (<= (abs (- a b)) 7)) 'mayor5]
    [(and (> (abs (- a b)) 3) (<= (abs (- a b)) 5)) 'mayor3]
    [else 'menor3]
   )
 )

(guess-with-gui chequear-numero)