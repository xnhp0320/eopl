#lang eopl

(define count-occur-from
  (lambda (s-exp n v)
    (if (null? s-exp)
        n
        (if (symbol? (car s-exp))
            (if (equal? (car s-exp) v)
                (count-occur-from (cdr s-exp) (+ n 1) v)
                (count-occur-from (cdr s-exp) n v))
            (+ (count-occur-from (car s-exp) n v)
               (count-occur-from (cdr s-exp) n v))))))



(define count-occurrences
  (lambda (v s-exp)
    (count-occur-from s-exp 0 v)))


