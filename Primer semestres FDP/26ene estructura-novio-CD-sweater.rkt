;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |26ene estructura-novio-CD-sweater|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;autor: Harold Montano 1968069-3743
;fecha: 26 de Enero, 2020
;contrato: cambiar-nombre-novio: struct -> struct
;proposito: Cambiar nombre del novio en los datos registrados.
;ejemplo: (cambiar-nombre-novio Jean 'Cristian)->(make-cristian 'Cristian 'Negro 'Café 'Samsung)
;codigo:
(define-struct boyfriend
  (name hair eyes phone))

(define Jean (make-boyfriend 'Jean 'Negro 'Café 'Samsung))
(define Cristian (make-boyfriend 'Cristian 'Mono 'Azules 'Apple))

(define (cambiar-nombre-novio name newName)
  (make-boyfriend newName
                  (boyfriend-hair name)
                  (boyfriend-eyes name)
                  (boyfriend-phone name)
                  )
 )

;pruebas
(check-expect (cambiar-nombre-novio Jean 'Cristian) (make-boyfriend 'Cristian 'Negro 'Café 'Samsung))

;autor: Harold Montano 1968069-3743
;fecha: 26 de Enero, 2020
;contrato: cambiar-artista: struct -> struct
;proposito: Cambiar el nombre del artista de los datos registrados.
;ejemplo; (cambiar-artista 'Elvis song1)->(make-CD 'Elvis 'Rise 2500)
;(cambiar-artista 'Kiss song2)->(make-CD 'Kiss 'Perfect 2000)
;(cambiar-artista 'LP song3)->(make-CD 'LP "Lamento Boliviano" 3000)
;codigo
(define-struct CD
  (artist title price))

(define song1 (make-CD 'Skillet 'Rise 2500))
(define song2 (make-CD "Ed Sheeran" 'Perfect 2000))
(define song3 (make-CD "Enanitos Verdes" "Lamento Boliviano" 3000))

(define (cambiar-artista newName struct)
  (make-CD newName
           (CD-title struct)
           (CD-price struct)
           )
  )
;pruebas
(check-expect (cambiar-artista 'Elvis song1) (make-CD 'Elvis 'Rise 2500))
(check-expect (cambiar-artista 'Kiss song2) (make-CD 'Kiss 'Perfect 2000))
(check-expect (cambiar-artista 'LP song3) (make-CD 'LP "Lamento Boliviano" 3000))

;autor: Harold Montano 1968069-3743
;fecha: 26 de Enero, 2020
;contrato: mejor-sweater: struct -> struct
;proposito: determinar cuale saco es mejor. A traves de determinar cual talla (size) es mayor.
;ejemplo: (mejor-sweater Bullitt Weezer)->(make-mejor-sweater 'Lana 20 Peru)
;(mejor-sweater BillCosby Bullitt)->(make-mejor-sweater 'Algodon 16 Colombia)
;codigo
(define-struct sweater
  (material size producer))

(define Bullitt (make-sweater 'Algodon 16 'Colombia))
(define Weezer (make-sweater 'Lana 20 'Peru))
(define BillCosby (make-sweater 'Lana 14 'China))

(define (mejor-sweater struct1 struct2)
  (cond
    [(> (sweater-size struct1) (sweater-size struct2)) struct1]
    [else struct2]
    )
  )

;pruebas
(check-expect (mejor-sweater Bullitt Weezer) (make-sweater 'Lana 20 'Peru))
(check-expect (mejor-sweater BillCosby Bullitt) (make-sweater 'Algodon 16 'Colombia))