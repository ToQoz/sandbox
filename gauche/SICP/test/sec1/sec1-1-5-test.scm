#!/usr/bin/env gosh

(use gauche.test)

(test-start "sec1.sec1-1-5")
(use sec1.sec1-1-5)

(test-section "sample-func")

(test* "case : arg `x` = 5"  136 (sample-func 5))

(test-end)

;; EOF
