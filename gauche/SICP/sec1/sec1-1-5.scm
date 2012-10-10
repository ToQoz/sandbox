#!/usr/bin/env gosh
;; -*- mode: gauche; coding: utf-8; -*-

;; procedure substitution model
(define-module sec1.sec1-1-5
  (export sample-func))

(define (square x) (* x x))
(define (sum-of-squares x y)
  (+ (square x) (square y)))
(define (sample-func x)
  (sum-of-squares (+ x 1) (* x 2)))

;; (sample-func 5)
;; => (sum-of-squares (+ a 1) (* a 2))
;; => (sum-of-squares (+ 5 1) (* 5 2))
;; => (+ (suquare 6) (square 10))
;; => (+ (6 * 6) (6 * 10))
;; => (+ 36 100)
;; => 136

;; EOF
