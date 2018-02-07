#lang racket

;1.- Define una función que calcule la distancia entre dos puntos del plano cartesiano
;La formaula es distancia es igual a raíz cuadrada de... (x2-x1) al cuadrado más (y2-y1) al cuadrado.
;se tiene que definir cuatro puntos x,x2,y,y2.
;se tiene que definir una funcion que calcule el cuadrado de un numero.
;para sacar la raiz cuadrada se utiliza sqrt


;valores de los puntos
(define x 3)
(define y 2)
(define x2 1)
(define y2 5)

;funcion para sacar el cuadrado de un numero
(define (cuadrado x)
   (* x x))
cuadrado
;funcion calcular distancia
(define distancia(sqrt(+ (cuadrado (- x2 x)) (cuadrado (- y2 y)))))



;2.- Definir una funcion que dados los puntos de un intervalo en la recta y un numero cualquiera n, determine si n esta en el intervalo, a la derecha o a la izquierda. Utiliza la expresion cond.
;se tienen dos puntos y saber si esta en el intervalo i

;puntos del intervalo de 0-10
(define punto1 0)
(define punto2 10)

;funcion saber si un numero n esta en el intervalo
(define intervalo(n)
  (cond ((null? n))))






