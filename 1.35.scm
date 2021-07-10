;ϕ is the golden ration which satisfied the equation ϕ^2 = ϕ + 1.
;Let's devide with ϕ to both sides of the equation.
;ϕ^2 / ϕ = (ϕ + 1) / ϕ
;ϕ = 1 + 1 / ϕ
; replace ϕ with x
; It becomes x = 1 + (1 / x)
; x -> 1 + (1 / x)

(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(display (fixed-point (lambda (x) (+ 1 (/ 1 x))) 1.0))
