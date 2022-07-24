#lang eopl


(define-datatype lc-exp lc-exp?
  (var-exp
   (sym symbol?))
  (lambda-exp
   (bound-vars (list-of symbol?))
   (body lc-exp?))
  (app-exp
   (rator lc-exp?)
   (rand  (list-of lc-exp?))))

(define parse-val-lst
  (lambda (lst)
    lst))

(define parse-exp-lst
  (lambda (lst)
    (if (null? lst)
        '()
        (cons (parse (car lst)) (parse-exp-lst (cdr lst))))))


(define parse
  (lambda (exp)
    (cond
      [(symbol? exp) (var-exp exp)]
      [(pair? exp)
       (cond
         [(eqv? (car exp) 'lambda)
          (lambda-exp (parse-val-lst (cadr exp)) (parse (caddr exp)))]
         [else (app-exp
                (parse (car exp)) (parse-exp-lst (cdr exp)))])])))



 (parse '(lambda (a b) (f (f a))))

 (parse '(lambda (a b) (f a)))

