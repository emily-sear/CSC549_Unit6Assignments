;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname Assignment2.59) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 2.59

(define (element-of-set? x set)
  (cond
    ((null? set) false)
    ((equal? x (car set)) true)
    (else (element-of-set? x (cdr set)))))

(define (adjoin-set x set)
  (if (element-of-set? x set) set
      (cons x set)))

(define (intersection-set set1 set2)
  (cond
    ((or (null? set1) (null? set2)) '())
    ((element-of-set? (car set1) set2) (cons (car set1) (intersection-set (cdr set1) set2)))
    (else (intersection-set (cdr set1) set2))))


; Union-set : computes the union of two sets, which is the set containing each element that appears in either argument

(define (union-set set1 set2)
  (cond
    ((or (null? set1) (null? set2)) '())
    ((element-of-set? (car set1) set2) (cons (car set1) (union-set (cdr set1) set2)))
    (else (union-set (cdr set1) set2))))

(union-set '(5 2 3 1 4 9 5 192) '(2 3 6 7 192 8))
  
      
                      