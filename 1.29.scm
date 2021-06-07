(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b)
     dx))

; assuming n is even
(define (integral-simpson f a b n)
  (define h (/ (- b a) n))
  (define (add-2h x) (+ x h h))
  (* (+ (f a)
        (* 2 (sum f a       add-2h b))
        (* 4 (sum f (+ a h) add-2h b))
        (f b))
     (/ h 3)))

(define (cube x) (* x x x))

;(integral cube 0 1 0.01) = .24998750000000042
;(integral cube 0 1 0.001) = .249999875000001
;(integral-simpson cube 0 1.0 100) = .25000000000000044
;(integral-simpson cube 0 1.0 1000) = .25000000000000083
;(integral-simpson) has more accuracy.