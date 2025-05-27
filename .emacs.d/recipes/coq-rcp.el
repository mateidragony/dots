;;; coq-rcp.el --- Coq configuration
;;; Code:

(use-package proof-general
  :ensure t)

(use-package company-coq
  :ensure t)

(use-package coq
  :hook
  (coq-mode-hook . coq-start)
  :bind
  (:map coq-mode-map
		("M-<down>"      . scroll-up-line)
		("M-<up>"        . scroll-down-line)
		("C-c C-<right>" . proof-assert-next-command-interactive))
  :custom
  (proof-splash-enable nil)
  (coq-compile-before-require t)
  :config
  (company-coq-features/prettify-symbols -1)
  )

(global-prettify-symbols-mode -1)
(add-hook 'coq-mode-hook #'company-coq-mode)
(add-hook 'company-coq-mode-hook (lambda () (company-coq-features/prettify-symbols -1)))

(provide 'coq-rcp)
;;; Commentary:
;; emacs coq config
;; Local Variables:
;; End:
;;; coq-rcp.el ends here
