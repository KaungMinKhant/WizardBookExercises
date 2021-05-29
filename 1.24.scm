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

(define (search-for-primes start-range end-range)
  (if (even? start-range)
      (search-for-primes (+ 1 start-range) end-range)
      (cond ((> start-range end-range)
             (newline) (display "done"))
            (else (timed-prime-test start-range)
                  (search-for-primes (+ 2 start-range) end-range)))))


;with fermat test, it is so fast that even for 10000000019, the time returns 0 in my computer.
;It return 0 even for 1000000000000000000000000000000000000000000000++.
;I will explain theoratically only.
;Since this has log(n), every time the number is increased 10 times, the computation time will be
;increased by 1x. For normal prime test, it would increased by 3x. It does not matter that much
;for small numbers. The larger the number, the bigger the time difference is and fermat test 
;will be much faster.s