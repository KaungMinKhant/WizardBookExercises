(define (filtered-accumulate predicate? combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner
        (if (predicate? a) (term a) null-value)
        (filtered-accumulate predicate? combiner null-value term (next a) next b))))

(define (filtered-accumulate-iter predicate? combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (combiner result (if (predicate? a) (term a) null-value)))))
  (iter a null-value))

(define (inc n) (+ n 1))

(define (sum-of-squares-prime a b)
  (filtered-accumulate prime? + 0 square a inc b))

(define (sum-of-squares-prime-iter a b)
  (filtered-accumulate-iter prime? + 0 square a inc b))

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

 (define (relative-prime? i n)
    (= (gcd i n) 1))

(define (identity x) x)

(define (product-of-relative-prime n)
  (define (relative-prime? i)
    (= (gcd i n) 1))
  (filtered-accumulate relative-prime? * 1 identity 1 inc n))

(define a 3)
(define a 4)

(define (b) (+ a 9))

;While writing recursive, it is more like just translate what i have in mind in english.
;Therefore, I prefer to start with recursive.


