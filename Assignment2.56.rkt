;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname Assignment2.56) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 2.56

(define (deriv exp var)
  (cond
    ((number? exp) 0)
    ((variable? exp)
     (if (same-variable? exp var) 1
         0))
    ((sum? exp) (make-sum (deriv (addend exp) var)
                          (deriv (augend exp) var)))
    ((product? exp)
     (make-sum
      (make-product (multiplier exp)
                    (deriv (multiplicand exp) var))
      (make-product (deriv (multiplier exp) var)
                    (multiplicand exp))))
    ((exponentiation? exp)
     (make-exponentiation (deriv (base exp) var) (deriv (exponent exp) var)))
    (else
     (error "unknown expression type: DERIV" exp))))

(define (variable? x)
  (symbol? x))

(define (same-variable? v1 v2)
  (and
   (variable? v1)
   (variable? v2)
   (eq? v1 v2)))

(define (make-sum a1 a2)
  (cond
    ((=number? a1 0) a2)
    ((=number? a2 0) a1)
    ((and (number? a1) (number? a2))
          (+ a1 a2))
    (else (list '+ a1 a2))))

(define (=number? exp num)
  (and
   (number? exp)
   (= exp num)))

(define (make-product m1 m2)
  (cond
    ((or (=number? m1 0) (=number? m2 0)) 0)
    ((=number? m1 1) m2)
    ((=number? m2 1) m1)
    ((and (number? m1) (number? m2)) (* m1 m2))
    (else (list '* m1 m2))))

(define (pair? x)
  (if
   (eq? (length x) 2) #t
   #f))

(define (sum? x)
  (and
   (pair? (cdr x)) (eq? (car x) '+)))

(define (addend s) (cadr s))

(define (augend s) (caddr s))

(define (product? s)
  (and
   (pair? (cdr s)) (eq? (car s) '*)))

(define (exponentiation? exp)
  (and
   (pair? (cddr exp))
   (eq? (car exp) '*)
   (eq? (cadr exp) '*)))

(define (make-exponentiation base exponent)
  (cond
    ((=number? exponent 0) 1)
    ((=number? exponent 1) base)
    ((and (number? base) (number? exponent)) (expt base exponent))
    (else (list '* '* base exponent))))
    

(define (multiplier p)
  (cadr p))

(define (multiplicand p)
  (caddr p))

(define (base exp)
  (caddr exp))

(define (exponent exp)
  (cadddr exp))


(deriv '(* * x (* x x)) 'x)

