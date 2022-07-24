#lang eopl


(define empty-env
  (lambda ()
    (list
     (lambda (search-var)
       (eopl:error "No bindig for ~s" search-var))
     (lambda ()
       #t))))

(define apply-search
  (lambda (env search-var)
          ((car env) search-var)))

(define apply-empty?
  (lambda (env)
    ((cadr env))))

(define extend-env
  (lambda (var val env)
    (list
     (lambda (search-var)
       (if (equal? search-var var)
           val
           (apply-search env var)))
     (lambda ()
       #f))))


