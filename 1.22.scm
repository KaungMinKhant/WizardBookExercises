; --- Prime computation ---



(define (square x) (* x x))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n)
         n)
        ((divides? test-divisor n)
         test-divisor)
        (else (find-divisor
               n
               (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

; --- Timing ---

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


(define (search-for-primes start-range end-range)
  (if (even? start-range)
      (search-for-primes (+ 1 start-range) end-range)
      (cond ((> start-range end-range)
             (newline) (display "done"))
            (else (timed-prime-test start-range)
                  (search-for-primes (+ 2 start-range) end-range)))))


; 1009 -> 0 tick
; 1013 -> 0 tick
; 1019 -> 0 tick
; 10007 -> 0
; 10009 -> 0
; 10037 -> 0

; My computer only starts printing time at starting around from 100000000. Before that these are only 0.
; Probably our computer becomes so fast.
; 100000000 -> around 10 ticks
; 1000000000 -> around 30 ticks
; so it's around 3 which is √10

