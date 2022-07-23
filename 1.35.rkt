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


(define num-begin
  (lambda (bintree v)
    (if (leaf? bintree)
        (+ v 1)
        (num-begin (rson bintree) (num-begin (lson bintree) v)))))

(define num-leaf-from
  (lambda (bintree v)
    (if (leaf? bintree)
        (leaf v)
        (interior-node (contents-of bintree)
                       (num-leaf-from (lson bintree) v)
                       (num-leaf-from (rson bintree) (num-begin (lson bintree) v))))))


(define num-leaf
  (lambda (bintree)
    (num-leaf-from bintree 0)))



(num-leaf
    (interior-node 'foo
      (interior-node 'bar
        (leaf 26)
        (leaf 12))
      (interior-node 'baz
        (leaf 11)
        (interior-node 'quux
          (leaf 117)
          (leaf 14)))))


