;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |ejercicio 4 - estructuras|) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp")) #f)))
(define (f a b)
  (cond
    [(= a b) 'BINGO!]
    [(>= (abs (- b a)) 80000) "mayor a 80mil"]
    [(and (< (abs (- b a)) 80000) (>= (abs (- b a)) 60000)) "se paso por 60mil"]
    [(and (< (abs (- b a)) 60000) (>= (abs (- b a)) 40000)) "se paso por 40mil"]
    [(and (< (abs (- b a)) 40000) (>= (abs (- b a)) 20000)) "se paso por 20mil"]
    [(and (< (abs (- b a)) 20000) (>= (abs (- b a)) 10000)) "se paso por 10mil"]
    [(and (< (abs (- b a)) 10000) (>= (abs (- b a)) 9000)) "se paso por 9mil"]
    [(and (< (abs (- b a)) 9000) (>= (abs (- b a)) 7000)) "se paso por 7mil"]
    [(and (< (abs (- b a)) 7000) (>= (abs (- b a)) 5500)) "se paso por 5mil&medio"]
    [(and (< (abs (- b a)) 5500) (>= (abs (- b a)) 5000)) "se paso por 5mil"]
    [(and (< (abs (- b a)) 5000) (>= (abs (- b a)) 4500)) "se paso por 4mil&medio"]
    [(and (< (abs (- b a)) 4500) (>= (abs (- b a)) 4000)) "se paso por 4mil"]
    [(and (< (abs (- b a)) 4000) (>= (abs (- b a)) 3500)) "se paso por 3mil&medio"]
    [(and (< (abs (- b a)) 3500) (>= (abs (- b a)) 3000)) "se paso por 3mil"]
    [(and (< (abs (- b a)) 3000) (>= (abs (- b a)) 2500)) "se paso por 2mil&medio"]
    [(and (< (abs (- b a)) 2500) (>= (abs (- b a)) 2000)) "se paso por 2mil"]
    [(and (< (abs (- b a)) 2000) (>= (abs (- b a)) 1500)) "se paso por 1mil&medio"]
    [(and (< (abs (- b a)) 1500) (>= (abs (- b a)) 1000)) "se paso por mil"]
    [(and (< (abs (- b a)) 1000) (>= (abs (- b a)) 900)) "se paso por 900"]
    [(and (< (abs (- b a)) 900) (>= (abs (- b a)) 800)) "se paso por 800"]
    [(and (< (abs (- b a)) 800) (>= (abs (- b a)) 700)) "se paso por 700"]
    [(and (< (abs (- b a)) 700) (>= (abs (- b a)) 600)) "se paso por 600"]
    [(and (< (abs (- b a)) 600) (>= (abs (- b a)) 500)) "se paso por 500"]
    [(and (< (abs (- b a)) 500) (>= (abs (- b a)) 400)) "se paso por 400"]
    [(and (< (abs (- b a)) 400) (>= (abs (- b a)) 300)) "se paso por 300"]
    [(and (< (abs (- b a)) 300) (>= (abs (- b a)) 200)) "se paso por 200"]
    [(and (< (abs (- b a)) 200) (>= (abs (- b a)) 150)) "se paso por 150"]
    [(and (< (abs (- b a)) 150) (>= (abs (- b a)) 100)) "se paso por 100"]
    [(and (< (abs (- b a)) 100) (>= (abs (- b a)) 75)) "se paso por 75"]
    [(and (< (abs (- b a)) 75) (>= (abs (- b a)) 50)) "se paso por 50"]
    [(and (< (abs (- b a)) 50) (>= (abs (- b a)) 40)) "se paso por 40"]
    [(and (< (abs (- b a)) 40) (>= (abs (- b a)) 35)) "se paso por 35"]
    [(and (< (abs (- b a)) 35) (>= (abs (- b a)) 30)) "se paso por 30"]
    [(and (< (abs (- b a)) 30) (>= (abs (- b a)) 25)) "se paso por 25"]
    [(and (< (abs (- b a)) 25) (>= (abs (- b a)) 20)) "se paso por 20"]
    [(and (< (abs (- b a)) 20) (>= (abs (- b a)) 15)) "se paso por 15"]
    [(and (< (abs (- b a)) 15) (>= (abs (- b a)) 10)) "se paso por 10"]
    [(and (< (abs (- b a)) 10) (>= (abs (- b a)) 35)) "se paso por 5"]
    [else "menos de 5"]
   )
 )
(guess-with-gui f)


