#lang eopl



(define-datatype prefix-exp prefix-exp?
  (const-exp
   (num integer?))
  (diff-exp
   (op1 prefix-exp?)
   (op2 prefix-exp?)))

; prefix-list = (prefix-exp)
; prefix-exp = Int | - prefix-exp prefix-exp

(define parse-exp-list
  (lambda (lst)
    (cond
      [(eqv? (car lst) '-)
       (let* ([exp-list (parse-exp-list (cdr lst))]
              [exp (car exp-list)]
              [left (cadr exp-list)]
              [exp-list (parse-exp-list left)]
              [exp-right (car exp-list)]
              [left (cadr exp-list)])
       (list (diff-exp exp exp-right)
             left))]
      [else (list (const-exp (car lst))
                  (cdr lst))])))

(define parse
  (lambda (lst)
    (car (parse-exp-list lst))))


;(parse '(- - 3 2 - 4 - 12 7))


      
                 
    