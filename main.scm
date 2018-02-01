
(define input `(- (+ x 10) 9))


;;============================================
;; PATTERN MATCHING
;;============================================

(load "rules.scm")


;;============================================
;; TERM RE-WRITING
;; re-writes node by matching rules
;;============================================

(load "rewrites.scm")


;;============================================
;; AST WALK
;; traverses the AST in post-order, applying rewrite rules at each node.
;;============================================

(display " \n")
(define (rewriteNode node)
  (if (is-operation node)
    (applyRewriteRules
        (car node)
        (rewriteNode (cadr node))
        (rewriteNode (caddr node)))
    node))

;; (trace rewriteNode)
(display (rewriteNode input))