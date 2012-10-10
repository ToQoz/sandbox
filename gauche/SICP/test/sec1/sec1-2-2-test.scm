#!/usr/bin/env gosh

(use gauche.test)

(test-start "sec1.sec1-2-2")
(use sec1.sec1-2-2)

(test-section "count-change")

(test* "case : arg `amount` = 100"  292 (count-change 100))

(test-end)

;; EOF
