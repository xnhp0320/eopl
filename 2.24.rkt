#lang eopl



(define-datatype bintree bintree?
  (leaf-node
   (num integer?))
  (interior-node
   (key symbol?)
   (left bintree?)
   (right bintree?)))


(define bintree-to-list
  (lambda (tree)
    (cases bintree tree
      (leaf-node (num)
                 (list 'leaf-node num))
      (interior-node (key left right)
                     (list 'interior-node key
                           (bintree-to-list left)
                           (bintree-to-list right))))))




(bintree-to-list (interior-node 'a (leaf-node 1) (leaf-node 2)))