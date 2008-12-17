; Quelques fonctions utiles pour la cryptographie

; Quelques raccourcis
(defmacro str->lst (str)
  "Convertit une chaîne en liste"
  `(coerce ,str 'list))
(defmacro lst->str (lst)
  "Convertit une liste en chaîne"
  `(coerce ,lst 'string))
(defmacro cat (&rest strings)
  "Concatène plusieurs chaînes"
  `(concatenate 'string ,@strings))
(defmacro carstr (str)
  "Le premier caractère d'une chaîne"
  `(subseq ,str 0 1))
(defmacro cdrstr (str)
  "Le cdr d'une chaîne (ce qu'il reste après le premier caractère)"
  `(subseq ,str 1))
(defmacro firstchr (str)
  "Retourne le premier caractère d'une chaîne (sous la forme \#c, pas \"c\")"
  `(car (coerce ,str 'list)))

; Fonctions utiles en cryptographie
(defun group-letters (step string)
  "Groupe les lettres de `string' par groupes de `step' lettres"
  (labels ((group-tail-rec (str acc)
	      (if (= (length str) 0)
		  acc
		(if (> step (length str))
		    (cons str acc)
		  (group-tail-rec
		   (subseq str step)
		   (cons (subseq str 0 step)
			 acc))))))
    (reverse (group-tail-rec string '()))))

;; (defun rm-special-chars (string &key (accents t) (spaces t))
;;   "Enlève les caractère spéciaux"
;;   (let* ((without-accents
;; 	  (if accent
;; 	      (map 'string #'(lambda (c) ;TODO
;; 			       c))))
;; 	 ((without-spaces
;; 	   (apply 'rm-spaces without-accnts))))
;;     without-spaces))

(defun rm-spaces (string)
  (labels ((rm-tail-rec (str acc)
	      (if (equal str "")
		  acc
		(let* ((c (carstr str))
		       (newchar 
			(if (equal c " ") ""
			  c)))
		  (rm-tail-rec (cdrstr str) (cat acc newchar))))))
    (rm-tail-rec string "")))

