#lang eopl


(define list-index-from
  (lambda (init f l)
    (if (null? l)
        #f
        (if (f (car l))
            init
            (list-index-from (+ init 1) f (cdr l))))))

(define list-index
  (lambda (f l)
    (list-index-from 0 f l)))