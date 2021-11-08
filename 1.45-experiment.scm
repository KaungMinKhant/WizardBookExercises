(define (compose f g)
  (lambda (x)
    (f (g x))))

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (average x y)
  (/ (+ x y) 2))

(define tolerance 0.000001)

(define (average-damp f)
  (lambda (x) (average x (f x))))

(define (repeated f n)
  (if (= n 1)
      f
      (compose f (repeated f (- n 1)))))

(define (power x n)
  (if (= n 1)
      x
      (* x (power x (- n 1)))))

(define (nth-root-damped x nth damp)
  (fixed-point
    ((repeated average-damp damp)
    (lambda (y)
      (/ x (power y (- nth 1)))))
   1.0))
  
(newline) (display (nth-root-damped 4 2 1)) (newline)
(newline) (display (nth-root-damped 8 3 1)) (newline)
(newline) (display (nth-root-damped 16 4 2)) (newline)
(newline) (display (nth-root-damped 32 5 2)) (newline)
(newline) (display (nth-root-damped 64 6 2)) (newline)
(newline) (display (nth-root-damped 128 7 2)) (newline)
(newline) (display (nth-root-damped 256 8 3)) (newline)

