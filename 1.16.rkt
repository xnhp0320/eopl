#lang eopl
(define invert-pair
  (lambda (p)
    (cons (cadr p) (cons (car p) '()))))
                

(define invert
  (lambda (l)
    (if (equal? l '())
        '()
    (cons (invert-pair (car l))
          (invert (cdr l))))))