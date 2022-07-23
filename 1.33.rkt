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

(define mark-leaves-with-red-depth-from
  (lambda (bintree v)
    (if (leaf? bintree)
        (leaf v)
        (if (equal? (contents-of bintree) 'red)
            (interior-node (contents-of bintree) (mark-leaves-with-red-depth-from (lson bintree) (+ v 1))
                           (mark-leaves-with-red-depth-from (rson bintree) (+ v 1)))
            (interior-node (contents-of bintree) (mark-leaves-with-red-depth-from (lson bintree) v)
                           (mark-leaves-with-red-depth-from (rson bintree) v))))))


(define mark-leaves-with-red-depth
  (lambda (bintree)
    (mark-leaves-with-red-depth-from bintree 0)))


(mark-leaves-with-red-depth
   (interior-node 'red
                  (interior-node 'bar
                                 (leaf 26)
                                 (leaf 12))
                  (interior-node 'red
                                 (leaf 11)
                                 (interior-node 'quux
                                                (leaf 117)
                                                (leaf 14)))))



