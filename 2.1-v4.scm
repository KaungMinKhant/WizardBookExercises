(define (numer x) (car x))
(define (denom x) (cdr x))

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))

(define (make-rat n d)
  (let ((g (gcd n d))
        (denom-sign (if (> d 0) + -)))
    (if (> d 0)
        (cons (/ n g) (/ d g))
        (cons (denom-sign (/ n g))
              (denom-sign (/ d g))))))

(print-rat (make-rat  2 -4))
(print-rat (make-rat -2  4))