#lang eopl

(define product-n
  (lambda (v l2)
    (if (null? l2)
        '()
        (cons (list v (car l2)) (product-n v (cdr l2))))))

(define extend
  (lambda (l1 l2)
    (if (null? l1)
        l2
        (cons (car l1) (extend (cdr l1) l2)))))



(define product
  (lambda (l1 l2)
    (if (null? l1)
        '()
        (extend (product-n (car l1) l2) (product (cdr l1) l2)))))