(define (factorial x)
  (cond
        ((= 1 x) 1)
        (else (* x (factorial (- x 1))))
  )
)

(define (fib n)
  (cond
        ((= 0 n) 0)
        ((= 1 n) n)
        (else (+ (fib (- n 1)) (fib (- n 2))))
  )
)

(define (my-append a b)
  (cond
        ((equal? b nil) nil)
        ((equal? a nil) (cons (car b) (my-append a (cdr b))))
        (else (cons (car a) (my-append (cdr a) b)))
  )
)

(define (duplicate lst)
  (cond
        ((equal? nil lst) nil)
        (else (cons (car lst) (cons (car lst) (duplicate (cdr lst)))))
  )
)

(define (insert element lst index)
  (cond
        ((= index 0) (cons element (cons (car lst) (cdr lst))))
        (else (cons (car lst) (insert element (cdr lst) (- index 1))))
  )
) 