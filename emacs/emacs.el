;;; enable menu bar
(menu-bar-mode t)

(setq prelude-whitespace nil)
(setq-default fill-column 80)

;;; js2-mode
(setq js2-mode-hook
      '(lambda () (progn
                    (setq-default js2-basic-offset 2)
                    (set-variable 'indent-tabs-mode nil))))

;;; AUCTeX configuration

;; Install AUCTeX In Emacs 24+, Simply do M-x package-list-packages RET, mark
;; the auctex package for installation with i, and hit x to execute the
;; installation procedure.
;;
;; And follow http://www.gnu.org/software/auctex/manual/auctex.html#Quick-Start:
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)

;;; google-c-style:

;(require 'google-c-style)
;(load-file "~/.emacs.d/personal/google-c-style.el")  

(add-hook 'c-mode-hook 'google-set-c-style)
(add-hook 'c-mode-hook 'google-make-newline-indent)

(add-hook 'c++-mode-hook 'google-set-c-style)
(add-hook 'c++-mode-hook 'google-make-newline-indent)

;; Set transparent background:
(set-frame-parameter (selected-frame) 'alpha '(95 100))
(add-to-list 'default-frame-alist '(alpha 95 100))

;;; Keybinding to control current window's size

;(global-set-key [C-s-left] 'shrink-window-horizontally)
;(global-set-key [C-s-right] 'enlarge-window-horizontally)
;(global-set-key [C-s-down] 'shrink-window)
;(global-set-key [C-s-up] 'enlarge-window)

;; Resizing in Big Leaps (http://www.emacswiki.org/emacs/WindowResize)

(defun win-resize-top-or-bot ()
  "Figure out if the current- window is on top, bottom or in the
middle"
  (let* ((win-edges (window-edges))
	 (this-window-y-min (nth 1 win-edges))
	 (this-window-y-max (nth 3 win-edges))
	 (fr-height (frame-height)))
    (cond
     ((eq 0 this-window-y-min) "top")
     ((eq (- fr-height 1) this-window-y-max) "bot")
     (t "mid"))))

(defun win-resize-left-or-right ()
  "Figure out if the current window is to the left, right or in the
middle"
  (let* ((win-edges (window-edges))
	 (this-window-x-min (nth 0 win-edges))
	 (this-window-x-max (nth 2 win-edges))
	 (fr-width (frame-width)))
    (cond
     ((eq 0 this-window-x-min) "left")
     ((eq (+ fr-width 4) this-window-x-max) "right")
     (t "mid"))))

(defun win-resize-enlarge-horiz ()
  (interactive)
  (cond
   ((equal "top" (win-resize-top-or-bot)) (enlarge-window -1))
   ((equal "bot" (win-resize-top-or-bot)) (enlarge-window 1))
   ((equal "mid" (win-resize-top-or-bot)) (enlarge-window -1))
   (t (message "nil"))))

(defun win-resize-minimize-horiz ()
  (interactive)
  (cond
   ((equal "top" (win-resize-top-or-bot)) (enlarge-window 1))
   ((equal "bot" (win-resize-top-or-bot)) (enlarge-window -1))
   ((equal "mid" (win-resize-top-or-bot)) (enlarge-window 1))
   (t (message "nil"))))

(defun win-resize-enlarge-vert ()
  (interactive)
  (cond
   ((equal "left" (win-resize-left-or-right)) (enlarge-window-horizontally -1))
   ((equal "right" (win-resize-left-or-right)) (enlarge-window-horizontally 1))
   ((equal "mid" (win-resize-left-or-right)) (enlarge-window-horizontally -1))))

(defun win-resize-minimize-vert ()
  (interactive)
  (cond
   ((equal "left" (win-resize-left-or-right)) (enlarge-window-horizontally 1))
   ((equal "right" (win-resize-left-or-right)) (enlarge-window-horizontally -1))
   ((equal "mid" (win-resize-left-or-right)) (enlarge-window-horizontally 1))))

; or change to [C-M-<key>]:
(global-set-key [C-s-down] 'win-resize-minimize-vert)
(global-set-key [C-s-up] 'win-resize-enlarge-vert)
(global-set-key [C-s-left] 'win-resize-minimize-horiz)
(global-set-key [C-s-right] 'win-resize-enlarge-horiz)
(global-set-key [C-s-up] 'win-resize-enlarge-horiz)
(global-set-key [C-s-down] 'win-resize-minimize-horiz)
(global-set-key [C-s-left] 'win-resize-enlarge-vert)
(global-set-key [C-s-right] 'win-resize-minimize-vert)

