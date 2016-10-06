;; code to build list of all number 1 to N
(define buildList
    (lambda (n N)
    (if (> n N)
        '()
        (cons n (buildList (+ n 1) N)))))
