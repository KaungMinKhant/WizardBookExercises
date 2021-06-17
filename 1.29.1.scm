(define (simpson f a b n)
  (define h (/ (- b a) n))
  (define (inc n) (+ 1 n))
  (define (y x) (f (+ a (* x h))))
  (define (term x)
    (cond ((= x 0) (y x))
          ((= x n) (y x))
          ((even? x) (* 2 (y x)))
          (else (* 4 (y x)))))
  (define the-sum (sum term 0 inc n))
    (/ (* h the-sum) 3.0))

(define (even? n)
  (= (remainder n 2) 0))

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b)
     dx))

(define (cube x) (* x x x))

;(integral cube 0 1 0.01) = .24998750000000042
;(integral cube 0 1 0.001) = .249999875000001
;(integral-simpson cube 0 1.0 100) = .24999999999999992
;(integral-simpson cube 0 1.0 1000) = .2500000000000003
;(integral-simpson) has more accuracy.