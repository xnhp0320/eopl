#lang eopl


(define leaf
  (lambda (num)
    num))


(define interior-node
  (lambda (s left right)
    (append (list s) (list left right))))

(define leaf?
  (lambda (node)
    (integer? node)))

(define lson
  (lambda (p)
    (cadr p)))


(define rson
  (lambda (p)
    (caddr p)))


(define contents-of
  (lambda (p)
    (cond
      [(list? p) (car p)]
      [(integer? p) p]
      )))

(define double-tree
  (lambda (bintree)
    (if (leaf? bintree)
        (leaf (* 2 (contents-of bintree)))
        (interior-node (contents-of bintree) (double-tree (lson bintree))
                       (double-tree (rson bintree))))))







