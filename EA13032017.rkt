#lang plai

;Firts----Primer Elemento
;Second---Segundo Elemento
;Third----Tercer Elemento


;Función para definir una Expresión Aritmética
(define-type AE
  [num(n number?)]
  [add(i AE?)(d AE?)]
  [sub(i AE?)(d AE?)]
  [prod(i AE?)(d AE?)]
  [div(i AE?)(d AE?)]
  )

;Convierte una expresión que corresponde a la sintáxis concreta de una expresión
;aritmética y devuelve una AE (representación en sintáxis abstracta)



;Funcion parse
(define (parser exp)
  (cond
   [(number? exp)(num exp)]
    [(list? exp)
     (case (first exp)
       ;puedo usar car o firts 
       [(+) (add (parser (second exp))(parser (third exp)))]
       [(-) (sub (parser (second exp))(parser (third exp)))]
       [(*) (prod (parser (second exp))(parser (third exp)))]
       [(/) (div (parser (second exp))(parser (third exp)))]
    )])
 )


(parser '(+(* 3 5)(+ 6 8)))
(parser '(+ 3 4))
;(parser (read))
