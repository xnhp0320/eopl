#lang eopl

(define extend
  (lambda (l1 l2)
    (if (null? l1)
        l2
        (cons (car l1) (extend (cdr l1) l2)))))

(define flatten
  (lambda (l)
    (if (null? l)
        l
        (if (list? (car l))
            (extend (flatten (car l)) (flatten (cdr l)))
            (cons (car l) (flatten (cdr l)))))))


  