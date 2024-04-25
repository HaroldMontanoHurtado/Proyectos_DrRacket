;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |Proyecto Final 1.0|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;PROYECTO FINAL
;;;Autor:Harold Montano Hurtado 201968067-3743
;fecha: 07 de Marzo, 2019
;Teachpack
(require 2htdp/batch-io)
;Estructuras
(define cantidadEjemplares (make-vector 1))
(define-struct libro (titulo autores lugarPublicacion añoPublicacion
                             ISBN materias calificacion cantidadEjemplares))
(define-struct estudiante (nombre programa codigo))
(define-struct profesor (nombre cedula))
(define-struct funcionario (nombre cedula dependenciaDeTrabajo))
;;;Autor:Harold Montano Hurtado 201968067-3743
;fecha: 07 de Marzo, 2019
;contrato: texto->num: string->number or number->number
;proposito: esta funcion que si recibe un string, comprueba si se puede convertir a numero, si se puede lo hace, si no, lo retorna igual.
(define (texto->num x)
  (if
   (string-numeric? x)
   (string->number x)
   x))
;;;Autor:Harold Montano Hurtado 201968067-3743
;fecha: 07 de Marzo, 2019
;contrato: listaLibros: lista -> libro
;proposito: Se le envia una lista para convertila en una estructura tipo libro
(define (listaLibros lis)
  (local [
          (define (list->libro lis)
            (if
             (list? lis)
             (make-libro (texto->num (first lis)) ;titulo
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
;;;Autor:Harold Montano Hurtado 201968067-3743
;fecha: 07 de Marzo, 2019
;contrato: ingresar-profesor: lista -> estudiante
;proposito: Se le envia una lista y verifica si cada elemento de la lista califica para
;ser una estrutura estudiante, si es verdadero, entonces crea una estructura estudiante.
(define (ingresar-estudiante lis)
  (local [
          (define (list->estudiante lst)
            (if
             (and (cons? lst)
                  (eq? (length lst) 3)
                  (number? (texto->num (third lst)) ))
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
               (define estructuraEstudiantes (list->estudiante primero))
               (define recursion (ingresar-estudiante resto))
               ]
         (cond
           [(cons? primero)
            (cons estructuraEstudiantes recursion)]
           [else (cons primero recursion)]
           )
         )]
      ))
  )
;;;Autor:Harold Montano Hurtado 201968067-3743
;fecha: 07 de Marzo, 2019
;contrato: ingresar-profesor: lista -> profesor
;proposito: Se le envia una lista y verifica si cada elemento de la lista califica para
;ser una estrutura profesor, si es verdadero, entonces crea una estructura profesor.
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
;;;Autor:Harold Montano Hurtado 201968067-3743
;fecha: 07 de Marzo, 2019
;contrato: ingresar-profesor: lista -> funcionario
;proposito: Se le envia una lista y verifica si cada elemento de la lista califica para
;ser una estrutura funcionario, si es verdadero, entonces crea una estructura funcionario.
(define (ingresar-funcionario lis)
  (local [
          (define (list->funcionario lst)
            (if
             (and (cons? lst)
                  (eq? (length lst) 3)
                  (string? (texto->num (third lst))))
             (make-funcionario (texto->num (first lst)) ;nombre
                               (texto->num (second lst)) ;cedula
                               (texto->num (third lst)) ;dependencia De Trabajo
                               )
             lst))
          ]
    (cond
      [(empty? lis) empty]
      [else
       (local [
               (define primero (first lis))
               (define resto (rest lis))
               (define estructuraFuncionario (list->funcionario primero))
               (define recursion (ingresar-funcionario resto))
               ]
         (cond
           [(cons? primero)
            (cons estructuraFuncionario recursion)]
           [else (cons primero recursion)]
           )
         )]
      ))
  )
;;;Autor:Harold Montano Hurtado 201968067-3743
;fecha: 07 de Marzo, 2019
;contrato: cargar-datos: lista con listas -> lista de libros y lista de usuarios
;proposito: Se le envia una lista con listas y verifica si cada elemento de la lista califica para distinas tipos
;de estructuras, si cumple con las condiciones de alguna de las funciones, se le aplicará aquella funcion
(define (cargar-datos link-libros link-usuarios)
  (list (listaLibros (read-words/line link-libros)) 
        (ingresar-profesor
         (ingresar-funcionario
          (ingresar-estudiante
           (read-words/line link-usuarios))
          )
         )
        )
  )

;(cargar-datos "data/libros.txt" "data/usuarios.txt")

(define listaDeLibros (listaLibros (read-words/line "data/libros.txt")))
(define listaDeUsuarios (ingresar-profesor
                         (ingresar-funcionario
                          (ingresar-estudiante
                           (read-words/line "data/usuarios.txt")))))
;;;Autor:Harold Montano Hurtado 201968067-3743
;fecha: 07 de Marzo, 2019
;contrato: buscar-libro: lista de libros, funcion -> lista
;proposito: se le envia una funcion para que esta verifique que es lo que busca dentro de la lista
(define (buscar-libro llibros f)
  (cond
    [(empty? llibros) empty]
    [(f (first llibros))
     (cons (first llibros) (buscar-libro (rest llibros) f))]
    [else (buscar-libro (rest llibros) f)]
    ))
(define (buscar-autor autor)
  (buscar-libro listaDeLibros
                (lambda (x) (eq? (libro-autores x) autor)) ; "Michael_Swan"
                ))
(define (buscar-ISBN codisbn)
  (buscar-libro listaDeLibros
                (lambda (x) (eq? (libro-ISBN x) codisbn)) ; 8684629314
                ))
(define (buscar-materia mat)
  (buscar-libro listaDeLibros
                (lambda (x) (eq? (libro-materias x) mat))
                ))
(libro-materias (first listaDeLibros))
(buscar-materia "Español")