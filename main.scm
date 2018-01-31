;;============================================
;; Constants
;;============================================

(define input `(+ 2 (+ 10 8)))

(define rules `())


;;============================================
;; Rewrite Procedures
;;============================================

;; loops over list of rules, returning the result of the first one that matches
(define rewriteRecursive
    (lambda (rule node)
        (cond ((null? rule) nil)) ;; if there are no more rules, stop
            (else (cond (not (null? (rule node))) (rule node)   ;; if the current rule matches, return it
                (else (rewriteRecursive cdr(rule) node))    ;; recurse on the next rule
    )
)

;; wrapper for recursive function
(define (applyRewriteRules node) (
  (rewriteRecursive car(rules) node)
))



;;============================================
;; AST Walk
;;============================================

;; traverses the AST in post-order, applying rewrite rules at each node.
(display " \n")
(define (rewriteNode node)
  (if (not (pair? node))
    ;; if it is an atom, just return it
    node
    ;; else, evaluate the terms
    (let ((operationTerm (car node))
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