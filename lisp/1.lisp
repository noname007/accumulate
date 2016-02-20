; (setf res (mapcar #'(lambda (x)(+ x 10)) '(1 2 3)))
; (setf res (atom ()))
; (setf res (- 0 1 1 1 ))
; (format t "~a~%" res)

; (format t "~a" (- 2 1 ))
; 
(setf res1 (make-array '(10) :initial-element 1))
(setf res (aref res1 0 ))

(format t "~a~%" res)
