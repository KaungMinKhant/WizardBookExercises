(define (cont-frac-recur n d k)
  (define (recur i)
    (if (= k i)
        (/ (n i) (d i))
        (/ (n i) (+ (d i) (recur (+ 1 i))))))
  (recur 1))

(define (cont-frac-iter n d k)
   (define (frac-iter i result)
       (if (= i 0)
           result
           (frac-iter (- i 1) (/ (n i) (+ (d i) result)))))
   (frac-iter (- k 1) (/ (n k) (d k))))

(newline)
(display (cont-frac-recur (lambda (i) 1.0)
           (lambda (i) 1.0)
           4))
(newline)
(display (cont-frac-recur (lambda (i) 1.0)
           (lambda (i) 1.0)
           5))
(newline)
(display (cont-frac-recur (lambda (i) 1.0)
           (lambda (i) 1.0)
           6))
(newline)
(display (cont-frac-recur (lambda (i) 1.0)
           (lambda (i) 1.0)
           7))
(newline)
(display (cont-frac-recur (lambda (i) 1.0)
           (lambda (i) 1.0)
           8))
(newline)
(display (cont-frac-recur (lambda (i) 1.0)
           (lambda (i) 1.0)
           9))
(newline)
(display (cont-frac-recur (lambda (i) 1.0)
           (lambda (i) 1.0)
           10))
(newline)
(display (cont-frac-recur (lambda (i) 1.0)
           (lambda (i) 1.0)
           11))
(newline)
(display (cont-frac-recur (lambda (i) 1.0)
           (lambda (i) 1.0)
           12))
(newline)
(display (cont-frac-iter (lambda (i) 1.0)
           (lambda (i) 1.0)
           12))
(newline)
