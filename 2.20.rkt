#lang eopl

(define num->tree
  (lambda (num)
    (list (list num '() '()) (list num '() '()))))

(define curr
  (lambda (tree)
    (caar tree)))

(define lson
  (lambda (tree)
    (cadr (car tree))))

(define rson
  (lambda (tree)
    (cadr (car tree))))

(define parent-part
  (lambda (tree)
    (cadr tree)))

(define up-lst
  (lambda (tree)
    (cadr (parent-part tree))))

(define tree-part
  (lambda (tree)
    (car tree)))


(define insert-parent
  (lambda (tree val)
    (if (null? tree)
        '()
        (let* ([parent (parent-part tree)]
               [up-lst (up-lst parent)])
          (if (leaf? tree)
              (list (tree-part tree) (list (car parent) (cons val up-lst) '()))
              (list
               (list (curr tree)
                     (insert-parent (lson tree))
                     (insert-parent (rson tree)))
               (list (car parent) (cons val up-lst) '())))))))


(define leaf?
  (lambda (tree)
    (and (null? (lson tree))
         (null? (rson tree)))))

(define insert-right
  (lambda (val tree)
    (list
     (curr tree)
     (lson tree)
     (list
      (list
       val
       '()
       (insert-parent (rson tree) val)
       )
      (list
       val (cons (curr tree) (up-lst tree)) '())
     ))))


(define insert-left
  (lambda (val tree)
    (list
     (curr tree)
     (list
      (list val (insert-parent (lson tree) val) '())
      (list val (cons (curr tree) (up-lst tree)) '())
      )
     (rson tree))))

;(define t1 (insert-right 14
;                         (insert-left 12
;                                      (num->tree 13))))
