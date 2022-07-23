#lang eopl

(define list-of
  (lambda (pred)
    (lambda (val)
    (or (null? val)
        (and (pair? val)
             (pred (car val))
             ((list-of pred)(cdr val)))))))
