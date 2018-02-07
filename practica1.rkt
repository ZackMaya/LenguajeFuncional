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
(define a 0)
(define b 10)

;funcion saber si un numero n esta en el intervalo
(define intervalo (lambda (b a inc)
   (cond (> b a)
    (error "No esta en el intervalo")
   (cons b
   (intervalo (+ b inc) a inc)))))



;3.-Escribe una funcion que dados dos numeros enteros determine cuantos numeros enteros hay entre
;ellos, incluyendolos.
(define c 5)
(define d 0)

(define (numerosEnterosEntreNumeros c d)
  (if (> c d)
      (+ 1(- c d))
      (if (> d c)
          (+ 1(- d c))
      ('error))))



;4.- Define la funcion de ackerman en racket, definida de la siguiente manera:
;qackerman(m,n)={n+1 si m=0, ackerman(m-1,1) si m>0 y n=0, ackerman(m-1,ackerman(m,n-1) si m>0 y n>0

(define (ackermann m n)
  (cond [(zero? m) (+ n 1)]      ;------->m=0
        [(zero? n) (ackermann (- m 1) 1)]       ;------>m>0 y n=0
        [else (ackermann (- m 1) (ackermann m (- n 1)))]))     ;------->m>0 y n>0



;5.-Define una funcion que dado un número entero positivo determine si es un numero perfecto(un numero es
;perfecto cuando la suma de los divisores menores a el da como resultado el mismo numero)


;sumaN: Dado n devuelve la suma desde 1 hasta n

(define (sumaN n)
  (if (= n 1)
      (1)
      (+ n (sumaN (- n 1)))
      )
  )

(define (numeroPerfecto n)
  (if (= (sumaN n) n)
      ("es un numero perfecto")
      ("no es perfecto")))