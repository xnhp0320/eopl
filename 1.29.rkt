#lang eopl


(define filter-less
  (lambda (l v init)
    (if (null? l)
        init
        (if (< (car l) v)
            (filter-less (cdr l) v (cons (car l) init))
            (filter-less (cdr l) v init)))))


(define filter-large
  (lambda (l v init)
    (if (null? l)
        init
        (if (>= (car l) v)
            (filter-large (cdr l) v (cons (car l) init))
            (filter-large (cdr l) v init)))))


(define merge
  (lambda (l1 l2)
    (if (null? l1)
        l2
        (cons (car l1) (merge (cdr l1) l2)))))


(define sort-from
  (lambda (v l)
    (if (null? l)
        (cons v '())
        (merge (merge (sort (filter-less l v '())) (cons v '()))
               (sort (filter-large l v '()))))))



(define sort
  (lambda (l)
    (if (null? l)
        '()
        (sort-from (car l) (cdr l)))))
    
    