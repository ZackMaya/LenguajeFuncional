#lang racket
(define (derivar l)
    (if (null? l)
        '()
        (cons (*(- (length l)1)
                 (car l))(derivar (cdr l))
        )))

(define (suma l1 l2)
      (if (null? (and  l1 l2))
           '()
       (cond
        ((=(- (length l1)1)(-(length l2)1))
       (cons(+(car l1)(car l2))(suma (cdr l1)(cdr l2))))
       
       ((>(- (length l1)1)(-(length l2)1))
          (cons (car l1)(suma (cdr l1) l2))) 
       ((>(- (length l2)1)(-(length l1)1))
          (cons (car l2)(suma (cdr l2) l1)))
       )))

(define (quitar-cero l)
   (if (null? l)
       '()
       (if (zero? (car l))
           (quitar-cero(cdr l))
           (cons(car l)(quitar-cero(cdr l))))))
  
  

(define (evaluar l x)
  (if (null? l)
      0
      (+(*(car l)(expt x (- (length l) 1)))
                      (evaluar (cdr l)x))))

(define (deriva-suma l1 l2 x)
  (if (null? (and  l1 l2))
      0
      (evaluar(suma(quitar-cero(derivar l1))
                   (quitar-cero(derivar l2)))x)))

(derivar '(1 2 3 4))
(quitar-cero '(3 4 3 0))


(deriva-suma '(4 3 2 1 0) '(2 2 2 2) 3)