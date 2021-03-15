(define hello-world
  (lambda () (display "hello world")))

(define greet
  (lambda () (display "My name is Amir and It is nice to meet you")))

(define good-bye
  (lambda () (display "Well, good bye now")))

;;; this is the list 
(define lst '(1 2 3 4 5))

;;; this is the list to remove the duplicates
(define lst2 '(1 1 2 2 3 3 4 4))

;;; Sum the list
(define sum  ;;; fucntion
  (lambda (lst) ;;; holds the list
    (if (null? lst)
        0
        (+ (car lst) ;;;call car on the list
                (sum (cdr lst) ;;;then call function to cdr on the list
                     )))))

;;; Product of the list
(define product
  (lambda (lst)
    (if (null? lst)
        1
        (* (car lst)
           (product (cdr lst)
                    )))))

;;; compute the lenght of the list
(define len
  (lambda (lst)
    (if (null? lst)
        0
        (+ 1 (len (cdr lst))))))

;;; factorial using lambda 
(define factorial
  (lambda (num)
    (if (null? num)
          1
          (* num (factorial (- num 1))))))

;;; compute the sum of two lists
(define sum_2_lists
  (lambda (lst lst2)
    (and (null? lst)(null? lst2))
    0
    (+ (+ (car lst) (car lst2))
          (sum_2_lists (cdr lst) (cdr lst2))
          )))


;;; my map function
(define (my-map fn lst) ;;; fn is the procedure and lst will be the list applied
  (if (null? lst)       ;;; check if the list if empty and if yes then return null
      '()                 
      (cons (fn (car lst)) ;;; call fn --> procedure on car lst
            (my-map fn (cdr lst))))) ;;; call fn --> procedure on cdr lst

(define map-lst (list 1 2 3 4 5))
(define (double x) (* x 2))


;;; writing my own funtion to reverse the list
(define my-reverse
  (lambda (lst)
    (if (null? lst)
        '()
        (snoc (my-reverse (cdr lst))
              (car lst)))))

;;; writing a function called snoc
(define snoc
  (lambda (lst member)
    (if (null? lst)
        (list member)
        (cons (car lst)
              (snoc (cdr lst) member)
              ))))

;;; This function is going to double each top level element of lst
(define (echo lst)
  (if (null? lst)
      '()
      (cons (car lst) (cons (car lst)
                            (echo (cdr lst))))))

(define (echo-lots lst n)
  (define (echo-aux e c)
    (if (= c 0) '()
        (cons e (echo-aux e (- c 1) ) ) ))
  (if (null? lst) '()
      (append (echo-aux (car lst) n) (echo-lots (cdr lst) n) ) ))


(define (echo-a elem c)
  (if (= c 0)
      '()
      (cons elem (echo-a elem (- c 1)))))

(define (echo-three lst num)
  (if (null? lst)
      '()
      (append (echo-a (car lst) num) (echo-three (cdr lst) num))
      ))




(define (echo-all lst)
  (if (null? lst) '()
      (if (not (list? (car lst)))
         (cons (car lst) (cons (car lst) (echo-all (cdr lst) ) ) )
          (cons (echo (car lst)) (cons (echo (car lst)) (echo-all (cdr lst))) ) ) ))


(define (nth n lst)
  (if (= n 0)
      (car lst)
      (nth (- n 1) (cdr lst) ) ))


(define (filter fn lst)
  (if (null? lst) '()
      (if (fn (car lst))
          (cons (car lst)
                (filter fn (cdr lst) ) ) (filter fn (cdr lst) ) ) ))



(define (filter-out-er fn)
  (define f (lambda(x) (if (null? x) '()
                           (if (not (fn (car x)))
                               (cons (car x) (f (cdr x)) ) (f (cdr x)) ) ) )) f)


(define assoc-all
  (lambda (keys lst)
    (map (lambda (key) (cdr (assoc key lst)))
         keys)))


(define (assoc-all keys a-list)
  (if (null? a-list)
      '()
      (map (lambda (key) (cdr (assoc key a-list)))
           keys)))