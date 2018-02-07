#lang racket


;(define L '( 1 2 3 4 5 6))
(define (longitud L)
  (if (null? L) 0
      (+ 1 (longitud (cdr L)))
  ))

;(construye_lista_n(5))-> '(5 4 3 2 1))

(define (construye_lista_n n)
  (if (zero? n)
      '()
      (cons n (construye_lista_n (- n 1)))))


(cons 1 2)
  (define p (cons 1 2))
  '(1 2 3 4)
  (cons 1 '(2 3 4))

(pair? p);--------->#t
(pair? 3);--------->#f
(pair? '(1 2 3 4));--->#t
(pair? (cons 1 '(2 3 4))); ------>#t




;(empareja '(1 2 3) '(#\a #\b #\c))
;   '((1 , #\a) (2 , #\a) (3 , #\c))

(define (empareja l1 l2)
  (if (or (null? l1) (null? l2))
      '()
      (cons (cons (car l1) (car l2))
      (empareja (cdr l1) (cdr l2)))))

(empareja '(1 2 3) '(#\a #\b #\c))


;18/02/2016

(define (cuadrado x)
  (* x x))

(define cuadrado2 (lambda (x) (* x x)))



(define suma (lambda (x y) (+ x y)))
(define pareja (cons 1 2))
(define lista (list 1 2 3 4))


(lambda (x) (* 2 x))
(lambda (y) (+ 3 y) 6)

(+ 3 6)


;Funciones como argumentos

(define (mi-map f l)
  (if (null? l)
      '()
      (cons (f (car l)) (mi-map f(cdr l)))))


;(mi-map cuadrado '(1 2 3 4))
;(mi-map (lambda (x) (+ 2 x)) '(1 2 3 4))
;(mi-map (lambda (x) (* x x x)) '(1 2 3 4))

(define x 1)
(define y 2)
(define punto1 (cons x y))

(define mist (lambda (x) (+ x 5)))
(define g (lambda (x) x))
(g 5)
((g mist) 3);----------------------------->una función que al ser invocada por una funcion devuelve una funcion
(((lambda (x) x) mist) 3)