#lang racket
(define var-exp
  (lambda (var)
    `(var-exp, var)))

(define lambda-exp
  (lambda (var exp)
    `(lambda ,var ,exp)))

(define app-exp
  (lambda (exp1 exp2)
    `(app-exp ,exp1 ,exp2)))


(define var-exp?
  (lambda (exp)
    (if (equal? (car exp) 'var-exp)
        #t
        #f)))


(define lambda-exp?
  (lambda (exp)
    (if (equal? (car exp) 'lambda)
        #t
        #f)))

(define app-exp?
  (lambda (exp)
    (if (equal? (car exp) 'app-exp)
        #t
        #f)))

(define var-exp->var
  (lambda (exp)
    (cadr exp)))

(define lambda-exp->bound-var
  (lambda (exp)
    (cadr exp)))

(define lambda-exp->body
  (lambda (exp)
    (caddr exp)))


(define app-exp->rator
  (lambda (exp)
    (car exp)))

(define app-exp->rand
  (lambda (exp)
    (cadr exp)))


(define occurs-free?
  (lambda (search-var exp)
    (cond
      [(var-exp? exp) (equal? search-var (var-exp->var exp))]
      [(lambda-exp? exp)
       (and (not (equal? search-var (lambda-exp->bound-var exp)))
            (occurs-free? search-var (lambda-exp->body exp)))]
      [(app-exp? exp)
       (or (occurs-free? search-var (app-exp->rator exp))
           (occurs-free? search-var (app-exp->rand exp)))]
      )))








