(define (double f)
  (lambda (x) (f (f x))))

(define (inc x)
 (+ x 1))

(newline)
(display (((double (double double)) inc) 5))

; (((double double) f) x)
; ((double (double f)) x)