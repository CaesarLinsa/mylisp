(defclass bank-account ()
    ((customer-name
     :initarg :customer-name
     :initform (error "Must supply a customer name")
     :accessor customer-name
     :documentation "customer user name")
     (balance
     :initarg :balance
     :initform 0
     :accessor balance
     :documentation "user account money")
     (account-type
     :reader account-type
     :documentation "type of account")
     (opening-bonus-percentage
     :accessor opening-bonus-percentage
     :documentation "opening bonus percentage")))

;初始化时，开户时一定比例的初始余额奖励
(defmethod initialize-instance :after (account &key opening-bonus-percentage)
  (when opening-bonus-percentage
    (incf  (slot-value account 'balance)
	   (* (slot-value account 'balance) (/ opening-bonus-percentage 100)))))

;初始化加account-type参数
;(defmethod initialize-instance :after ((account bank-account) &key)
;  (let ((balance (slot-value account 'balance)))
;	(setf (slot-value account 'account-type)
;	      (cond
;		((>= balance 10000) :gold)
;		((>= balance 1000)  :silver)
;		(t :bronze)))))

;(defparameter *account* (make-instance 'bank-account ))

(defparameter *account* (make-instance 'bank-account :customer-name "caesarlinsa" :balance 1000
				       :opening-bonus-percentage 7))


(print (slot-value *account* 'customer-name))

(print (slot-value *account* 'balance))

