#lang eopl


(define num->tree
  (lambda (num)
    (list num '() '())))

(define curr
  (lambda (tree)
    (car tree)))

(define lson
  (lambda (tree)
    (cadr tree)))

(define rson
  (lambda (tree)
    (caddr tree)))

(define leaf?
  (lambda (tree)
    (and (null? (lson tree))
         (null? (rson tree)))))

(define insert-right
  (lambda (val tree)
    (list
     (curr tree)
     (lson tree)
     (list val '() (rson tree)))))

(define insert-left
  (lambda (val tree)
    (list
     (curr tree)
     (list val (lson tree) '())
     (rson tree))))

(define t1 (insert-right 14
                         (insert-left 12
                                      (num->tree 13))))

