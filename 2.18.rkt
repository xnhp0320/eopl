#lang eopl


(define num->seq
  (lambda (num)
    (list num '() '())))

(define curr
  (lambda (seq)
    (car seq)))

(define left
  (lambda (seq)
    (cadr seq)))

(define right
  (lambda (seq)
    (caddr seq)))

(define at-left-end?
  (lambda (seq)
    (null? (left seq))))

(define at-right-end?
  (lambda (seq)
    (null? (right seq))))

(define move-to-left
  (lambda (seq)
    (if (at-left-end? seq)
        (eopl:error "at left end")
        (list
         (car (left seq))
         (cdr (left seq))
         (cons (curr seq) (right seq))))))


(define move-to-right
  (lambda (seq)
    (if (at-right-end? seq)
        (eopl:error "at right end")
        (list
         (car (right seq))
         (cons (curr seq) (left seq))
         (cdr (right seq))))))

(define insert-to-right
  (lambda (num seq)
    (cons num (right seq))))

(define insert-to-left
  (lambda (num seq)
    (cons num (left seq))))



     