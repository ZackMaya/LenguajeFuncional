#lang plai

;Funcion parse
(define (parser exp)
  (cond
   [(number? exp)(num exp)]
    [(list? exp)
     (case (car exp)
       [(+) (sum (parser (car(cdr exp)))(parser (caddr exp)))]
       [(*) (prod(parser (car(cdr exp))) (parser (caddr exp)))]
       )]))

;Funcion Abstracta EA
(define-type EA
 [num(n number?)]
[sum(i EA?)(d EA?)]
[prod(i EA?)(d EA?)])


;funcion interprete
(define (interp asa)
 (type-case EA asa
   [num (n) asa]
   [sum (i d)(+ (interp i)(interp d))]
   [prod(i d)(*(interp i)(interp d))]))


;(sum(parser (* 3 5)) (parser(+ 6 8))
;(sum(prod(parser 3)(parser 5)) (sum(parser 6)(parser 8)))
;(sum(prod(num 3)(num 5))(sum(num 6)(num 8))))
(parser '(+(* 3 5)(+ 6 8)))


