#lang plai

;Funcion Abstracta EAV
(define-type EAV
  [num(n number?)]
  [sum (i EAV?)(d EAV?)]
  [prod(i EAV?)(d EAV?)]
  [var (nombre symbol?)]
  [Let (nombre symbol?)
    (por-sust EAV?)(donde-sust EAV?)])


;Parse
(define (parser exp)
  (cond
   [(number? exp)(num exp)]
   [(symbol? exp)(var exp)]
    [(list? exp)
     (case (car exp)
       [(+) (sum (parser (car(cdr exp)))(parser (caddr exp)))]
       [(*) (prod(parser (car(cdr exp))) (parser (caddr exp)))]
       [(let)(Let(car(car(cdr exp))))(parser(cdr(car(cdr exp))))(parser(cdr(cdr exp)))])]))



; funcion sustitucion
(define (sustitucion cuerpo variable exp)
  (type-case EAV cuerpo
    [num (n) cuerpo]
    [var (v)(if(symbol=? v variable)exp cuerpo)]
    [sum(i d)(sum(sustitucion i variable exp)
                 (sustitucion d variable exp))]
    [prod (i d)(prod(sustitucion i variable exp)
                    (sustitucion d variable exp))]
    [ Let (v por-sust donde-sust)
      (if (symbol=? v variable)
         (Let v (sustitucion por-sust variable exp)
           donde-sust)
         (Let v(sustitucion por-sust variable exp)
               (sustitucion donde-sust variable exp)))]
    ))


(prod (parser 'x)(parser 'x))
(parser 'x)
(parser 4)
(parser (* 5 5))
(parser (+ 8 8) )
(parser '(+(* 3 5)(+ 6 8)))
; (parser {let {x 3}{+ x x }})
;(parser(let ((parser 'r)(parser 4)) (parser (prod(parser 'r)(parser 'r )))))
