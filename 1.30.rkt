#lang eopl

(define filter-pred
  (lambda (pred l v init)
    (if (null? l)
        init
        (if (pred (car l) v)
            (filter-pred pred (cdr l) v (cons (car l) init))
            (filter-pred pred (cdr l) v init)))))

(define filter-pred-not
  (lambda (pred l v init)
    (if (null? l)
        init
        (if (not (pred (car l) v))
            (filter-pred-not pred (cdr l) v (cons (car l) init))
            (filter-pred-not pred (cdr l) v init)))))

(define merge
  (lambda (l1 l2)
    (if (null? l1)
        l2
        (cons (car l1) (merge (cdr l1) l2)))))


(define sort-from
  (lambda (pred v l)
    (if (null? l)
        (cons v '())
        (merge (merge (sort/pred pred (filter-pred pred l v '())) (cons v '()))
               (sort/pred pred (filter-pred-not pred l v '()))))))


(define sort/pred
  (lambda (pred l)
    (if (null? l)
        '()
        (sort-from pred (car l) (cdr l)))))


