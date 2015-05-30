;; -*-Scheme-*-

(define-library (pure)
  (import
   (comparators)
   (generators)
   (scheme base)
   (scheme case-lambda)
   (scheme lazy)
   (scheme write) ; TODO remove
   (srfi 1)
   (srfi 8)
   (srfi 26))

  ;; ideque
  (export
   ideque
   ideque-tabulate
   ideque-unfold
   ideque-unfold-right
   ideque?
   ideque-empty?
   ideque-front
   ideque-back
   ideque-remove-front
   ideque-remove-back
   ideque-add-front
   ideque-add-back
   ideque-take
   ideque-take-right
   ideque-drop
   ideque-drop-right
   ideque-split-at
   ideque-length
   ideque-append
   ideque-concatenate
   ideque-reverse
   ideque-count
   ideque-zip
   ideque-map
   ideque-for-each
   ideque-fold
   ideque-fold-right
   ideque-append-map
   ideque-filter
   ideque-remove
   ideque-partition
   ideque-find
   ideque-find-right
   ideque-take-while
   ideque-take-while-right
   ideque-drop-while
   ideque-drop-while-right
   ideque-span
   ideque-break
   ideque-any
   ideque-every
   list->ideque
   ideque->list
   ideque-comparator)

  (include "pure-impl.scm"))
