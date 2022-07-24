#lang eopl


(define-datatype env env?
  (empty-env)
  (extend-env
   (id symbol?)
   (value integer?)
   (env env?)))


(define has-binding?
  (lambda (e var)
    (cases env e
      (empty-env ()
       #f)
      (extend-env (var_ v_ env_)
                  (if (equal? var var_)
                      #t
                      (has-binding? env_ var))))))



    