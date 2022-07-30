#lang eopl
(require eopl/tests/private/utils)

(require "data-structures.rkt")  ; for expval constructors
(require "lang.rkt")             ; for scan&parse
(require "interp.rkt")           ; for value-of-program

(define run
  (lambda (string)
    (value-of-program (scan&parse string))))

(run "let x = 1 y = 2 in -(x,y)")
(run "let x= 30 in let x = -(x,1) y= -(x,2) in -(x, y)")


