(define (applyRewriteRules op lft rgt)
  (cond

    ((add-num-num? op lft rgt)
        (+ lft rgt))

    ((add-term-num? op lft rgt)
        (rewriteNode (list `+ rgt lft)))

    ((sub-term-num? op lft rgt)
        (rewriteNode (list `+ (* rgt -1) lft)))

    ((add-term-addterm? op lft rgt)
        (rewriteNode (list op rgt lft)))

    (else (list op lft rgt))))
