(defvar *alphabet* 
  (coerce "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ" 'list))
(defvar *coded-alphabet*
  (coerce "nopqrstuvwxyzabcdefghijklmABCDEFGHIJKLMNOPQRSTUVWXYZ" 'list))

(defun rot13 (string)
  (labels 
      ((rot13-rec (string acc)
		  (if (null string)
		      (reverse acc)
		    (let ((letter (car string)))
		      (rot13-rec (cdr string)
				 (cons 
				  ; Soit la lettre codee, 
				  ; soit le meme caractere special
				  (if (member letter *alphabet*)
				      (nth (position letter *alphabet*)
					   *coded-alphabet*)
				    letter)
				  acc))))))
    (coerce (rot13-rec (coerce string 'list) '()) 'string)))
