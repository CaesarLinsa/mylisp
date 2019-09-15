;;; > (compress '(1 1 1 0 1 0 0 0 0 1))
;;; ((3 1) 0 1 (4 0) 1)

(defun uncompress(lst)
      (if (null lst)
            nil
         (let (( x (car lst))
                (rest (uncompress(cdr lst)))) 
             (if (consp x)
                 (append (apply #'caesar x) rest)
                 (cons x rest)))))


(defun caesar(n x)
    (if (zerop n)
         nil
        (cons x (caesar (- n 1) x))))


(print (uncompress '((3 1) 0 1 (4 0) 1) )) 
                                                                                                                                                               