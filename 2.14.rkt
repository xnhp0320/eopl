#lang eopl

(define empty-env
  (lambda ()
    (list
     (lambda (search-var)
       (eopl:error "No bindig for ~s" search-var))
     (lambda ()
       #t)
     (lambda (var)
       #f))))


(define apply-search
  (lambda (env search-var)
          ((car env) search-var)))

(define apply-empty?
  (lambda (env)
    ((cadr env))))

(define apply-has-binding?
  (lambda (env var)
    ((caddr env) var)))

(define extend-env
  (lambda (var val env)
    (list
     (lambda (search-var)
       (if (equal? search-var var)
           val
           (apply-search env var)))
     (lambda ()
       #f)
     (lambda (search-var)
       (if (equal? search-var var)
           #t
           (apply-has-binding? env var)))
     )))

(apply-has-binding? (extend-env 'a 1 (empty-env)) 'a)
