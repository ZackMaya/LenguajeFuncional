#lang plai

(define-type WAE
  [num(n number?)]
  [id(v symbol?)]
  [add(t1 WAE?)(t2 WAE?)]
  [div(t1 WAE?)(t2 WAE?)]
  [prod(t1 WAE?)(t2 WAE?)]
  [sub(t1 WAE?)(t2 WAE?)]
  [with(v symbol?)(t1 WAE?)(t2 WAE?)]
  )


(define(parse sexp)
  (cond
    [(number? sexp)(num sexp)]
    [(list? sexp)
     (case (car sexp)
       [(with)(car(second sexp))
              (parse(cdr(second sexp)))
              (parse(third sexp))]
       [(+)add(parse(second sexp))
           (parse(third sexp))]
       [(*)prod(parse(second sexp))
           (parse(third sexp))]
       [(/)div(parse(second sexp))
           (parse(third sexp))]
       [(-)sub(parse(second sexp))
           (parse(third sexp))]
       [else (id sexp)])]))


