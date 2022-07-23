#lang eopl




(define leaf
  (lambda (num)
    num))

(define leaf?
  (lambda (num)
    (integer? num)))

(define lson
  (lambda (bst)
    (cadr bst)))

(define rson
  (lambda (bst)
    (caddr bst)))

(define value
  (lambda (bst)
    (car bst)))



(define path
  (lambda (v bst)
    (cond
      [(= v (value bst)) '()]
      [(< v (value bst)) (cons 'left (path v (lson bst)))]
      [(> v (value bst)) (cons 'right (path v (rson bst)))]
      )))


 (path 17 '(14 (7 () (12 () ())) (26 (20 (17 () ())
                          ())
                      (31 () ()))))


    