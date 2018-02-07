#lang plai

#|
Universidad Autónoma de la Ciudad de México
Ingeniería de Software
Lenguajes de Programación
Ernesto Z. Maya Díaz
Última Modificación 18/05/2017
|#

#|
F1WAE
-Expresiones aritmeticas
-Definición de variables (identificadores)
-Funciones de 1er orden con un sólo argumento
                 1er orden = ejemplo funciones en C, reciben valores definidos en el lenguaje y regresan valores
                             En este caso no son valores del lenguaje
                 2do orden = reciben funciones y/o devulven funciones, ejemplo "fold","map","filter"
                             
                 Primera clase = Las funciones son tomadas como valores primitivos
                             Se pueden pasar como variables
                             Se pueden pasar como parámetros y devolver como resultado de una función
                             Se pueden almacenar en estrucuras del lenguaje

Agregar  [pot(i F1WAE?)(d F1WAE?)]

|#

;Definicion de F1WAE
(define-type F1WAE
  [num(n number?)]
  [sum(i F1WAE?)(d F1WAE?)]
  [sub(i F1WAE?)(d F1WAE?)]
  [div(i F1WAE?)(d F1WAE?)]
  [prod(i F1WAE?)(d F1WAE?)]
  [pot(i F1WAE?)(d F1WAE?)]
  [with (nombre symbol?) (nombre-exp F1WAE?) (body F1WAE?)]
  [if0 (n F1WAE?) (cond-ok F1WAE?) (cond-fallo F1WAE?)]
  [Let(nombre symbol?)(por-sust F1WAE?)
    (donde-sust F1WAE?)]
  [id(nombre symbol?)]
  [app(nombre symbol?)(arg_actual F1WAE?)])



;Funcion Parser
(define (parser exp)
  (cond
   [(number? exp)(num exp)]
   [(symbol? exp)(id exp)]
    [(list? exp)
     (case (car exp)
       [(+) (sum (parser (car(cdr exp)))(parser (caddr exp)))]
       [(*) (prod(parser (car(cdr exp))) (parser (caddr exp)))]
       [(-) (sub(parser (car(cdr exp))) (parser (caddr exp)))]
       [(/) (div(parser (car(cdr exp))) (parser (caddr exp)))]
       [(Let)(Let (car (second exp)) (parser (second (second exp))) (parser (third exp)))]
       [(with) (with (first (second exp))
                      (parser (second (second exp)))
                      (parser (third exp)))]
       [else (app (first exp) (parser (second exp)))]
       )
   ]))

;Falta la función if0


;Test
(parser '(Let (x 3) ( + x 4 )))
;Test 2
(parser '(Let (x 2) ( + x 4 )))
;Test 3
(parser '(with ' 12 4))
;Test suma
(parser (+ 2 3))
;Test resta
(parser (- 5 6))
;Test multiplicación y división
(parser (* 3 4))
(parser (/ 6 9))

;FunDef
(define-type FunDef
  [fundef (fun-name symbol?)
          (arg-name symbol?)
          (body F1WAE?)])

;Funcion lookup-fundef
(define (lookup-fundef fun-nombre fundefs)
  (cond
    [(empty? fundefs) (error fun-nombre "function not found")]
    [else (if (symbol=? fun-nombre (fundef-fun-name (first fundefs)))
              (first fundefs)
              (lookup-fundef fun-nombre (rest fundefs)))]))


;Funcion Interprete
(define (interp exp fun-defs)
  (type-case F1WAE exp
    [num (n)n]
    [sum(i d)(+(interp i)(interp d))]
    [prod(i d)(*(interp i)(interp d))]
    [sub(i d)(-(interp i)(interp d))]
    [div(i d)(/(interp i)(interp d))]
    [pot(i d)(
    [with (bound-id nombre-exp bound-body)
          (interp (subst bound-body bound-id
                         (num (interp nombre-exp fun-defs))) fun-defs)]
    [if0 (cond-test exp-ok exp-fallo)
         (if (equal? (interp cond-test fun-defs) 0)
             (interp exp-ok fun-defs)
             (interp exp-fallo fun-defs))]
    [Let (v por-sust donde-sust)
      (interp(subst donde-sust v(num(interp por-sust))))]
    [id (v) (error "variable no definida")]
   [app (fun-name arg-expr)
        (local ([define the-fun-def (lookup-fundef fun-name fun-defs)])
          (interp (subst (fundef-body the-fun-def )
                         (fundef-arg-name the-fun-def )
                         (num (interp arg-expr fun-defs)))
                  fun-defs))]
    ))



;Funcion subst
(define (subst exp sub-id val)
  (type-case F1WAE exp
    [num (n) exp]
    [sum (i d) (sum (subst i sub-id val)
                    (subst d sub-id val))]
    [sub (i d) (sub (subst i sub-id val)
                    (subst d sub-id val))]
    [prod (i d) (prod (subst i sub-id val)
                    (subst d sub-id val))]
    [div (i d) (div (subst i sub-id val)
                    (subst d sub-id val))]
    [with (bound-id nombre-exp bound-body)
      (if (symbol=? bound-id sub-id)
          (with bound-id
                (subst nombre-exp sub-id val)
                bound-body)
          (with bound-id
                (subst nombre-exp sub-id val)
                (subst bound-body sub-id val)))]
    [Let(id por-sust donde-sust)
        (Let id (por-sust val exp)
             (donde-sust)
             (subst donde-sust val exp))]
    [if0 (cond-test exp-ok exp-fallo)
         (if0 (subst cond-test sub-id val)
              (subst exp-ok sub-id val)
              (subst exp-fallo sub-id val))]
    [id (v) (if (symbol=? v sub-id) val exp)]
    [app (fun-name arg-expr)
         (app fun-name (subst arg-expr sub-id val))]))


;Parse para una s-exp y un F1WAE

