#lang eopl


(define exist?
  (lambda (f l)
    (if (null? l)
        #f
        (if (f (car l))
            #t
            (exist? f (cdr l))))))
