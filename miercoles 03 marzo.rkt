#lang plai

(define-type lista
  [vacia]                                ;------->Constructor de tipo mi-lista, "vacia","
  [mi-cons (cabeza integer?)
           (cola lista?)])

(define ejemplo (mi-cons 1 (mi-cons 2 (mi-cons 3 (vacia)))))

 ejemplo
(lista? ejemplo)

(vacia? ejemplo)
(vacia? (vacia))

(mi-cons? ejemplo)
(mi-cons? (vacia))

(mi-cons-cabeza ejemplo)
(mi-cons-cola ejemplo)


(set-mi-cons-cabeza! ejemplo 5)
(set-mi-cons-cola! ejemplo (vacia))




;TDA
; define-type------------>Se utliza para definir nuevos TDA
; type-case-------------->es otro procedimiento asociado a define type que permite manipular los objetos de un TDA de forma
; más amigable


;define una lista con incremento
(define incrementa (lambda (l)
                     (if (vacia? l)
                         (vacia)
                         (mi-cons (+ (mi-cons-cabeza l) 1)
                                  (incrementa (mi-cons-cola l))))))

;Define una lista con incremento a cada elemento
(define incremental (lambda (l)
                      (type-case lista l
                        [vacia () (vacia)]
                        [mi-cons (cabeza cola) (mi-cons(+ (mi-cons-cabeza l) 1)
                                                       (incremental (mi-cons-cola l)))])))
;define un arbol binario
(define-type arbolBinario
  [vacio]
  [hoja (elemento integer?)]
        [arbol (nodo integer?)(arbolizq arbolBinario?)
               (arbolder arbolBinario?)])



;Incremento de un elemento en el arbol binario
(define ejem-arbol
  (arbol 1(arbol 2(hoja 4)(hoja 5))
         (arbol 3 (hoja 6)(hoja 7))))

(define incrementa-arbol (lambda (t)
                           (type-case arbolBinario t
                             [vacio () vacio]
                             [hoja (elemento) (hoja (+ elemento 1))]
                             [arbol (nodo arbolizq arbolder)(arbol(+ 1 nodo)
                                                                  (incrementa-arbol arbolizq)
                                                                  (incrementa-arbol arbolder))])))