#lang plai


(define (parser exp)
  (cond
   [(number? exp)(num exp)]
    [(list? exp)
     (case (car exp)
       [(+) (sum (parser (car(cdr exp)))(parser (caddr exp)))]
       [(*) (prod(parser (car(cdr exp))) (parser (caddr exp)))]
       )]))


;[(exp) (num (parser (car(cdr exp))(parser(caddr exp))))])


;(sum(parser (* 3 5)) (parser(+ 6 8))
  ;  (sum(prod(parser 3)(parser 5)) (sum(parser 6)(parser 8)))
 ;   (sum(prod(num 3)(num 5))(sum(num 6)(num 8))))


;(define-type EA
 ; [num(n number?)]
  ;[sum(i EA?)(d EA?)]
  ;[prod(i EA?)(d EA?)])



;(define (interp asa)
 ; (type-case EA asa
  ;  [num (n) asa]
   ; [sum (i d)(+ (interp i)(interp d))]
   ; [prod(i d)(*(interp i)(interp d))]))



;(parser '(+(* 3 5)(+ 6 8)))
;



;Funcion EAV
(define-type EAV
  [num(n number?)]
  [sum (i EAV?)(d EAV?)]
  [prod(i EAV?)(d EAV?)]
  [var (nombre symbol?)]
  [Let (nombre symbol?)
    (por-sust EAV?)(donde-sust EAV?)])


; funcion sustitucion
(define (sustitucion cuerpo variable exp)
  (type-case EAV cuerpo
    [num (n) cuerpo]
    [sum(i d)(sum(sustitucion variable exp)
                 (sustitucion variable exp))]
    [prod (i d)(prod(sustitucion i variable exp)
                    (sustitucion d variable exp))]
    [ Let (v por-sust donde-sust)
      (if (symbol=? v variable)
         (Let v (sustitucion por-sust variable exp)
           donde-sust)
         (Let v(sustitucion por-sust variable exp)
               (sustitucion donde-sust variable exp)))]
    [var (v)(if(symbol=? v variable)exp cuerpo)]))


;funcion Interprete
(define (interprete exp)
  (type-case EAV exp
    [num(n) n]
    [sum(i d)(+(interprete i)(interprete d))]
    [prod(i d)(*(interprete i)(interprete d))]
    [Let (v por-sust donde-sust)
      (interprete(sustitucion donde-sust v(num(interprete por-sust))))]
    [var(v)(error "Variable no definida")]))


