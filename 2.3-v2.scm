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

(define (make-rect p1 p2)
  (cons p1 p2))

(define (get-p1 r)
  (car r))

(define (get-p2 r)
  (cdr r))
; if we get two points, we can make the rectangle out of it
; by creating x values and y values from those three points.
; the idea is as following
;Corner | x value | y value
;bottom left | min | min
;bottom right | max | min
;top left | min | max
;top right | max | max


(define (get-point r xselector yselector)
  (make-point (xselector (x-point (get-p1 r)) (x-point (get-p2 r)))
              (yselector (y-point (get-p1 r)) (y-point (get-p2 r)))))
(define (get-bottom-left r)
  (get-point r min min))

(define (get-bottom-right r)
  (get-point r max min))

(define (get-top-left r)
  (get-point r min max))

(define (get-top-right r)
  (get-point r max max))

(define (width-rect r)
  (abs (- (x-point (get-p1 r)) (x-point (get-p2 r)))))

(define (height-rect r)
  (abs (- (y-point (get-p1 r)) (y-point (get-p2 r)))))

(define r1 (make-rect (make-point 3 8) (make-point 6 -8)))

(display "Rectangle 1: ") (newline)
(display "Perimeter: ") (display (perimeter-rect r1)) (newline)
(display "Area ") (display (area-rect r1)) (newline) (newline)
(display "Bottom Left ") (display (get-bottom-left r1)) (newline) (newline)
(display "Bottom Right ") (display (get-bottom-right r1)) (newline) (newline)
(display "Top Left ") (display (get-top-left r1)) (newline) (newline)
(display "Top Right ") (display (get-top-right r1)) (newline) (newline)
