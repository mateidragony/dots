;;; racket-rcp.el --- Racket configuration
;;; Code:

(use-package racket-mode
  :ensure t
  :bind (:map racket-mode-map
		 ("C-c C-l" . racket-run-module-at-point)
		 ("C-c C-k" . racket-repl-clear-leaving-last-prompt))
  :hook
  ((racket-mode . racket-xp-mode)
   (racket-mode . company-mode))
  :config
  (rainbow-delimiters-mode 1)
)

(use-package racket-xp
  :custom
  (racket-xp-eldoc-level 0)
  (racket-show-functions '()))

(provide 'racket-rcp)
;;; Commentary:
;; emacs racket config
;; Local Variables:
;; End:
;;; racket-rcp.el ends here
