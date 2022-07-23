#lang eopl



(define every?
  (lambda (f l)
    (if (null? l)
        #t
        (if (f (car l))
            (every? (f (cdr l)))
            #f))))

