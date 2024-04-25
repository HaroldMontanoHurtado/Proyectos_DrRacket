;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |Proyecto Final pruebas|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;Teachpack
(require 2htdp/batch-io)
;estructuras
(define-struct Libro (titulo autores lugarPublicacion añoPublicacion
                             ISBN materias calificacion cantidadEjemplares))
(define-struct estudiante (nombre programa codigo))
(define-struct profesor (nombre cedula))
(define-struct funcionario (nombre cedula dependenciaDeTrabajo))
;-----------------------------------------------------------------
(define (texto->num lis)
  (if
   (string-numeric? lis)
   (string->number lis)
   lis))
;--------------------------------------------------------------------------------
(define (listaLibros lis) 
  (local [
          (define (list->libro lis)
            (if
             (list? lis)
             (make-Libro (texto->num (first lis)) ;titulo
                         (texto->num (second lis)) ;autores
                         (texto->num (third lis)) ;lugar de Publicacion
                         (texto->num (fourth lis)) ;año de Publicacion
                         (texto->num (fifth lis)) ;ISBN
                         (texto->num (sixth lis)) ;materias
                         (texto->num (seventh lis)) ;Calificacion
                         (texto->num (eighth lis)) ;cantidad de Ejemplares
                         )
             (error "no es una lista tipo Libro")
             ))
          ]
    (cond
      [(empty? lis) empty]
      [else
       (local [
               (define primero (first lis))
               (define resto (rest lis))
               (define estructuraLibro (list->libro primero))
               (define recursion (listaLibros resto))
               ]
         (cond
           [(cons? primero)
            (cons estructuraLibro recursion)]
           [else (cons primero recursion)]
           )
         )]
      ))
  )
;------------------------------------------------------------------
(define (ingresar-usuario ? lis)
  (local [
          (define (list->usuario lst)
            (if
             (and (cons? lst)
                  (eq? (length lst) 3)
                  (? (texto->num (third lst)) ))
             (make-estudiante (texto->num (first lst)) ;nombre
                              (texto->num (second lst)) ;programa
                              (texto->num (third lst)) ;codigo
                              )
             lst))
          ]
    (cond
      [(empty? lis) empty]
      [else
       (local [
               (define primero (first lis))
               (define resto (rest lis))
               (define estructuraEstudiantes (list->usuario primero))
               (define recursion (ingresar-usuario ? resto))
               ]
         (cond
           [(cons? primero)
            (cons estructuraEstudiantes recursion)]
           [else (cons primero recursion)]
           )
         )]
      ))
  )
;------------------------------------------------------------------
(define (ingresar-profesor lis)
  (local [
          (define (list->profesor lst)
            (if
             (and (cons? lst)
                  (eq? (length lst) 2))
             (make-profesor (texto->num (first lst)) ;nombre
                            (texto->num (second lst)) ;cedula
                            )
             lst))
          ]
    (cond
      [(empty? lis) empty]
      [else
       (local [
               (define primero (first lis))
               (define resto (rest lis))
               (define estructuraProfesor (list->profesor primero))
               (define recursion (ingresar-profesor resto))
               ]
         (cond
           [(cons? primero)
            (cons estructuraProfesor recursion)]
           [else (cons primero recursion)]
           )
         )]
      ))
  )
;------------------------------------------------------------------
(define (cargar-datos link-libros link-usuarios)
  (list (listaLibros (read-words/line link-libros)) 
        (ingresar-profesor
         (ingresar-usuario number?
          (ingresar-usuario string?
           (read-words/line link-usuarios))
          )
         )
        )
  )
(define lisUsuarios (read-words/line "data/usuarios.txt"))
(cargar-datos "data/libros.txt" "data/usuarios.txt")