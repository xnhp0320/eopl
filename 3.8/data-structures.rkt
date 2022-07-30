#lang eopl

;; data structures for let-lang.

(provide (all-defined-out))               ; too many things to list

;;;;;;;;;;;;;;;; expressed values ;;;;;;;;;;;;;;;;

;;; an expressed value is either a number, a boolean or a procval.

(define-datatype listval listval?
  (empty-list)
  (non-empty-list
   (first expval?)
   (rest  listval?)))

(define-datatype expval expval?
  (num-val
   (value number?))
  (bool-val
   (boolean boolean?))
  (list-val
   (lst listval?)))

;;; extractors:

;; expval->num : ExpVal -> Int
;; Page: 70
(define expval->num
  (lambda (v)
    (cases expval v
      (num-val (num) num)
      (else (expval-extractor-error 'num v)))))

;; expval->bool : ExpVal -> Bool
;; Page: 70
(define expval->bool
  (lambda (v)
    (cases expval v
      (bool-val (bool) bool)
      (else (expval-extractor-error 'bool v)))))

;; expval->list : ExpVal -> Listof expval->list ExpVal
(define expval->list
  (lambda (v)
    (cases expval v
      (list-val (lst)
                (cases listval lst
                  (empty-list ()
                              '())
                  (non-empty-list (first rest)
                                  (cases expval first
                                    (bool-val (bool)
                                              (cons bool (expval->list (list-val rest))))
                                    (num-val (num)
                                             (cons num (expval->list (list-val rest))))
                                    (list-val (lst)
                                              (list (expval->list (list-val lst))))))))
    (else (expval-extractor-error 'list v)))))

(define expval->listval
  (lambda (v)
    (cases expval v
      (list-val (lst)
                lst)
      (else (expval-extractor-error 'list v)))))

(define expval-extractor-error
  (lambda (variant value)
    (eopl:error 'expval-extractors "Looking for a ~s, found ~s"
                variant value)))

;;;;;;;;;;;;;;;; environment structures ;;;;;;;;;;;;;;;;

;; example of a data type built without define-datatype

(define empty-env-record
  (lambda () 
    '()))

(define extended-env-record
  (lambda (sym val old-env)
    (cons (list sym val) old-env)))

(define empty-env-record? null?)

(define environment?
  (lambda (x)
    (or (empty-env-record? x)
        (and (pair? x)
             (symbol? (car (car x)))
             (expval? (cadr (car x)))
             (environment? (cdr x))))))

(define extended-env-record->sym
  (lambda (r)
    (car (car r))))

(define extended-env-record->val
  (lambda (r)
    (cadr (car r))))

(define extended-env-record->old-env
  (lambda (r)
    (cdr r)))
