;;; web-rcp.el --- Web configuration
;;; Code:

(use-package web
  :ensure t
  :mode ("\\.html\\'" . web-mode)
  :hook ((web-mode . emmet-mode)
	 (web-mode . lsp-mode)
	 (web-mode . auto-rename-tag-mode))
  )

(provide 'web-rcp)
;;; Commentary:
;; emacs web config
;; Local Variables:
;; End:
;;; web-rcp.el ends here
