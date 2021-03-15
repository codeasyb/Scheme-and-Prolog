;;; Question 1
;;; This functionis going to double each top level element
(define (echo lst)
  (if (null? lst)
      '() ;; return empty list if the list given is == to null
      ;;; else cons the first element to repeat again the second time and repeat again
      ;;; for every element as recursively 
      (cons (car lst) (cons (car lst)
                            (echo (cdr lst)))
            )))

;;; Example
;;; (define lst (list "a"))
;;; (cons (car lst) (cons (car lst) (cdr lst))
;;; => ("a" "a")
;;; above the function runs a recursive call for every element 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; Question 2
;;; This function is going to repeat elements [ n ] times 
;;; I am going to use custom append
(define my-append
  (lambda (x y)
    (if (null? x) y
    (cons (car x) (my-append (cdr x) y))
    )))

(define (echo-a elem c)
  (if (= c 0)
      '()
      (cons elem (echo-a elem (- c 1)))
      ))

(define (echo-lots lst num)
  (if (null? lst)
      '()
      (my-append (echo-a (car lst) num)
                 (echo-lots (cdr lst) num))
      ))


;;; Question 3
;;; Deep version of echo
(define (echo-all lst)
  (if (null? lst) '()
      (if (not (list? (car lst)))
          ;;; normal version of echo
          (cons (car lst) (cons (car lst) (echo-all (cdr lst))))
          ;;;deep version of echo
          (cons (echo (car lst)) (cons (echo (car lst)) (echo-all (cdr lst)))))))


;;; Question 4
;;; Find element using ith element
(define (nth i lst)
  (if (= i 0)
      (car lst)
      (nth (- i 1) (cdr lst))
      ))


;;; Question 5
;;; Using map to keys to the list
(define (assoc-all keys a-list)
  (if (null? a-list)
      '()
      (map (lambda (key) (cdr (assoc key a-list)))
           keys)))

;;; Question 6
;;; filter out the even numbers
(define (filter fn lst)
  (if (null? lst) '()
      (if (fn (car lst)) ;; if tru here then filter 
          (cons (car lst)
                (filter fn (cdr lst)) (filter fn (cdr lst))))
                ))

;;; Question 7
;;; Filter out the odd numbers from the list
(define (filter-out-er fn)
  (define odds (lambda (n)
                 (if (null? n) '()
                     (if (not (fn (car n)))
                         (cons (car n) (odds (cdr n))) (odds (cdr n)))))
                 )odds)