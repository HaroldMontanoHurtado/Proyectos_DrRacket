;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |holidays - day 1|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;esta funcion recibe un numero y retorna verdadero si esta dentro de los rangos.
(define (dos-rangos a)
  (cond
    [(or
      (and (>= a 10) (<= a 20))
      (and (>= a 100) (<= a 120))
      )
     #t]
    [else #f]
    )
  )

(check-expect (dos-rangos 12) #t)
(check-expect (dos-rangos 9) #f)
(check-expect (dos-rangos 115) #t)
(check-expect (dos-rangos 76) #f)

;Funncion que recibe 4 numeros y retorna 1
(define (calcular-funcion x y z w)
  (/ (+ (sqr x) (* y z) (/ z -4) )
     (+ x (* y (+ z w) (/ (sqr y)
                          (+ (expt z 3) (* 3 (+ x 2)))
                         )
            )
       )
    )
 )

      

(calcular-funcion 6 2 3 15)
;4.675
(calcular-funcion -1 4 3 -9)
;−0.8876811594202...
(calcular-funcion -1 -9 3 -9)
;−0.184737...


;