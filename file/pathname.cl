;;; file form
(make-pathname :directory '(:absolute "foo") :name "bar")
;;; directory form
(make-pathname :directory '(:absolute "foo" "bar"))

;;; value not nil and not equal unspecific
;;; the file six component 
(defun component-exist-p(value)
  (and value (not (eql value :unspecific))))


;;; if filename not exist and type not exist
;;; and filename not nil,return filename 
(defun directory-path-p(p)
  (and
    (not (component-exist-p(pathname-name p)))
    (not (component-exist-p(pathname-type p)))
    p))

;;; if pathname has name、type, such as "/home/caesar.txt"
;;; directory form "(make-path :directory '(:absolute:"home" "caesar")"
(defun pathname-as-directory (name)
  (let ((pathname (pathname name)))
    (when (wild-pathname-p pathname)
      (error "can't reliably convert wild pathnames"))
    (if (not (directory-path-p pathname))
      (make-pathname
	:directory (append (or (pathname-directory pathname) (list :relative))
			       (list (file-namestring pathname)))
	:name nil
	:type nil
	:defaults pathname)
      pathname)))

;;; if dirname is "/home/caesar", return directory #P"/home/caesar/*.*"
(defun directory-wildcard (dirname)
  (make-pathname
    :name :wild
    :type #-clisp :wild #+clisp NIL
    :defaults (pathname-as-directory dirname)))

#+clisp
(defun clisp-subdirectories-wildcard (wildcard)
  (make-pathname
    :directory (append (pathname-directory wildcard) (list :wild))
    :name NIL
    :type NIL
    :defaults wildcard))

(defun list-directory (dirname)
  (when (wild-pathname-p dirname)
    (error "Can only list concrete directory names."))
  (let ((wildcard (directory-wildcard dirname)))

    #+(or sbcl cmu lispworks)
    (directory wildcard)

    #+openmcl
    (directory wildcard :directories t)

    #+allegro
    (directory wildcard :directories-are-files NIL)

    #+clisp
    (nconc
      (directory wildcard)
      (directory (clisp-subdirectories-wildcard wildcard)))

    #-(or sbcl lispworks openmcl allegro clisp)
    (error "list-directory not implemented")))

(defun file-exists-p(p)
  #+(or sbcl lispworks openmcl)
  (probe-file p)

  #+(or allegro cmu)
  (or (probe-file (pathname-as-directory p))
      (probe-file p)))

; test file-exists-p
;(defvar path (pathname "C:\\Users\\caesar"))
;(print (file-exists-p path))

