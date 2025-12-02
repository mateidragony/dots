;;; eglot-rcp.el --- Eglot configuration
;;; Code:

(use-package eglot
  :ensure t
  :config
  (dolist (el '((css-mode . ("vscode-css-language-server" "--stdio"))
				(java-mode . ("jdtls" "--stdio"))
				((html-mode web-mode) . ("vscode-html-language-server" "--stdio"))))
	(add-to-list 'eglot-server-programs el)))

(add-hook 'eglot-managed-mode-hook #'yas-minor-mode)
(add-hook 'eglot-managed-mode-hook #'company-mode)
(add-hook 'eglot-managed-mode-hook (lambda ()
									 (add-to-list 'company-backends
												  '(company-capf company-yasnippet company-web-html))))

(provide 'eglot-rcp)
;;; Commentary:
;; emacs eglot config
;; Local Variables:
;; End:
;;; eglot-rcp.el ends here
