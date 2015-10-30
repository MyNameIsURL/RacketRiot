#lang racket
(require 2htdp/universe)
(require 2htdp/image)

; physical constants 
(define HEIGHT 180)
(define WIDTH 80)
(define XSHOTS (/ WIDTH 2))
 
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
(define (tock w)
  (cond
    [(empty? w) '()]
    [else (cons (sub1 (first w)) (tock (rest w)))]))
 
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
     (draw-columns)(draw-rows)
     ]
    [else (place-image BALLOON XSHOTS (first w) (to-image (rest w)))]))

; Draw columns
(define (draw-columns)
  (add-line
   (add-line
    (add-line
     (add-line
      (add-line
       (add-line
        (add-line BACKGROUND 70 0 70 180 "black")
        60 0 60 180 "black")
       50 0 50 180 "black")
      40 0 40 180 "black")
     30 0 30 180 "black")
    20 0 20 180 "black")
   10 0 10 180 "black")
  )

; Draw rows
(define (draw-rows)
  (add-line
   (add-line
    (add-line
     (add-line
      (add-line
       (add-line
        (add-line
         (add-line
          (add-line
           (add-line
            (add-line
             (add-line
              (add-line
               (add-line
                (add-line
                 (add-line
                  (add-line BACKGROUND 0 10 80 10 "black")
                  0 20 80 20 "black")
                 0 30 80 30 "black")
                0 40 80 40 "black")
               0 50 80 50 "black")
              0 60 80 60 "black")
             0 70 80 70 "black")
            0 80 80 80 "black")
           0 90 80 90 "black")
          0 100 80 100 "black")
         0 110 80 110 "black")
        0 120 80 120 "black")
       0 130 80 130 "black")
      0 140 80 140 "black")
     0 150 80 150 "black")
    0 160 80 160 "black")
   0 170 80 170 "black"))
