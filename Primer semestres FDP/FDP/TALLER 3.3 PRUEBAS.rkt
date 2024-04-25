;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |TALLER 3.3 PRUEBAS|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;Estructuras
(define-struct empleado (cc nombre sueldo cargo telefono))
(define-struct vehiculo (placa tipo ciudad cantidadGalones velocidadMaxima distanciaXgalon))

;Lista
(define lista
  (list
   (list "1143843823" "Roberto_Rivaz" "620000" "Aseo" "3485698")
   (list "11145876834" "Maria_Valencia" "1000000" "Asesor" "6789043")
   (list "1234678432" "Patricia_olaya" "279000" "Mantenimiento" "8765423")) )
;Funcion auxiliar para las lista internas
;(define (list->list lis)
;  (cond
;    [(empty? lis) empty]
;    [(string-numeric? (first lis))
;     (cons (string->number (first lis)) (list->list (rest lis)))]
;    [else
;     (cons (first lis) (list->list (rest lis)))]
;    ))
;Funcion para lista de listas
;(define (list-list->list-empleado lis)
;  (cond
;    [(empty? lis) lis]
;    [(cons? (first lis))
;     (cons (list->list (first lis)) (list-list->list-empleado (rest lis)))]
;    [else
;     (cons (first lis) (list-list->list-empleado (rest lis)))]
;    ))
;-----------------------------------------------------------------------------------
;Funcion que cambien los strings a number, siempre y cuando sea posible 
(define (texto->num a)
  (if
   (string-numeric? a)
   (string->number a)
   a))
;funcion que recibe un lista con listas, y retorna una lista con estructuras
(define (list->struct lis)
  (if
   (list? lis)
   (make-empleado (texto->num (first lis))
                  (texto->num (first (rest lis)))
                  (texto->num (first (rest (rest lis))))
                  (texto->num (first (rest (rest (rest lis)))))
                  (texto->num (first (rest (rest (rest (rest lis))))))
                  )
   (error "no es una lista empresario")
   ))

;funcion que recibe un lista con listas, y retorna una lista con estructuras
(define (list-list->list-empleado lis)
  (cond
    [(empty? lis) empty]
    [(cons? (first lis))
     (cons (list->struct (first lis)) (list-list->list-empleado (rest lis)))]
    [else (cons (first lis) (list-list->list-empleado (rest lis)))]
    ))
(check-expect
 (list-list->list-empleado lista)
 (list
  (make-empleado 1143843823 "Roberto_Rivaz" 620000 "Aseo" 3485698)
  (make-empleado 11145876834 "Maria_Valencia" 1000000 "Asesor" 6789043)
  (make-empleado 1234678432 "Patricia_olaya" 279000 "Mantenimiento" 8765423)) )