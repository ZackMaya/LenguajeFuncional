#lang plai


#|
En la app hace que las funcions sean tratadas como objetos de primera clase


 
|#

;Sintáxis abstracta
;Definicion de FWAE
(define-type FWAE
  [num(n number?)]
  [add(lhs FWAE?)(rhs FWAE?)]
  [sub(lhs FWAE?)(rhs FWAE?)]
  [div(lhs FWAE?)(rhs FWAE?)]
  [mult(lhs FWAE?)(rhs FWAE?)]
  [pot(lhs FWAE?)(rhs FWAE?)]
  [with (nombre symbol?) (nombre-exp FWAE?) (body FWAE?)] 
  [id(nombre symbol?)]
  [app(fun_exp FWAE?)(arg_exp FWAE?)]
  [fun (parametro symbol?)(body FWAE?)]
 )


;Interprete por sustitución
;Funcion subst
(define (subst exp var val)
  (type-case FWAE exp
    [num (n) exp]
    [add (i d) (add (subst i var val)
                    (subst d var val))]
    [sub (i d) (sub (subst i var val)
                    (subst d var val))]
    [mult (i d) (mult (subst i var val)
                    (subst d var val))]
    [div (i d) (div (subst i var val)
                    (subst d var val))]
    [with (bound-id nombre-exp bound-body)
      (if (symbol=? bound-id sub-id)
          (with bound-id
                (subst nombre-exp var val)
                bound-body)
          (with bound-id
                (subst nombre-exp var val)
                (subst bound-body var val)))]
    [id (v) (if (symbol=? v var) val exp)]
     [app (f arg) (app (subts f var val)
                       (subts arg var val))]
    [fun (func body)
               (if (symbol=? func var)
          exp
          (fun func (subts body var val)))]
    ))




