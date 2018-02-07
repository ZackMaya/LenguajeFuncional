#lang racket
(define (sumaDivisores n)
      (sumaL(obtenerDivisor n (- n 1) )))


(define(sumaL  l)
      (if(null? l)
         0
          (+ (car l) (sumaL l))))

(define (obtenerDivisor n i)
    (if (= i 1)
        '(1)
        (if(= (remainder n  i ) 0)
             
        (cons i (obtenerDivisor n (- i 1)))
           (obtenerDivisor n (- i 1)))))
  

(obtenerDivisor 8 7)
(sumaDivisores 8)