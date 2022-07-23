#lang eopl

(define filter-in-from
  (lambda (init f l)
    (if (null? l)
        init
        (if (f (car l))
            (filter-in-from (cons (car l) init) f (cdr l))
            (filter-in-from init f (cdr l))))))




(define filter-in
  (lambda (f l)
    (filter-in-from '() f l)))
