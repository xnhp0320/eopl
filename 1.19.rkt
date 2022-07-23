#lang eopl
(define list-n
  (lambda (x n e)
    (if (equal? n 0)
        e
        x)))

(define list-set
  (lambda (l n e)
    (if (equal? l '())
        '()
        (cons (list-n (car l) n e) (list-set (cdr l) (- n 1) e)))))