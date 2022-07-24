#lang eopl



(define-datatype lc-exp lc-exp?
  (var-exp
   (sym symbol?))
  (app-exp
   (rator lc-exp?)
   (rand lc-exp?))
  (lambda-exp
   (bound-var symbol?)
   (body lc-exp?)))


(define parse-exp
  (lambda (exp)
    (cond
      [(symbol? exp) (var-exp exp)]
      [(pair? exp)
       (cond
         [(eqv? (car exp) 'lambda)
          (if (or (null? (cdr exp))
                  (null? (cddr exp)))
              (eopl:error "lambda exp needs bound var and exp")
              (if (not (symbol? (cadr exp)))
                  (eopl:error "bound var needs to be a symbol")
                  (lambda-exp (cadr exp)
                              (parse-exp (caddr exp)))))]
         [else
          (if (not (null? (cddr exp)))
              (eopl:error "app-exp only takes two exp")
              (app-exp (parse-exp (car exp))
                       (parse-exp (cadr exp))))])])))



(parse-exp '(lambda))
(parse-exp '(a b c))
                                  
         