(define (numer x) (car x))
(define (denom x) (cdr x))

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))

(define (make-rat n d)
  (let ((g (gcd n d))
        (denom-sign (or (and (> d 0) +) (and (< d 0) -))))
    (cons (denom-sign (/ n g))
          (denom-sign (/ d g)))))

(define (>= x y)
  (not (< x y)))

(print-rat (make-rat  2 -4))
(print-rat (make-rat -2  4))