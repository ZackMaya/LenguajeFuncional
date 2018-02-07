#lang plai

;Funcion Abstracta F1WAE
(define-type F1WAE
  [num(n number?)]
  [sum (i F1WAE?)(d F1WAE?)]
  [prod(i F1WAE?)(d F1WAE?)]
  [var (nombre symbol?)]
  [Let (nombre symbol?)
    (por-sust F1WAE?)(donde-sust F1WAE?)])


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

