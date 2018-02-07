#lang racket



(define (mi-map l f)
  (if (null? l)
      '()
      (cons (f(car l)) (mi-map (cdr l)f))))
(mi-map '(1 2) cuadrado)

