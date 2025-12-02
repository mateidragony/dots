;;; company-rcp.el --- Company configuration
;;; Code:
(require 'company)

(use-package fussy
  :ensure t
  :config
  (fussy-setup)
  (fussy-eglot-setup)
  (fussy-company-setup)
  (setq completion-styles '(basic partial-completion emacs22))
  )

(defvar company-mc-icons-mapping company-vscode-icons-mapping)

(defun company-mc-icons-margin (candidate selected)
  "Margin function which returns icons from vscode's dark theme."
  (company--render-icons-margin company-mc-icons-mapping
                                (expand-file-name "icons/company-mc"  mc/emacs-config-directory)
                                candidate
                                selected))


(use-package flx
  :ensure t)

(use-package company
  :ensure t
  :bind (("<ESC> <ESC>" . company-abort))
  :custom
  (lsp-completion-provider :capf)
  (company-minimum-prefix-length 1)
  (company-idle-delay 0)
  (company-tooltip-align-annotations t)
  (company-format-margin-function #'company-mc-icons-margin)
  (company-icon-margin 3)
  (company-frontends '(company-pseudo-tooltip-frontend))
  (company-transformers '(company-sort-prefer-same-case-prefix
						  company-sort-by-occurrence))
  :config
  (add-to-list 'company-backends '(company-capf company-yasnippet company-web-html))
  )



(provide 'company-rcp)
;;; Commentary:
;; emacs company config
;; Local Variables:
;; End:
;;; company-rcp.el ends here
