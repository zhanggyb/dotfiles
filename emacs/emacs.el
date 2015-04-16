;; enable menu bar
(menu-bar-mode t)

(setq prelude-whitespace nil)

;; google-c-style:

;(require 'google-c-style)
;(load-file "~/.emacs.d/personal/google-c-style.el")  

(add-hook 'c-mode-hook 'google-set-c-style)
(add-hook 'c-mode-hook 'google-make-newline-indent)

(add-hook 'c++-mode-hook 'google-set-c-style)
(add-hook 'c++-mode-hook 'google-make-newline-indent)
