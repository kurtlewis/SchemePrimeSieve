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

;; sieve to call filter out as appropriate
(define sieve
    (lambda (1st)
        (if (null? 1st)
            '()
            (cons (car 1st) (sieve (filter-out (car 1st) (cdr 1st)))))))

;; controlling function to use the above methods
(define primes (lambda (N) (sieve (buildList 2 N))))

(define stol
    (lambda (m)
        (let ((1st (primes (* m 20))))
            (take m 1st))))

(define take
    (lambda (m 1st)
        (if (= m 0)
            '()
            (cons (car 1st) (take (- m 1) (cdr 1st))))))
