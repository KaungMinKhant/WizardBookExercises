; --- Points ---
(define (make-point x y) (cons x y))
(define (x-point p) (car p))
(define (y-point p) (cdr p))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

; --- Segments ---
(define (make-segment p1 p2) (cons p1 p2))
(define (start-segment s) (car s))
(define (end-segment s) (cdr s))

(define (print-segment s)
  (newline)
  (display "[")
  (print-point (start-segment s))
  (display ",")
  (print-point (end-segment s))
  (display "]"))


(define (perimeter-rect r)
  (* 2 (+ (width-rect r) (height-rect r))))

(define (area-rect r)
  (* (width-rect r) (height-rect r)))

(define (make-rect origin height width angle)
  (cons (cons height width) (cons origin angle)))

(define (origin-rect r)
  (car (cdr r)))

(define (angle-rect r)
  (cdr (cdr r)))

(define (width-rect r)
  (cdr (car r)))

(define (height-rect r)
  (car (car r)))

(define origin1 (make-point 1 1))
(define height1 2.0)
(define width1 5.0)
(define angle1 0.3)

(define r1 (make-rect origin1 height1 width1 angle1))

(display "Rectangle 1: ") (newline)
(display "Perimeter: ") (display (perimeter-rect r1)) (newline)
(display "Area ") (display (area-rect r1)) (newline) (newline)