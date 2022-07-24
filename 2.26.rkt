#lang eopl

(define-datatype rb-tree-lst rb-tree-lst?
  (empty-tree)
  (non-empty-tree
   (rb-tree rb-tree?)
   (rb-tree-lst rb-tree-lst?)))
  

(define-datatype rb-tree rb-tree?
  (red-node
   (left rb-tree?)
   (right rb-tree?))
  (blue-node
   (rb-tree-lst rb-tree-lst?))
  (leaf-node
   (num integer?)))



(define build-tree-lst
  (lambda (lst v)
    (cases rb-tree-lst lst
      (empty-tree ()
                  (empty-tree))
      (non-empty-tree (rb-tree rb-tree-lst)
                      (non-empty-tree (build-tree rb-tree v)
                                      (build-tree-lst rb-tree-lst v))))))

(define build-tree
  (lambda (t v)
    (cases rb-tree t
      (leaf-node (num)
                 (leaf-node v))
      (red-node (left right)
                (red-node (build-tree left (+ v 1))
                          (build-tree right (+ v 1))))
      (blue-node (lst)
                 (blue-node (build-tree-lst lst v))))))
                                                                                    



(build-tree (red-node (blue-node (non-empty-tree (leaf-node 2) (non-empty-tree (leaf-node 1) (empty-tree)))) (leaf-node 1)) 0)





                