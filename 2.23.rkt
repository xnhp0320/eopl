#lang eopl



(define var?
  (lambda (v)
    (and (symbol? v)
         (not (equal? v 'lambda)))))



(define-datatype lc-exp lc-exp?
  (var-exp
   (var var?))
  (lambda-exp
   (bond-var var?)
   (body lc-exp?))
  (app-exp
   (rator lc-exp?)
   (rand lc-exp?)))



(lambda-exp 'a (var-exp 'a))
;(lambda-exp 'lambda (var-exp 'a))