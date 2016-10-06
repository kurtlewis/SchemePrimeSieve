;; code to build list of all number 1 to N
(define buildList
    (lambda (n N)
    (if (> n N)
        '()
        (cons n (buildList (+ n 1) N)))))

;; code to filter out multiples of each number
(define filter-out
    (lambda (num 1st)
        (if (null? 1st)
            '()
            (if (= (modulo (car 1st) num) 0)
                (filter-out num (cdr 1st))
                (cons (car 1st) (filter-out num (cdr 1st)))))))
