;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname example) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
                                                                            ;sqr base al cuadrado
                                                                            ;sqrt raiz cuadrada
                                                                            ;expt base y exponente

; primeros ejercicios
;a
(/ (sqr (+ 1 (/ 4 7) 8) )
 (+ (- 5 3) (/ (expt 8 3) (+ 7 (- 3 (expt 8 3)) ) ) )
 )
;b
(/ (+ (expt (- 2 7) 3) (/ (+ (sqr 8) (* 2 (- 6 3))) (* (- 7 3) (- 9 4)) ) )
 (+ (sqr 8) (* 6 4) 7)
 ) ; no me da el resultado esperado
;c 
(/ (sqr (- 4 5))
 (+ (sqr 7) (* 6 9) (/ (+ 8 6) (* (+ 5 6) (- 7 (sqr 2)))))
 )
 
; segundo ejercicio
; a
(/ (sqrt (+ (sqr 8) (/ 7 4) (expt (+ (expt 8 3) (/ 2 (expt 6 3))) (/ 1 3))) )
 (expt (+ 1 (sin (sqrt (+ (sqr 3) (sqrt 3))))) 8)
 )
; b
(sqrt (expt(expt (+ 6 (/ 8 (sqrt (expt 5 3))) (expt 7 (sqrt (- 6 (/ 3 (sqrt (sqr 7))))))) (/ 1 4)) (/ 1 3))
 )


