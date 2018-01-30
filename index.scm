(define input `(+ 2 (+ 10 8)))

(define (applyRewriteRules node) (
  ;; loop through the rules, return the result of the first one that applies
  node
))


(display " \n")
;; Post-order traversal of tree (represented as list)
(define (rewriteNode node)
  (if (not (pair? node))
    ;; if it is an atom, just return it
    node
    ;; else, evaluate the terms
    (let (
        (operationTerm (car node))
        (leftTerm (rewriteNode (cadr node)))
        (rightTerm (rewriteNode (caddr node)))
      )
      ;; apply the re-write rules
      (display operationTerm) (display " ")
      (display leftTerm) (display " ")
      (display rightTerm) (display " ")
      ;; return the result
      applyRewriteRules node
    )
  ))

;; (trace rewriteNode)
(rewriteNode input)