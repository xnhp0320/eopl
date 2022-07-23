#lang eopl

(define wrap
  (lambda (a)
    (cons a '())))



(define down
  (lambda (l)
    (if (equal? l '())
        '()
        (cons (wrap (car l)) (down (cdr l))))))