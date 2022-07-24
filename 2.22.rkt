#lang eopl


; stack = empty-stack | Int stack

(define-datatype stack stack?
  (empty-stack)
  (non-empty-stack
   (value integer?)
   (stack stack?)))


(define push
  (lambda (s v)
    (cases stack s
      (empty-stack ()
                   (non-empty-stack v s))
      (non-empty-stack (v_ s_)
                       (non-empty-stack v (non-empty-stack v_ s_))))))

(define pop
  (lambda (s)
    (cases stack s
      (empty-stack ()
                   (eopl:error "stack is empty"))
      (non-empty-stack (v_ s_)
                       s_))))

(define top
  (lambda (s)
    (cases stack s
      (empty-stack ()
                   (eopl:error "stack is empty"))
      (non-empty-stack (v_ s_)
                       v_))))


(define empty-stack?
  (lambda (s)
    (cases stack s
      (empty-stack ()
                   #t)
      (else #f))))



(pop (push (push (empty-stack) 2) 1))



