#lang racket
(define (ackemann m n)
     (cond
       ((zero? m) (+ n 1))
       
       ((and(> m 0)(zero? n)) (ackemann (- m 1) 1))
  
       ((and(> m 0)(> n 0)) (ackemann (- m 1) (ackemann m (- n 1))))))
           
       

(ackemann 2 0)
