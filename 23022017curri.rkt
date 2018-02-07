#lang racket
;Ejemplo currificación
(define suma (lambda (x y)(+ x y)))
;probamos con (suma 3 4), nos sale error si (suma 3)
;La currificación permite definir un sin fin de funciones a partir de una función
;previamente
;Ejemplo:
;Definir incremeta que dado y incremente su valor una unidad
(define incremente(curry suma 1))
;probar con >(incremente 5)
(define suma2(curry suma 1 2))
;probar con >suma2
(define suma3(curry suma 1 2 3))
;probar con >(suma3 2)

;probar con map;
;(map cuadrado '(1 2 3 4 5))
;(map incremente '(1 2 3 4 5))
;(map (lambda (x)(+ x 5)'(1 2 3 4 5)))
(map(curry suma 5)'(1 2 3 4 5))

;Define mi-map que se comporte igual que la función map definida en racket
(define mi-map(lambda (f xs)
  (if(null? xs)
     '()
     (cons (f (car xs))(mi-map f (cdr xs))))))

;(filter even? '(1 2 3 4 5))
;resulta con '(2 4)

;Recibe f:A--->Bool un predicado xs: Una lista de tipo A
;Devuelve una lista ys de tipo A que son los elementos de xs que cumplen con el
;predicado p

(define(mi-filter p xs)
  (if(null? xs)
     '()
     (if(p (car xs))
           (cons (car xs)(mi-filter p (cdr xs)))
           (mi-filter p(cdr xs)))))

;probar con (mi-filter even? '(1 2 3 4 5))

;función fold
;probar (foldr + 0 '(1 2 3 4 5))
;probar (foldr * 1 '(1 2 3 4 5))
;probar (foldr string-append "" '("be" "renje" "na"))

;tarea construir mi-foldr