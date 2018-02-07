#lang racket

;Condicional IF

(define PI 3.1416)
(define (area-circunferencia r)
  (* PI r r))
(define (area-anillo radio1 radio2)
  (if (and (>= radio1 0)(>= radio2 0))
      (abs (- (area-circunferencia radio1) (area-circunferencia radio2)))
            (- 1)))


;Condicional Múltiple

;signo-número: número--->símbolo
;signo-número: determina si n es positivo, negativo o cero

;(define (signo-numero n))

;(define (signo-numero n)
;    (if (> n 0)
;        ('positivo)
;        (if (< n 0)
;            ('negativo)
;            (if (= n 0)
;                ('cero)
;                ('error)))))



(define (signo-numero n)
  (cond
    ((> n 0) 'positivo)
    ((< n 0) 'negativo)
    ((= n 0) 'cero)
    (else "no es numero real")))


;sumaN: número--->número
;sumaN: Dado n devuelve la suma desde 1 hasta n

(define (sumaN n)
  (if (= n 1)
      (1)
      (+ n (sumaN (- n 1)))
      )
  )
    