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

(define (distancia2 p1 p2)
  (sqrt(+ (cuadrado (- (car p1) (car p2))
          (cuadrado (- (cdr p1) (cdr p2)))))))

(define p1 (cons 5 0))
(define p2 (cons 6 0))
;(distancia2 punto1 (cons 6 7))