(define (applyRewriteRules op lft_term rgt_term)
  (cond

    ((add-num-num? op lft_term rgt_term)
        (+ lft_term rgt_term))

    ((add-term-num? op lft_term rgt_term)
        (rewriteNode (list `+ rgt_term lft_term)))

    ((sub-term-num? op lft_term rgt_term)
        (rewriteNode (list `+ (* rgt_term -1) lft_term)))

    (else (list op lft_term rgt_term))))
