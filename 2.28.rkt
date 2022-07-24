#lang eopl

;lc-exp = 

(define-datatype lc-exp lc-exp?
  (var-exp
   (sym symbol?))
  (app-exp
   (rator lc-exp?)
   (rand lc-exp?))
  (lambda-exp
   (bound-var symbol?)
   (body lc-exp?)))

(define unparser-lc-exp
  (lambda (exp)
    (cases lc-exp exp
      (var-exp (sym)
               sym)
      (app-exp (rator rand)
               (list
                     (unparser-lc-exp rator)
                     (unparser-lc-exp rand)))
      (lambda-exp (bound-var body)
                  (list
                   'proc
                   bound-var
                   '=>
                   (unparser-lc-exp body))))))

(unparser-lc-exp
 (lambda-exp 'a
             (app-exp (var-exp 'b) (var-exp 'c))))



