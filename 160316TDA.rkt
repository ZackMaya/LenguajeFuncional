#lang plai

(define-type EA
  [num (n number?)]
    [sum(i EA?)(d EA?)]
       [prod(i EA?)(d EA?)])


#|(define (parse exp)
     (cond
       [(number? exp)
        (num exp)]
          [(list? exp)
             (case (car exp)
               [(+) (sum(parse(car(cdr exp)))
                    (parse(cdr(cdr exp))))]
                   [(*) (prod(parse(car(cdr exp)))
                    (parse(cdr(cdr exp))))]
               )]))|#


(define (interp asa)
  (type-case EA asa
    [num (n) asa]
      [sum(i d)(+ (interp i)(interp d))]
        [prod(i d)(+ (interp i)(interp d))]))



(define (parse exp)
     (cond
       [(number? exp)
        (num exp)]
          [(list? exp)
             (case (car exp)
               [(+) (sum(parse(cadr exp)))
                    (parse(caddr exp))]
               [(*) (prod(parse(cadr exp)))
                    (parse(caddr exp))]
               )]))


;(interp(parse'{+3 {*4 5 }))

parse(+ (* 4 5 )(+ 6 8))

;
parse '3

(interp(parse (+ (* 4 5)(+ 6 8))))

