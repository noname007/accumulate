; #lang lisp
; (define (sqrt x)
;   (+ 1 1))
; (define (sqrt x)
;   1)

(define (abs x)
  ; (write x)
  (cond ((> x 0) x)
        ((= x 0) 0)
        ; ((< x 0) -x))) -- wrong exp
        ; ((< x 0) (* -1 x))))
        ((< x 0) (- x))))

; (write (abs -5))
; (write (abs 0))
; (write (abs 6))


(define (average x y)
  (/ (+ x y) 2.0))

(define (good-enough? guess	 x)
  ; (write guess)
  ; (write (abs (- guess (/ x guess))))
  (if (< (abs (- guess (/ x guess))) 0.000000001 ) 
      1
      ; null
      ; nil
      ; #f
      ; '()
      ; (write 11111111111111)
      ; '()
      #f
      ))


(define (try guess x)
  ; (write guess)
  ; (write x)
  (if (good-enough? guess x)
      guess
      ; (write 22444444444)
      (try (average guess (/ x guess)) x)))
; (write (average 2 3 ))
; (define )
; (define (sqrt x)
;   (+ 1 1)
;   (+ 2 2)
;   )

; (try 1.0 3)
; (write (try 1.0 3))

; (write (<  0.0001 1))


; fib

(define (fibs n)
  (if (< n 2)
      n
      ; (+ (fibs n-1) (fibs n-2))))
      (+ (fibs (- n 1)) (fibs (- n 2)))))

(write (fibs 10))
; 100 


