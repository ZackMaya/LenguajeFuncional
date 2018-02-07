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


(define (cuadrado x)
  (* x x))

(define cuadrado2 (lambda (x) (* x x)))



(define suma (lambda (x y) (+ x y)))
(define pareja (cons 1 2))
(define lista (list 1 2 3 4))