#lang eopl

(define swap
  (lambda (a b x)
    (cond
      [(equal? x a) b]
      [(equal? x b) a]
      [else x])))
    

(define swapper
  (lambda (a b l)
    (if (equal? l '())
        '()
        (cons (swap a b (car l)) (swapper a b (cdr l))))))