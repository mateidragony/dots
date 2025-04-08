;;; company-rcp.el --- Company configuration
;;; Code:

(require 'company-irony)

(use-package company
  :bind (("<ESC> <ESC>" . company-abort))
  :custom
  (lsp-completion-provider :capf)
  (company-minimum-prefix-length 1)
  (company-idle-delay 0)
  (company-tooltip-align-annotations t)
  (company-tooltip-margin 1)
  (company-text-icons-mapping 'company-vscode-icons-mapping)
  (company-frontends '(company-preview-frontend company-pseudo-tooltip-frontend))
  :config
  (add-to-list 'company-backends 'company-irony-c-headers)
  (add-to-list 'company-backends 'company-irony)
  )

(provide 'company-rcp)
;;; Commentary:
;; emacs company config
;; Local Variables:
;; End:
;;; company-rcp.el ends here
