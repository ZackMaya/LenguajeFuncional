#lang plai

;funcion DefrdSust
(define-type DefrdSust
  [mtSust]
  [aSust (name symbol?)(value number?)(df DefrdSust?)])

;funcion busca-id
(define(busca-id ident rep)
  (type-case DefrdSust rep
    [mtSust "Error la variable no está definida"]
    [aSust(nom valor resto)
          (if(symbol=? nom ident)
             valor
             (busca-id ident resto))]))

;funcion Interprete
(define (interp exp list-fun rep)
  (type-case EAVF1 exp
    [num (n)n]
    [sum(id)(+(interp i list-fun rep)(interp d list-fun rep))]
    [prod(i d)(*(interp i list-fun rep)(interp d list-fun rep))]
    [let(var por-sust donde-sust)
      (interp donde-sust list-fun(aSust var(interp por-sust list-fun rep)rep))]
    [id(v)(busca-id v rep)]
    [app (nombre-funarg-actual)(local([define def-fun(busca-fun nombre-fun list-fun)])
         (interp def-fun-cuerpo list-fun(aSust def-fun-arg-formal(interp arg-act list-fun rep))))]))



         
