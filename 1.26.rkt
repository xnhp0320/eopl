#lang eopl

(define strip
  (lambda (l1 l2)
    (if (null? l1)
        l2
        (cons (car l1) (strip (cdr l1) l2)))))

(define up
  (lambda (l)
    (if (null? l)
        '()
        (if (list? (car l))
            (strip (car l) (up (cdr l)))
            (cons (car l) (up (cdr l)))))))



