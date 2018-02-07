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
    [(list? exp)
     (case (car exp)
       [(+) (sum (parser (car(cdr exp)))(parser (caddr exp)))]
       [(*) (prod(parser (car(cdr exp))) (parser (caddr exp)))]
       [(Let)(Let(car(car(cdr exp))))(parser(cdr(car(cdr exp))))(parser(cdr(cdr exp)))])]))


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


(parser '(+(* 3 5)(+ 6 8)))