#lang eopl

        
(define g-from
  (lambda (l1 l2 v)
    (if (null? l2)
        (list (list v (cadr l1)))
        (cons (list v (cadr l1)) (g-from (car l2) (cdr l2) (+ v 1))))))



(define g
  (lambda (l1 l2)
    (g-from l1 l2 0)))


(define number-elements
    (lambda (lst)
      (if (null? lst) '()
          (g (list 0 (car lst)) (number-elements (cdr lst))))))


(number-elements '(a b c d e f))