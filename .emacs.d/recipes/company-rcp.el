;;; company-rcp.el --- Company configuration
;;; Code:

(require 'company-irony)

(use-package lsp-mode
  :ensure t
  :custom
  (lsp-headerline-breadcrumb-enable nil))

(use-package company
  :ensure t
  :bind (("<ESC> <ESC>" . company-abort))
  :custom
  (lsp-completion-provider :capf)
  (company-minimum-prefix-length 1)
  (company-idle-delay 0)
  (company-tooltip-align-annotations t)
  (company-format-margin-function #'company-text-icons-margin)
  (company-frontends '(company-preview-frontend company-pseudo-tooltip-frontend))
  :config
  (add-to-list 'company-backends 'company-irony-c-headers)
  (add-to-list 'company-backends 'company-irony)
  (add-to-list 'company-backends 'company-css)
  (add-to-list 'company-backends 'company-web-html)
  (add-to-list 'company-backends 'company-yasnippet)
  (add-to-list 'company-backends 'company-capf)
  )

(provide 'company-rcp)
;;; Commentary:
;; emacs company config
;; Local Variables:
;; End:
;;; company-rcp.el ends here
