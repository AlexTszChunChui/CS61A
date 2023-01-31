(define (filter-lst fn lst)
  (cond
        ((equal? lst nil) nil)
        ((fn (car lst)) (cons (car lst) (filter-lst fn (cdr lst))))
        (else (filter-lst fn (cdr lst)))
  )
)

;;; Tests
(define (even? x)
  (= (modulo x 2) 0))
(filter-lst even? '(0 1 1 2 3 5 8))
; expect (0 2 8)


(define (interleave first second)
  (cond
        ((and (equal? first nil) (equal? second nil)) nil)
        ((and (equal? first nil) (not (equal? second nil))) second)
        ((and (equal? second nil) (not (equal? first nil))) first)
        (else (cons (car first) (interleave second (cdr first))))
  )
)

(interleave (list 1 3 5) (list 2 4 6))
; expect (1 2 3 4 5 6)

(interleave (list 1 3 5) nil)
; expect (1 3 5)

(interleave (list 1 3 5) (list 2 4))
; expect (1 2 3 4 5)


(define (accumulate combiner start n term)
  (begin
    (define (in_accum combiner n term times)
      (cond
            ((= times n) (term n))
            (else (combiner (term times) (in_accum combiner n term (+ times 1))))
      )
    )  
    (combiner start (in_accum combiner n term 1))
  )
)



(define (no-repeats lst)
  (if (equal? lst nil)
      nil
      (cons (car lst) (no-repeats (filter-lst (lambda (x) (not (= x (car lst)))) (cdr lst))))  
)
)

