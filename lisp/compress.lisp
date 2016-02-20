; (defun sum(x y)
 ; (+ x y))
; (format t "~d~%'gdd'~%" (sum 1 2))
; (setf  x (cons 'a  nil ))
; (setf res (car x))
; (setf res (cdr x))

; (defun is-atom(X)
;   (not (consp x)))

; (defun is-list(x)
;   (or (null x) (consp x)))

; ; (setf res (is-list 1))
; ; (setf res (is-atom 1))

; ; eql 判断对象相同
; ; equal 元素相同
; (setf res (eql (cons 'a nil) (cons 'a nil)))
; (setf res (equal (cons 'a nil) (cons 'a nil)))


; ; (format t "~a" res)
; ; (format t "~a" (cons 'a  nil ))


; (setf l '(0 1 1 1 1 0 0 0 1 0 0 0 1  1 222 33 3445 66 11 3345 6 1 346 111 22 2 222 22 22 222 222 ))
; ((4 1) (3 0) 1 (3 0))
(defun compress(x)
  (if (consp x)
      (comp (car x) 1 (cdr x)) 
      x))
(defun comp(head num tail)
  ; (format t "~a ~a ~a~%" head num tail)
  (if (null tail)
      (n-ele num head)
      (let ((tail-1 (car tail)))
        (if (eql head tail-1)
            (comp head (1+ num) (cdr tail))
            (cons (n-ele num head) (comp tail-1 1 (cdr tail)))))))

(defun n-ele(n ele)
  (if (> n 1 )
      (list n ele)
      ele)
  )

; (format t "~a~%" (compress l))

(defun uncompress(x)
  (if (consp x)
      (uncomp (car x) (cdr x))
      x))
(defun uncomp(head tail)
  (if (null head)
    nil
    (if (consp head)
        (append 
          (decompress-n-ele (car head) (car (cdr head)))
          (uncomp (car tail) (cdr tail)))
        (cons 
          head 
          (uncomp (car tail) (cdr tail))))))
(defun decompress-n-ele(num ele)
  (format t "~a ~a~%" num ele)
  (if (eql num 0)
      nil
      (cons ele (decompress-n-ele (1- num) ele))))

; (format t "~a~%" (uncompress (compress l)))
; (format t "~a~%" (append '(a)))