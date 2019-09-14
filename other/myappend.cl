;破坏性append，破坏原有list
;lisp默认append和remove不具有破坏性

(defun myappend(lst y)
    (if (consp lst)
        (progn 
          (setf (cdr (last lst)) y)
           lst)))


(setf x (list 'a 'b 'c))
(print (myappend x  'd))
