
(define input `(+ (+ 8 (+ 1 1)) (+ x 10)))


;;============================================
;; PATTERN MATCHING
;;============================================

(define (is-plus? node) (equal? node `+))
(define (is-num? node) (number? node))
(define (is-sum? node)
    (and (pair? node) (equal? (car node) `+)))
(define (is-product node)
    (and (pair? node) (equal? (car node) `*)))
(define (is-difference node)
    (and (pair? node) (equal? (car node) `-)))
(define (is-operation node)
    (or (is-sum? node) (is-product node) (is-difference node)))
(define (add-num-num? op lft_term rgt_term)
    (and (is-plus? op) (is-num? lft_term) (is-num? rgt_term)))
(define (add-term-num? op lft_term rgt_term)
    (and (is-plus? op) (is-num? rgt_term)))



;;============================================
;; TERM RE-WRITING
;; re-writes node by matching rules
;;============================================

(define (applyRewriteRules op lft_term rgt_term)
  (cond
    ((add-num-num? op lft_term rgt_term)
        (+ lft_term rgt_term))
    ((add-term-num? op lft_term rgt_term)
        (rewriteNode (list `+ rgt_term lft_term)))
    (else (list op lft_term rgt_term))
  )
)



;;============================================
;; AST WALK
;; traverses the AST in post-order, applying rewrite rules at each node.
;;============================================

(display " \n")
(define (rewriteNode node)
  (if (is-operation node)
    (applyRewriteRules (car node)
        (rewriteNode (cadr node))
        (rewriteNode (caddr node)))
    node
  )
)

;; (trace rewriteNode)
(display (rewriteNode input))