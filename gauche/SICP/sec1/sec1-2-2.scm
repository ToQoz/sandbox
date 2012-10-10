#!/usr/bin/env gosh
;; -*- mode: gauche; coding: utf-8; -*-

(define-module sec1.sec1-2-2
  (export count-change))

(define (count-change amount)
  (cc amount 5))
(define (cc amount kinds-of-coins)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (= kinds-of-coins 0)) 0)
        (else (+ (cc amount
                     (- kinds-of-coins 1)) ;; calc number of cases when kinds-of-coints is smaller than 1.
                 (cc (- amount (first-denomination kinds-of-coins)) ;; a rest after minused first change
                     kinds-of-coins)))))
(define (first-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1)
        ((= kinds-of-coins 2) 5)
        ((= kinds-of-coins 3) 10)
        ((= kinds-of-coins 4) 25)
        ((= kinds-of-coins 5) 50)))
