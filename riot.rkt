#lang slideshow

(require 2htdp/image)

; physical constants 
(define HEIGHT 180)
(define WIDTH 80)
(define BOXSIZE 10)
(define XSHOTS (/ WIDTH 2))
 
; graphical constants
(empty-scene WIDTH HEIGHT)

; square function


; col function
(define (col size)
  (filled-rectangle size size))

(col 10)