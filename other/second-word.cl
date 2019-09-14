;;; 判断是否为对称结构，实现偶数时
;;; 基数待补充
(defun mirrorp (lst)
      (let ((lenth (length lst)))
           (if (evenp lenth)
              (let ((mid (/ lenth 2)))
                  (equal (subseq lst 0 mid)
                         (reverse(subseq lst mid))))
              (print nil))))

;;;基数
(print (mirrorp '(a b a)))
;;; 偶数对称
(print (mirrorp '(a b b a)))
;;; 偶数对称
(print (mirrorp '(a b c a)))

