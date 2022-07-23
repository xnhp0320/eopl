#lang eopl


(define leaf
  (lambda (num)
    (cons 'leaf (list num))))


(define interior-node
  (lambda (s left right)
    (append (list 'interior-node s) (list left right))))

(define leaf?
  (lambda (node)
    (if (list? node)
        (if (equal? (car node) 'leaf)
            #t
            #f)
        #f)
    ))

(define lson
  (lambda (p)
    (if (list? p)
        (if (equal? (car p) 'interior-node)
            (caddr p)
            '())
        '())))

(define rson
  (lambda (p)
    (if (list? p)
        (if (equal? (car p) 'interior-node)
            (cadddr p)
            '()
            )
        '())))

(define contents-of
  (lambda (p)
    (if (list? p)
        (cond
          [(equal? (car p) 'interior-node) (cadr p)]
          [(equal? (car p) 'leaf) (cadr p)]
          [else '()]
          )
        '())))



                






