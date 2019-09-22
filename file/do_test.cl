(defun as-keyword(sym)
  (intern (string sym) :keyword))

(defun slot->defclass-slot(spec)
  (let ((name  (first spec)))
    `(,name  :initarg ,(as-keyword name) :accessor ,name)))


(defmacro define-binary-class(name slots)
  `(defclass ,name ()
     ,(mapcar #'slot->defclass-slot slots)))


; 查看宏生成的代码
;(print (macroexpand-1 '(define-binary-class caesar
;((account )
;(balance )))))

;(define-binary-class caesar ((account) (balance)))
;(defparameter *account* (make-instance 'caesar :account "caesarlinsa" :balance 1000))
;(print (slot-value *account* 'account))


