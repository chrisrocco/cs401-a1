
;;============================================
;; PATTERN MATCHING
;;============================================

(define (is-plus? node)
    (equal? node `+))

(define (is-sub? node)
    (equal? node `-))

(define (is-mul? node)
    (equal? node `*))

(define (is-num? node)
    (number? node))

(define (is-sum? node)
    (and (pair? node) (equal? (car node) `+)))

(define (is-product node)
    (and (pair? node) (equal? (car node) `*)))

(define (is-difference node)
    (and (pair? node) (equal? (car node) `-)))

(define (is-operation? node)
    (or (is-sum? node) (is-product node) (is-difference node)))

(define (add-num-num? op lft_term rgt_term)
    (and (is-plus? op) (is-num? lft_term) (is-num? rgt_term)))

(define (add-term-num? op lft_term rgt_term)
    (and (is-plus? op) (is-num? rgt_term)))

(define (sub-term-num? op lft rgt)
    (and (is-sub? op) (is-num? rgt)))

(define (add-term-addterm? op lft rgt)
    (and (is-plus? op) (is-operation? lft) (is-sum? rgt)))

(define (mul-term-subterm? op lft rgt)
    (and (is-mul? op) (is-operation? lft) (is-difference? rgt)))