#lang eopl
(require eopl/tests/private/utils)

(require "data-structures.rkt")  ; for expval constructors
(require "lang.rkt")             ; for scan&parse
(require "interp.rkt")           ; for value-of-program

(define run
  (lambda (string)
    (value-of-program (scan&parse string))))

; 3.9
(run "let x = 4 in
      cons(x, cons(cons(-(x,1), emptylist), emptylist))")

; 3.10
(run "let x = 4 in list(x, -(x,1), -(x,3))")
; 3.12
(run "cond { zero? (1) ==> 2 } end")
(run "cond { zero? (0) ==> 2 } end")

