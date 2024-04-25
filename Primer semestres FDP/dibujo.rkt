;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname dibujo) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.rkt" "teachpack" "htdp")) #f)))
;autor: Harold Montano 201968067-3743
;fecha:25 de nov, 2019
;proposito: Desarrollar un dibujo con la herramienta draw.rkt

(start 550 500)
;cielo
(draw-solid-rect (make-posn 0 0) 550 220 'blue)

;suelo
(draw-solid-rect (make-posn 0 220) 550 280 'green)

;pico
(draw-solid-rect (make-posn 400 90) 20 40 'black)
(draw-solid-rect (make-posn 360 70) 40 20 'black)
(draw-solid-rect (make-posn 420 130) 20 80 'black)
(draw-solid-rect (make-posn 400 210) 20 20 'black)
(draw-solid-rect (make-posn 380 150) 20 60 'black)
(draw-solid-rect (make-posn 280 50) 80 20 'black)
(draw-solid-rect (make-posn 260 70) 20 20 'black)
(draw-solid-rect (make-posn 280 90) 60 20 'black)
(draw-solid-rect (make-posn 340 110) 20 20 'black)
(draw-solid-rect (make-posn 360 130) 20 20 'black)
(draw-solid-rect (make-posn 340 110) 20 20 'black)
(draw-solid-rect (make-posn 320 130) 20 20 'black)
(draw-solid-rect (make-posn 340 150) 20 20 'black)
(draw-solid-rect (make-posn 300 150) 20 20 'black)
(draw-solid-rect (make-posn 320 170) 20 20 'black)
(draw-solid-rect (make-posn 280 170) 20 20 'black)
(draw-solid-rect (make-posn 300 190) 20 20 'black)
(draw-solid-rect (make-posn 280 170) 20 20 'black)
(draw-solid-rect (make-posn 260 190) 20 20 'black)
(draw-solid-rect (make-posn 280 210) 20 20 'black)
(draw-solid-rect (make-posn 240 210) 20 20 'black)
(draw-solid-rect (make-posn 260 230) 20 20 'black)
(draw-solid-rect (make-posn 240 230) 20 20 'black)

(draw-solid-rect (make-posn 360 90) 40 40 'white)
(draw-solid-rect (make-posn 400 130) 20 80 'white)
(draw-solid-rect (make-posn 280 70) 80 20 'white)
(draw-solid-rect (make-posn 280 70) 80 20 'white)
(draw-solid-rect (make-posn 340 90) 20 20 'white)
(draw-solid-rect (make-posn 380 130) 20 20 'white)

(draw-solid-rect (make-posn 400 70) 20 20 'yellow)
(draw-solid-rect (make-posn 380 90) 20 20 'yellow)
(draw-solid-rect (make-posn 340 130) 20 20 'yellow)
(draw-solid-rect (make-posn 320 150) 20 20 'yellow)
(draw-solid-rect (make-posn 300 170) 20 20 'yellow)
(draw-solid-rect (make-posn 280 190) 20 20 'yellow)
(draw-solid-rect (make-posn 260 210) 20 20 'yellow)

;persona
(draw-solid-rect (make-posn 110 170) 90 90 'yellow)
(draw-solid-rect (make-posn 80 260) 150 145 'red)
(draw-solid-rect (make-posn 105 405) 100 90 'blue)

