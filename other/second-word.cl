;;; �ж��Ƿ�Ϊ�Գƽṹ��ʵ��ż��ʱ
;;; ����������
(defun mirrorp (lst)
      (let ((lenth (length lst)))
           (if (evenp lenth)
              (let ((mid (/ lenth 2)))
                  (equal (subseq lst 0 mid)
                         (reverse(subseq lst mid))))
              (print nil))))

;;;����
(print (mirrorp '(a b a)))
;;; ż���Գ�
(print (mirrorp '(a b b a)))
;;; ż���Գ�
(print (mirrorp '(a b c a)))

