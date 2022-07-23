#lang eopl

(define duple
  (lambda (n v)
    (if (equal? n 1)
        (cons v '())
        (cons v (duple (- n 1) v)))))

