;; code to build list of all number 1 to N
(define buildList
    (lambda (n m)
    (if (> n m)
        '()
        (cons n (buildList (+ n 1) m)))))

;; code to filter out multiples of each number
(define filter-out
    (lambda (num lst)
        (if (null? lst)
            '()
            (if (= (modulo (car lst) num) 0)
                (filter-out num (cdr lst))
                (cons (car lst) (filter-out num (cdr lst)))))))

;; sieve to call filter out as appropriate
(define sieve
    (lambda (lst)
        (if (null? lst)
            '()
            (cons (car lst) (sieve (filter-out (car lst) (cdr lst)))))))

;; controlling function to use the above methods
(define primes (lambda (N) (sieve (buildList 2 N))))

(define banana
    (lambda (m lst)
        (if (= m 0)
            '()
            (cons (car lst) (banana (- m 1) (cdr lst))))))

(define stol
    (lambda (m)
        (let ((lst (primes (* m 20))))
            (banana m lst))))
