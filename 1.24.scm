(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (process-time-clock)))

(define (start-prime-test n start-time)
  (if (prime? n 12)
      (report-prime (- (process-time-clock) start-time))
      "nothing"))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder
          (square (expmod base (/ exp 2) m))
          m))
        (else
         (remainder
          (* base (expmod base (- exp 1) m))
          m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (prime? n times)
  (cond ((= times 0) #t)
        ((fermat-test n)
         (prime? n (- times 1)))
        (else #f)))