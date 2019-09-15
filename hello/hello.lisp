(in-package :hello)

(defun main(args)
    (if (null args)
         (format t "hello world ~A~%" *default-name*)
     (hello args)))
     
     
 (defun hello(names)
     (when names
        (format t "hello world ~A~%" (car names))
         (hello (cdr names))))
         
