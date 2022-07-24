#lang eopl


(define-datatype bintree bintree?
  (leaf-node
   (num integer?))
  (interior-node
   (key symbol?)
   (left bintree?)
   (right bintree?)))


(define sum-leaf
  (lambda (t)
    (cases bintree t
      (leaf-node (num)
                 num)
      (interior-node (key left right)
                     (+ (sum-leaf left) (sum-leaf right))))))



(define max-interior-aux
  (lambda (t)
    (cases bintree t
      (leaf-node (num)
                 (list -inf.0 '()))
      (interior-node (key left right)
                     (let* ([left-tuple (max-interior-aux left)]
                            [right-tuple (max-interior-aux right)]
                            [left-sym (cadr left-tuple)]
                            [left-max (car left-tuple)]
                            [right-sym (cadr right-tuple)]
                            [right-max (car right-tuple)]
                            [this-sum (sum-leaf t)])
                       
                       (if (< this-sum left-max)
                           (if (< left-max right-max)
                               (list right-max right-sym)
                               (list left-max left-sym)
                               )
                           (if (< this-sum right-max)
                               (list right-max right-sym)
                               (list this-sum key))))))))



(define tree-1
  (interior-node 'foo (leaf-node 2) (leaf-node 3)))

(define tree-2
  (interior-node 'baz (leaf-node -1) tree-1))


                         
                         