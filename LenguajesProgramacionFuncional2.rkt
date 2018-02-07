#lang racket

;Definición de una variable
(define mi_variable 6)

;Definición de una función
(define (cuadrado x) (* x x))

;Definición cubo de un numero
(define (cubo x) (* x x x))

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
;(car l2) -------------------------------------------------> 1
;(car(car(cdr l2))) o (caadr) -----------------------------> 10
;(car (cdr (car (cdr l2)))) o (cadadr l2) -----------------> 2 
;(caadr (cdr l2))  ---> o (caaddr 100) -------------------->100
;(cadadr (cdr l2))   --------------------------------------> 3
;(car(cadddr(caddr l2)))  ---------------------------------> 5
;(car(cdr(cadddr(caddr l2)))) -----------------------------> 6



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
  (if (null? l)
      0
      (+ 1 (longitud (cdr l)))
  ))


;Dada una lista ys calcular la suma de sus elementos

(define ys '(2 4 5))

(define (suma-elementos ys)
  (if(null? ys) 0
     (+ (car ys)(suma-elementos(cdr ys)))))

;Cuadrado-lista, dada una lista de enteros devuleve una lista con los cuadrados de sus elementos

(define (cuadrado-lista ys)
  (if(null? ys) '()
     (cons (cuadrado (car ys))
           (cuadrado-lista (cdr ys))
           ))
  )

;Ejemplo cubo de lista
(define (cubo-lista ys)
  (if(null? ys) '()
     (cons (cubo (car ys))
           (cuadrado-lista (cdr ys))
           ))
  )


;Devuelve una lista donde aparece el primer elemento de la pareja tantas veces como indica el segundo
;elemento de la pareja
(define r (cons 1 5))


(define (lista-repetir r)
  (if(= 0 (cdr r))'()
     (cons (car r)(lista-repetir(cons(car r)(- (cdr r) 1))))))

;Filtra_Pares ys, dada una lista de enteros devuelve una lista unicamente con los
;elementos de ys que son pares
(define par '(1 2 3 4 5 6))


;(define (filtra-par par)
 ; (if(null? par)'()
  ;   (if(even? (car par)
   ;            (cons(car par) (filtra-par (cdr par)))
    ;           (filtra-par (cdr par)))
     ;   ))
  ;)


;Divisores, devuelve una lista con todos los divisores del numero x
;(divisores 10)---->'(1 2 5 10)
     
(define (divisor d contador)
  (if(= contador 1)
     (display (/ d contador))
     (begin
       (if(integer? (/ d contador))
          (begin
            (display(/ d contador))
            (divisor d (- contador 1))
            )
          (divisor d (- contador 1))
          ))))
(define (divisores x)
  (divisor x x))

;Funcion Que devuelve suma...
(define(suma-a-b a b)
(if(> a b)
0
(+ a (suma-a-b (+ a 1) b))))

;Funcion que devuelve el cuadrado...
(define(suma-cuadrado-a a b)
(if(> a b)
0
(+ (cuadrado a)(suma-cuadrado-a(+ a 1)b))))

;Funcion que devuelve el cubo...
(define(suma-cubo-a a b)
(if(> a b)
0
(+ (cubo a)(suma-cubo-a(+ a 1)b))))

;Función con lambda
(define suma-f-a-b (lambda (f a b)
                     (if(> a b)
                        0
                        (+ (f a)(suma-f-a-b f(+ a 1)b)))))

;Función con lambda 2
;(define (suma-f-a-b f)
;(lambda(a b)
;  (if(> a b)
 ;    0
 ;    (+ (f a)(suma-f-a-b f (+ a 1)b)))))

;Funcion suma
(define suma-cuadrado-a-b (lambda (a b)
                            (suma-f-a-b cuadrado a b)))
;Se prueba con (suma-cuadrado-a-b 0 2)

;Otra función similar
(define suma-cuadrado2(curry suma-f-a-b cuadrado))
;Se prueba con suma-cuadrado2---->regresa la función
;Internamente realiza lo siguientes
;Esto es la funcion (curry suma-f-a-b cuadrado)
;Internamente..      (lambda (a b)
;                     (if(> a b)
;                      0
;                    (+ (cuadrado a) suma-f-a-b (+ a 1)b)))

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


;22/02/2017

;Lambda
;(define cuadrado (lambda (x) (* x x)))
;Se ejecuta como (cuadrado UnNumero)....
;(define cubo (lambda (x) (* x x x)))
 

;01/03/2017
;Listas definidas

(define L1 '(1 2 3))
(define L2 '(4 5 6))

;Funcion concatena recibe dos listas y las concatena
(define (concatenar L1 L2)
  (if (null? L1)
      L2
      (cons (car L1)(concatenar (cdr L1) L2))))

;Función que recibe dos listas y devuelve las listas con los elementos al reves
(define (invierte L1 L2)
  (if (null? L1)
   L2
   (invierte (cdr L1) (cons (car L1) L2)
  )
))

;Funcion que recibe dos listas las concatena y suma 1 a la primera lista
(define (concatenar-uno L1 L2)
  (if (null? L1)
      L2
      (cons (incremente (car L1)) (concatenar-uno (cdr L1) L2))))

;Funcion que recibe dos listas las concatena con el cuadrado de la primera lista
(define (concatenar-dos L1 L2)
  (if (null? L1)
      L2
      (cons (cuadrado (car L1)) (concatenar-dos (cdr L1) L2))))


;Reversa de una lista sin concatenar TAREA
