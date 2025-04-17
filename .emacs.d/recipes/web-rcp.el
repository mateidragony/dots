;;; web-rcp.el --- Web configuration
;;; Code:

(use-package emmet-mode
  :ensure t
  :bind
  (:map emmet-mode-keymap
   ("C-M-<left>"  . backward-sexp)
   ("C-M-<right>" . forward-sexp)))

(use-package web
  :ensure t
  :mode ("\\.html\\'" . web-mode)
  :hook ((web-mode . emmet-mode)
		 (web-mode . lsp-mode)
		 (web-mode . auto-rename-tag-mode))
  :custom
  (web-mode-enable-auto-indentation nil)
  )

(provide 'web-rcp)
;;; Commentary:
;; emacs web config
;; Local Variables:
;; End:
;;; web-rcp.el ends here
