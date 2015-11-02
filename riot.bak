#lang racket
(require 2htdp/universe)
(require 2htdp/image)

; physical constants 
(define HEIGHT 180)
(define WIDTH 80)
(define XSHOTS (/ WIDTH 3))
 
; graphical constants 
(define BACKGROUND (empty-scene WIDTH HEIGHT))
(define BALLOON (circle 3 "solid" "red"))
 
; A ShotWorld is List-of-numbers. 
; interpretation the collection of shots fired and moving straight up
 
; ShotWorld -> ShotWorld 
(define (main w0)
  (big-bang w0
    [on-tick tock]
    [on-key keyh]
    [to-draw to-image]))
 
; ShotWorld -> ShotWorld 
; moves each shot up by one pixel 
;(define (tock w)
; (cond
;    [(empty? w) '()]
;    [else (cons (sub1 (first w)) (tock (rest w)))]))
(define (tock w)
  (define randomX (random (/ WIDTH 10)))
  (define randomY (random (/ HEIGHT 10)))
  (cond
    [(empty? w) '()]
    [else (place-image/align BALLOON (* 10 randomX) (* 10 randomY) "center" "center")]))
 
; ShotWorld KeyEvent -> ShotWorld 
; adds a shot to the world if the space bar was hit 
(define (keyh w ke)
  (cond
    [(key=? ke " ") (cons HEIGHT w)]
    [else w]))
 
; ShotWorld -> Image 
; adds each y on w at (MID,y) to the background image 
(define (to-image w)
  (cond
    [(empty? w)
     BACKGROUND
     (draw-rows)
     ]
    [else (place-image BALLOON XSHOTS (first w) (to-image (rest w)))]))

; Draw columns
(define (draw-columns)
  (beside(rectangle 10 10 "outline" "black")
         (rectangle 10 10 "outline" "black")
         (rectangle 10 10 "outline" "black")
         (rectangle 10 10 "outline" "black")
         (rectangle 10 10 "outline" "black")
         (rectangle 10 10 "outline" "black")
         (rectangle 10 10 "outline" "black")
         (rectangle 10 10 "outline" "black")
         (rectangle 10 10 "outline" "black")))
; Draw rows
(define (draw-rows)
  (above (draw-columns)
         (draw-columns)
         (draw-columns)
         (draw-columns)
         (draw-columns)
         (draw-columns)
         (draw-columns)
         (draw-columns)
         (draw-columns)
         (draw-columns)
         (draw-columns)
         (draw-columns)
         (draw-columns)
         (draw-columns)
         (draw-columns)
         (draw-columns)
         (draw-columns)
         (draw-columns)))
