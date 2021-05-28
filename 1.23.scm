(define (smallest-divisor n)
  (find-divisor-improved n 2))

(define (find-divisor-improved n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor-improved n (next test-divisor)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (next test-divisor)
  (if (= test-divisor 2)
      3
      (+ test-divisor 2)))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (process-time-clock)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (process-time-clock) start-time))
      "nothing"))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

;I can't test for small numbers since it only returns 0 for me.
;By the following observation, i find that it is 1.5 times faster to use 
;this improved version.
;By skipping the even numbers, the amount of calculation time is reduced by almost half. 
;If this (next) and (+ test-divisor 1) are compared, this new algorithms will be 2 times
;faster. However, we have to take account of other procedures too, due to other procedures
;it cannot be 2 times faster, therefore the computation time is a bit reduced which 
;resulted 1.5 times.

;10000000019; 60
;10000000019; 90