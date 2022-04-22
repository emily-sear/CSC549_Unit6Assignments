;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname Assigment2.53) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 2.53

; if the symbol/item is not contained in the list, then it returns false
; Otherwise, it returns a sublist of the list starting with the first occurence of the symbol/item
(define (isThisThingInHere item x)
  (cond
    ((null? x) false)
    ((eq? item (car x)) x)
    (else (memq item (cdr x)))))

(display (list 'a 'b 'c)) ; (a b c)
(display (list (list 'george))) ; ((george))
(display (cdr '((x1 x2) (y1 y2)))) ; ((y1 y2))
(display (cadr '((x1 x2) (y1 y2)))) ; (y1 y2)
(display (pair? (car '(a short list)))) ; false
(isThisThingInHere 'red '((red shoes) (blue socks))) ; False
(isThisThingInHere 'red '(red shoes blue socks)) ; (red shoes blue socks) 
