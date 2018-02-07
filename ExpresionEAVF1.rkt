#lang plai


(define-type EAVF1
  [num(n number?)]
  [sum(i EAVF1?)(d EAVF1?)]
  [prod(i EAVF1?)(d EAVF1?)]
  [let(nombre symbol?)(por-sust EAVF1?)
    (donde-sust EAVF1?)]
  [id(nombre symbol?)]
  [app(nombre symbol?)(arg actual EAVF1?)])




;Sintaxis Abstracta de EAVF1
(define-type def-fun
  [def-fun (number symbol?)
    (arg-formal symbol?)
    (cuerpo EAVF1?)])


