; Tpq(a,b) = (bq + aq + ap, bp + aq)
; Tp'q'(a,b) = (bq' + aq' + ap', bp' + aq')
; Tpq(Tpq(a,b))
; = Tpq(bq + aq + ap, bp + aq)
; = ((bp + aq)q + (bq + aq + ap)q + (bq + aq + ap)p, (bp + aq)p + (bq + aq + ap)q)
; = (bpq + aq^2 + bq^2 + aq^2 + apq + bpq + apq + ap^2, bp^2 + apq + bq^2 + aq^2 + apq)
; = (b(pq + q^2 + pq) + aq^2 + aq^2 + apq + apq + ap^2, b(p^2 + q^2) + a(pq + q^2 + pq))
; = (b(2pq + q^2) + aq^2 + aq^2 + 2apq + ap^2, b(p^2 + q^2) + a(2pq + q^2))
; = (b(2pq + q^2) + (2apq + aq^2) + (ap^2 + aq^2), b(p^2 + q^2) + a(2pq + q^2))
; = (b(2pq + q^2) + a(2pq + q^2) + a(p^2 + q^2), b(p^2 + q^2) + a(2pq + q^2))
; replacing the values in Tp'q'(a,b)
; q = 2pq + q^2
; p = p^2 + q^2

(define (fib n)
  (fib-iter 1 0 0 1 n))
(define (fib-iter a b p q count)
  (cond ((= count 0) b)
        ((even? count)
         (fib-iter a
                   b
                   (+ (* p p) (* q q))      ; compute p'
                   (+ (* 2 p q) (* q q))      ; compute q'
                   (/ count 2)))
        (else (fib-iter (+ (* b q) (* a q) (* a p))
                        (+ (* b p) (* a q))
                        p
                        q
                        (- count 1)))))