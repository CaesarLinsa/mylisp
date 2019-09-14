
; read file with open
(defun read_whole_file(filename)
(let (( in  (open filename :if-does-not-exist nil )))
     (when in
       (loop for line = (read-line in nil)
	     while line do (format t "~a~%" line)))
     (close in)))


; read file with-open-file
(defun read_file(filename)
  (with-open-file (in filename)
    (when in
      (loop for line = (read-line in nil)
	    while line do (print line)))))

(read_file "text.txt")
