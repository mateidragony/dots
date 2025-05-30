;;; lsp-rcp.el --- Lsp configuration
;;; Code:

(use-package lsp-mode
  :ensure t
  :custom
  (lsp-headerline-breadcrumb-enable nil)
  (tab-width 4))

(use-package lsp-ui
  :ensure t
  :after lsp-mode
  :commands lsp-ui-mode
  :init
  (setq lsp-ui-doc-border   "#4f4239"
        lsp-ui-doc-position 'at-point
        lsp-ui-sideline-show-code-actions nil
        lsp-ui-sideline-show-hover nil))

(add-hook 'lsp-mode-hook #'yas-minor-mode)

(provide 'lsp-rcp)
;;; Commentary:
;; emacs lsp config
;; Local Variables:
;; End:
;;; lsp-rcp.el ends here

