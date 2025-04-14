;;; company-rcp.el --- Company configuration
;;; Code:

(require 'company-irony)

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
  (add-to-list 'company-backends 'company-web-html))

(provide 'company-rcp)
;;; Commentary:
;; emacs company config
;; Local Variables:
;; End:
;;; company-rcp.el ends here
