#lang eopl


(define merge
  (lambda (l1 l2)
    (if (null? l1)
        l2
        (cons (car l1) (merge (cdr l1) l2)))))


