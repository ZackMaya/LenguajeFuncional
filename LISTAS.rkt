#lang racket

;Definición de una variable
(define mi_variable 6)

;Definición de una función
(define (cuadrado x) (* x x))

;Invocación a una función
(cuadrado mi_variable)


;Definición de la función que calcula el perimetro de una circunferencia

;Definición de PI como constante
(define PI 3.1416)

(define (perimetroCircunferencia radio)
  (* 2 PI radio))

(define (areaCirculo radio)
  (* PI(cuadrado radio)))


;Definir la función que calcula la distancia entre dos puntos

;Función distancia
(define (distancia1 x1 y1 x2 y2)
  (sqrt(+ (cuadrado (- x1 x2)) (cuadrado (- y1 y2)))))

;Función distancia con car y cdr
(define (distancia2 p1 p2)
  (sqrt(+ (cuadrado (- (car p1) (car p2))
          (cuadrado (- (cdr p1) (cdr p2)))))))

(define p1 (cons 5 0))
(define p2 (cons 6 0))
;(distancia2 punto1 (cons 6 7))

;Se define una función que contiene una lista donde contiene 3
;elementos "Cada primero es la cabeza y el resto la cola de la lista
(define l2 '(1 (10 2)(100 3 4(5 6))))

;Para sacar el elemento 10, es (car(car(cdr l2)))
;LA simplifacion anterior seria (caadr 12)
;(car(car(cdr l2))) -----> 10
;(car (cdr (car (cdr l2)))) -----> 2 
;(caadr (cdr l2))  ---> 100
;(car(cadddr(caddr l2)))  ----> 5
;(car(cdr(cadddr(caddr l2)))) ----> 6
;


(define l1 '(cons(1 (cons 2( cons 3(cons 4(cons 5 '())))))))

;Factorial recursivo

(define (factorial n)
  (if (= n 0)
      1
      (* (factorial (- n 1)) n))
  )

;Suma hasta n que dado un entero n, devuelva la suma i=1 hasta i

(define (suma-hasta-n n)
  (if (= n 0)
      1
      (+ (suma-hasta-n (- n 1)) n)
      )
 )

;Función de longitud que dada una lista devuelve el número de elementos
(define l '( 1 2 3 4 5 6))

(define (longitud l)
  (if (null? l) 0
      (+ 1 (longitud (cdr l)))
  ))
