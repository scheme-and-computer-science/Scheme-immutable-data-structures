
(import
 (chibi test)
 (comparators)
 (scheme base)
 (scheme write)
 (srfi 1)
 (srfi 2)
 (srfi 26)
 (srfi 27)
 (srfi 95)
 (util))

;; define-syntax-rule
(let ()
  (define-syntax-rule (infix L OP R)
    (OP L R))
  (test 4 (infix 1 + 3)))

;; define-singleton
(let ()
  (define-singleton a a?)
  (test-not (eq? a #f))
  (test-not (eq? a '()))
  (test-assert (procedure? a?))
  (test-assert (a? a))
  
  (define-singleton b b?)
  (test-not (eq? b #f))
  (test-not (eq? b '()))
  (test-assert (procedure? b?))
  (test-assert (b? b))

  (test-not (a? b))
  (test-not (b? a)))

;; flip
(test 2 ((flip /) 5 10))

;; identity
(test 'symbol (identity 'symbol))
(test (iota 16) (map identity (iota 16)))

;; constant-thunk
(let ((seven (constant-thunk 7)))
  (test 7 (seven))
  (test 7 (seven)))

;; add1, sub1
(test 1 (add1 0))
(test 2 (add1 1))
(test 0 (sub1 1))
(test 1 (sub1 2))

;; random-permutation
(and-let* ((src (make-random-source))
	   ((random-source-pseudo-randomize! src 0 0))
	   (p0 (random-permutation src 10))
	   (p1 (random-permutation src 10))
	   (p2 (random-permutation src 10)))
  (test-assert (list? p0))
  (test-assert (list? p1))
  (test-assert (list? p1))
  (test 10 (length p0))
  (test 10 (length p1))
  (test 10 (length p2))
  (test (iota 10) (sort p0 <))
  (test (iota 10) (sort p1 <))
  (test (iota 10) (sort p2 <))
  ;; note that this test _might_ be wrong, because there is an
  ;; extremely remote possibility that a correct implementation might
  ;; return two identical permutations
  (test-not (equal? p0 p1))
  (test-not (equal? p0 p2))
  (test-not (equal? p1 p2))
  )

;; pseudorandom-permutations
(test '()
      (pseudorandom-permutations 0 3 0))
(test '((2 5 1 6 7 0 4 3))
      (pseudorandom-permutations 1 8 0))
(test '((3 4 5 1 2 7 0 6) (4 5 2 3 0 1 7 6) (2 5 1 6 7 0 4 3))
      (pseudorandom-permutations 3 8 0))

;; length-at-least?
(test #true (length-at-least? '(1 2 3) -1))
(test #true (length-at-least? '(1 2 3) 0))
(test #true (length-at-least? '(1 2 3) 1))
(test #true (length-at-least? '(1 2 3) 2))
(test #true (length-at-least? '(1 2 3) 3))
(test #false (length-at-least? '(1 2 3) 4))
(test #true (length-at-least? '() 0))

;; powerset
(test '(()) (powerset 0))
(test-assert (lset= (powerset 1)
		    '(() (0))))
(test-assert (lset= (powerset 2)
		    '(() (0) (0 1) (1))))
(test-assert (lset= (powerset 3)
		    '(() (0) (0 1) (0 1 2) (1) (1 2) (2))))
(test-assert (lset= (powerset 4)
		    '(() (0) (0 1) (0 1 2) (0 1 2 3) (0 2) (0 2 3) (0 3)
		      (1) (1 2) (1 2 3) (1 3)
		      (2) (2 3)
		      (3))))

;; boolean
(test #f (boolean #f))
(test #t (boolean #t))
(test #t (boolean 0))
(test #t (boolean '()))

;; left-associative
