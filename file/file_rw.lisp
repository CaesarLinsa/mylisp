;write file with-open-file
(defun write_file(str file)
  (with-open-file (out file
		       :direction :output
		       :if-exists :append
		       :if-does-not-exist :create
		       )
    (write-string str out)))



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

(write_file (format nil "hello world~%")  "text.txt")
(read_file "text.txt")
