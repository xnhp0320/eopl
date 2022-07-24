#lang racket
(require test-engine/racket-tests)

(define empty-stack-pop
  (lambda ()
    (error "pop an empty stack")))

(define empty-stack-top
  (lambda ()
    (error "top an empty stack")))


(define empty-stack-empty?
  (lambda ()
    (#t)))

(define empty-stack
  (lambda ()
    (lambda (op)
      (cond
        [(equal? op 'pop) (empty-stack-pop)]
        [(equal? op 'top) (empty-stack-top)]
        [(equal? op 'empty-stack?) (empty-stack-empty?)]))))


(define push
  (lambda (stack val)
    (lambda (op)
      (cond
        [(equal? op 'pop) stack]
        [(equal? op 'top) val]
        [(equal? op 'empty-stack?) #f]
        ))))


(define top
  (lambda (stack)
      (stack 'top)))

(define pop
  (lambda (stack)
    (stack 'pop)))


(define e (empty-stack))
(check-expect (top (push (empty-stack) 1)) 1)
(check-expect (top (push e 1)) 1)
(check-expect (equal? (pop (push e 1)) e) #t)

(test)

          