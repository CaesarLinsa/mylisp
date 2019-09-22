(defun primep(number)
  (when (> number 1)
    (loop for fac from 2 to (isqrt number) never (zerop (mod number fac)))))


(defun next-prime(number)
  (loop for n from number when (primep n) return n))

(defmacro with-gensyms((&rest names) &body body) 
  `(let ,(loop for n in names collect `(,n (gensym)))
   ,@body))

(defmacro do-prime((var start end) &body body)
  (with-gensyms (end-value-name)
    `(do ((,var (next-prime ,start) (next-prime (+ 1 ,var)))
	  (,end-value-name,end))
       ((> ,var ,end-value-name))
       ,@body)))

(do-prime (p 1 19) (print p))


