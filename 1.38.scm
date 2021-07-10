(define (cont-frac-iter n d k)
   (define (frac-iter i result)
       (if (= i 0)
           result
           (frac-iter (- i 1) (/ (n i) (+ (d i) result)))))
   (frac-iter (- k 1) (/ (n k) (d k))))


(define (d-euler i)
  (if (= (modulo i 3) 2)
      (* 2(/ (+ i 1) 3))
      1))

(define (display-serie f n)
  (define (rec i)
    (display (f i)) (display ", ")
    (if (= i n)
        (newline)
        (rec (add1 i))))
  (rec 1))

(define (add1 x)
  (+ x 1))

(newline)
(display-serie d-euler 12)

(newline)
(display (cont-frac-iter (lambda (i) 1.0)
                 d-euler
                 12))
(newline)
