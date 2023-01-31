(define (split-at lst n)
  (begin
    (define (first_nth_value lst n)
      (if (= n 0)
          nil
          (cons (car lst) (first_nth_value (cdr lst) (- n 1)))
      )
    )
    (define (remain lst n)
      (if (= n 0)
          lst
          (remain (cdr lst) (- n 1))
      )
    )
    (if (< (length lst) n)
        (cons lst nil)
        (cons (first_nth_value lst n) (remain lst n))
    )
  )
)


(define (compose-all funcs)
  (define (compose num)
    (if (null? funcs)
    num
    ((compose-all (cdr funcs))((car funcs) num))
    )
  )
  compose
)

