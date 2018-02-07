#lang racket


;(begin
;  (display "Hello Word")
;  (newline)  ;Salto de línea
;  )



;Tipos de datos simple

;Booleanos
#t ; verdadero
#f ;falso

;Operadores
; >,<,=,equal?,or,and,not

(< 3.5 4)
(> 4 7)
(= 3 3.0)
(equal? 3 3.0)
(or (> 4 7) (< 3.5 4))
(and (> 4 7) (< 3.5 4))
(not (< 3.5 4))

;caso de booleanos
(boolean? #t)   ; Es un predicado que determina si el parametro es un booleano
(boolean? 3)

;Números
; Reales ejem. 3.0
; Racionales ejem. 1/2
; Enteros 4
; Complejos (2+3i)

; Existen predicados para determinar el tipo de número
; numbre?, es el predicado general para todos los números

(number? 8)
(number? 1/2)
(number? (3+4i))

;real? determina si un número es real
(real? 3.4)
(real? 3/4)
(real? 3)

;integer? determina si un número es entero
(integer? 5)
(integer? 9.0)

;rational? determina si un número es de la forma p/q
(rational? 1/2)
(rational? 0.5)

;complejo? determina si un número es de la forma a+bi, es un complejo
(complex? 3+4i)

;<= determina que los números esten en orden
(<= 2 3 4 5 6 5 7) ;---> #f
(<= 2 3 4 5 6 7)   ;---> #t
(max 13 4 6 78 3)  ;---> 78
(min 13 4 6 78 3)  ;---> 3
(/ 15 8)           ;---> 1 7/8
(quotient 22 4)    ;---> 5, devuelve parte entera de la división
(remainder 22 4)   ;---> 2, devuelve el residuo de la división
(equal? 1/2 0.5)   ;---> #f, verifica que sean el mismo número (misma representación)
(= 1/2 0.5)        ;---> #t, tienen el mismo valor
(equal? 0.5 (/ 1 2)) ;-> #f
(abs (-4))         ;---> 4, devuelve el valor absoluto
(positive? (- 3))  ;---> #f
(negative? (- 4))  ;---> #t
(zero? 9)          ;---> #f, un número es 0
(infinite? 2.0)    ;---> #f, un número infinito
(even? 3)          ;---> #f, determina si un número es par
(odd? 3)           ;---> #t, determina si un número es impar

; Carácteres
; Soporta carácteres internacionales y se codifíca en UTF-8
#\a
#\A
#\space
#\ñ
#\á
#\newline
#\tab

;char?, determina si algo es un caracter
(char? #\a)
; Con el predicado anterior hay una familia de predicados asociados
; char>?, char<?, char=?,char <=?, char >=?, que comparar dos caracteres de acuerdo a su código
(char>? #\A #\a)
; También hay una familia de rpedicados para determinar que familia de predicados son:
; char-numeric?, char-alphabetic?, char-lower-case?, char-upper-case?, char-whitespace?
(char-ci=? #\a #\A)     ;-----> #t, no difiere de entre mayúsculas y minusculas
; char-ci>?, char-ci<?
(char-upcase #\a)       ;-----> #\A, convierte un caracter a mayúscula
(char->integer #\a)     ;-----> 97, devuelve su código ASCII


; Cadenas
; Las cadenas son representados entre comillas(""), "hola mundo"
(string #\h #\o #\l #\a)    ;----> "hola"
(string? "hola")            ;----> #t
(make-string 5 #\p)         ;----> "ppppp", devuelve copias de lo que le estoy pasando
(substring "hola mundo cruel" 3 7) ;--> "a mu", devuelve los elementos desde 3 hasta una antes del 7,
;el conteo tiene la posición número 6
(string-ref "hola mundo" 3) ;----> #\a
(string->list "hola")       ;----> ' (#\h #\o #\l #\a), covierte la cadena en una lista de caracteres
(string-length "hola")      ;----> 4, devuelve el número de carácteres de la cadena
(string-append "hola" " " "mundo" " " "cruel")   ;----> Concatena, "hola mundo cruel"
;predicados asociados con string?: string>?, string<?, string=?, string>=?, string<=?
(string>? "hola" "mundo")   ;----> #f
(string-ci=? "hola" "HOLA") ;----> #t
; Predicados de comparación que son insensibles a mayúsculas y minúsculas
;  string-ci?: string-ci>?, string-ci<?, string-ci=?, string-ci>=?, string-ci<=?
(integer->char 97)          ;----> #\a, convierte el entero a un código de caracter ASCII



(list 1 2 3 4 5)




